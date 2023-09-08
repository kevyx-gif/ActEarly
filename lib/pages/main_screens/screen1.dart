import 'package:flutter/material.dart';

//import 'package:crud_firebase/services/firebase_service.dart'
class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: const Text('Sign in')),
      ),
    );
  }
}
