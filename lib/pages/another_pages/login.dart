import "package:flutter/material.dart";
import 'package:actearly/utils/futures.dart';
//Text Imports
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
        ),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'correo',
                  ),
                  controller: email,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'contraseña',
                  ),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    //Found Email Navigator.pushNamed(context, '/main');
                    if (await searchByFieldInCollection(
                        'users', 'email', email.text)) {
                      //found password
                      if (await searchByFieldInCollection(
                          'users', 'password', password.text)) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              // Retrieve the text the that user has entered by using the
                              // TextEditingController.
                              content: Text('Cuenta logueada con exito'),
                            );
                          },
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          'wrongPassword'.tr,
                          textAlign: TextAlign.center,
                        )));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        'wrongEmail'.tr,
                        textAlign: TextAlign.center,
                      )));
                    }
                  },
                  child: const Text('main')),
            ),
          ],
        ));
  }
}
