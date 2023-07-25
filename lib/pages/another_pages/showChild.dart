import "package:flutter/material.dart";

class ShowChildPage extends StatefulWidget {
  const ShowChildPage({ super.key });

  @override
  State<ShowChildPage> createState() => _ShowChildPageState();
}

class _ShowChildPageState extends State<ShowChildPage> {
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