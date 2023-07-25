import "package:flutter/material.dart";

class RegisterFirstPage extends StatefulWidget {
  const RegisterFirstPage({ super.key });

  @override
  State<RegisterFirstPage> createState() => _RegisterFirstPageState();
}

class _RegisterFirstPageState extends State<RegisterFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),  
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pushNamed(context, '/register');
          }, child: const Text('Sign in')),
      ),
    );
  }
}