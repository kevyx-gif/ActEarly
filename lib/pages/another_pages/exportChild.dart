import "package:flutter/material.dart";

class ExportChildPage extends StatefulWidget {
  const ExportChildPage({ super.key });

  @override
  State<ExportChildPage> createState() => _ExportChildPageState();
}

class _ExportChildPageState extends State<ExportChildPage> {
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