import "package:flutter/material.dart";
import 'package:actearly/widgets/dropdown.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({ super.key });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
  
}

class _RegisterPageState extends State<RegisterPage> {

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
    List<String> list = <String>['Padre/Tutor Legal', 'Educador/Maestro', 'Usuario/Cuidador', 'Evaluador a domicilio'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
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
            child: DropdownButtonExample(list),   
            
          ),
        ],  
      ),
    );
  }
}
