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
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
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
                        Navigator.pushNamed(context, '/main');
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
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text('Register'),
              ),
            ),
          ],
        ));
  }
}
