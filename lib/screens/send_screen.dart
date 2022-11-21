import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transfibank/widgets/widgets.dart';

import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../providers/providers.dart';

TextEditingController usernameController = TextEditingController();
TextEditingController amountController = TextEditingController();

class SendScreen extends StatefulWidget {
  const SendScreen({Key? key}) : super(key: key);

  @override
  State<SendScreen> createState() => _SendScreenState();
}

double total = 0;

class _SendScreenState extends State<SendScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userId = authProvider.user['id'];

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          title: const Text("Enviar dinero"),
          elevation: 0,
          backgroundColor: Colors.black87,
          systemOverlayStyle: const SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.transparent,
            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.light, // For Android (dark icons)
            statusBarBrightness: Brightness.dark, // For iOS (dark icons)
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.indigo,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ $total",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            total = total + 1000;
                          });
                        },
                        child: const Icon(
                          FontAwesomeIcons.add,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          total == 0 ? null : total = total - 1000;
                          setState(() {});
                        },
                        child: const Icon(
                          FontAwesomeIcons.minus,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),

              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.indigo,
                  width: 1,
                ),
              ),
              child: TextField(
                onChanged: (value) {
                  print(value);
                },
                cursorHeight: 25,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                controller: usernameController,
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.indigo,
                    fontSize: 20,
                  ),
                  // labelText: 'Nombre de usuario',
                  border: InputBorder.none,
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: 'username',
                ),
              ),
            ),
            // TextField(
            //   controller: amountController,
            //   // keyboardType: TextInputType.number,
            //   decoration: const InputDecoration(
            //     labelText: 'Monto',
            //     focusColor: Colors.indigo,
            //     fillColor: Colors.indigo,
            //     hoverColor: Colors.indigo,
            //     hintStyle: TextStyle(
            //       color: Colors.indigo,
            //       fontStyle: FontStyle.italic,
            //     ),
            //   ),
            // ),
            const Spacer(),
            const Divider(
              color: Colors.black12,
              thickness: 1,
              height: 0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              color: Colors.grey[200],
              child: Column(children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Resumen",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Monto a enviar",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "\$ $total",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Enviar a: ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      usernameController.text,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                OutlinedButton(
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
                                  "Enviando dinero...",
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

                    // Making request to the server
                    final username = usernameController.text;
                    final amount = amountController.text;

                    var baseUrl = Constants.baseUrl;
                    var headers = {'Content-Type': 'application/json'};
                    var url = Uri.http(
                      baseUrl,
                      '/api/transaction',
                    );
                    var body = jsonEncode({
                      "transaction": {
                        "amount": total,
                        "emitterId": userId,
                        "username": username
                      }
                    });

                    final response = await http.post(
                      url,
                      headers: headers,
                      body: body,
                    );

                    if (response.statusCode == 200) {
                      print(response.body);
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed("transaction_confirmed");
                    } else {
                      print(response.reasonPhrase);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.indigo.shade600,
                    fixedSize: Size(MediaQuery.of(context).size.width, 60),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                  ),
                  child: const Text("Enviar dinero"),
                ),
                const SizedBox(height: 40),
              ]),
            )
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
