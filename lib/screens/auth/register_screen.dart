import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final emailRegistrationController = TextEditingController();
final passwordRegistrationController = TextEditingController();

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                SvgPicture.asset(
                  "assets/logo.svg",
                  height: 100,
                  color: Colors.black87,
                ),
                const SizedBox(height: 40),
                Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  // margin: const EdgeInsets.symmetric(horizontal: 20.0),

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
                    controller: emailRegistrationController,
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
                      hintText: 'Correo electrónico',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  // margin: const EdgeInsets.symmetric(horizontal: 20.0),

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
                    controller: emailRegistrationController,
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
                      hintText: 'Nombre completo',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  // margin: const EdgeInsets.symmetric(horizontal: 20.0),

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
                    controller: emailRegistrationController,
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
                      hintText: 'Usuario',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  // margin: const EdgeInsets.symmetric(horizontal: 20.0),

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
                    controller: passwordRegistrationController,
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
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
                      hintText: 'Contraseña',
                    ),
                  ),
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
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.indigo.shade600,
                    fixedSize: Size(MediaQuery.of(context).size.width, 60),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                  ),
                  child: const Text("Crear cuenta"),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.indigo.shade600,
                    // border with
                    side: BorderSide.none,
                    backgroundColor: Colors.transparent,
                    fixedSize: Size(MediaQuery.of(context).size.width, 60),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                  ),
                  child: const Text("Iniciar sesión"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
