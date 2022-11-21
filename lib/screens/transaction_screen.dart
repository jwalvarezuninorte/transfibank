import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transfibank/widgets/widgets.dart';

import '../providers/providers.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final transactionProvider = Provider.of<TransactionProvider>(context);
    // final transactions = transactionProvider.transactions;

    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;
    final transactions = user['transactions'];

    List<Widget> transationItems = List.generate(
      transactions.length,
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
        title: const Text("Transacciones"),
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
        child: transactions.isNotEmpty
            ? Column(
                children: [
                  const SizedBox(height: 20),
                  ...transationItems,
                  const SizedBox(height: 20),
                  Row(
                    children: const [],
                  )
                ],
              )
            : const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: NoTransactions(),
              ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
