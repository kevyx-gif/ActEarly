import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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
  final firebase = FirebaseFirestore.instance;
  
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email.dispose();
    password.dispose();
    super.dispose();
  }

  registerUser() async{
    try{
      await firebase.collection('users').doc().set({
        "email": email.text,
        "password": password.text,
        }
      );
    }catch(e){
      print('ERROR '+e.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    List<String> listUser = <String>['Padre/Tutor Legal', 'Educador/Maestro', 'Usuario/Cuidador', 'Evaluador a domicilio'];
    List<String> listProvincesTerritory = <String>['Alberta', 'British Columbia', 'Manitoba', 'New Brunswick', 'Newfoundland and Labrador', 'Northwest Territories', 'Nova Scotia', 'Nunavut', 'Ontario', 'Prince Edward Islan', 'Quebec','Saskatchewan', 'Yukon'];
    
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
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'correo',
                  ),
                  
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
            child: DropdownButtonExample(listUser),   
            
          ),
          Center( 
            child: DropdownButtonExample(listProvincesTerritory),   
            
          ),
          Center( 
            child: ElevatedButton(
              onPressed: (){
                print('Enviando datos...');
                registerUser();
              },
              child: Text('Registrarse'),
              
            ),  
            
          ),
        ],  
      ),
    );
  }
}
