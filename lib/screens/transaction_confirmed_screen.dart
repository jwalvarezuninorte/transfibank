import 'package:flutter/material.dart';

class TransactionConfirmedScreen extends StatelessWidget {
  const TransactionConfirmedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFDFB),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "¡Dinero enviado!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "Su transacción se ha realizado con éxito",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Image(
                image: AssetImage("assets/dancing-duck-vibing-duck.gif")),
            const SizedBox(height: 60),
            OutlinedButton(
              onPressed: () {
                // Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.of(context).pushReplacementNamed("home");
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(
                  color: Colors.indigo.shade300,
                  width: 1,
                ),
                foregroundColor: Colors.indigo.shade600,
                fixedSize: Size(MediaQuery.of(context).size.width, 60),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
              ),
              child: const Text("Volver al inicio"),
            ),
          ],
        ),
      ),
    );
  }
}
