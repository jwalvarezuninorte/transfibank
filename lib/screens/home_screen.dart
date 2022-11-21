import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transfibank/widgets/widgets.dart';

import '../providers/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);
    // final transactions = transactionProvider.transactions;

    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;
    final transactions = user['transactions'];

    List<Widget> transationItems = List.generate(
      transactions.length >= 4 ? 4 : transactions.length,
      (index) {
        return TransactionTile(
          username: transactions[index]['username'],
          type: transactions[index]['type'],
          amount: transactions[index]['amount'],
          date: transactions[index]['date'],
        );
      },
    );

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.indigo,
                  child: Text(user['fullName'][0] ?? 'NN'),
                ),
                const SizedBox(width: 20),
                const Text("Transfibank"),
                const Spacer(),
                IconButton(
                  onPressed: () async {
                    // Show loading dialog
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          content: SizedBox(
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Cargando...",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 40),
                                CircularProgressIndicator(),
                              ],
                            ),
                          ),
                        );
                      },
                    );

                    await authProvider.loginWithID(
                      user['id'].toString(),
                    );

                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.refresh,
                    size: 26,
                    color: Colors.indigo[200],
                  ),
                )
              ],
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.transparent,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ClientCard(
              color: Colors.black87,
              assetName: "assets/transfibank_logo.svg",
              amount: user['totalCash'].toString(),
              name: user['username'],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Transacciones recientes",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            transactions.isNotEmpty
                ? Column(
                    children: [...transationItems],
                  )
                : const NoTransactions(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
