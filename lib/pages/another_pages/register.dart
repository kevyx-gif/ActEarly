import 'package:actearly/utils/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:actearly/widgets/dropdown.dart';
//toast
import 'package:fluttertoast/fluttertoast.dart';
//platforms
import 'dart:io' show Platform;
//Text Imports
import 'package:get/get.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({ super.key });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
  
}

class _RegisterPageState extends State<RegisterPage> {

  final email = TextEditingController();
  final password = TextEditingController();
  final userType = TextEditingController();
  final provinceTerritory = TextEditingController();
  final firebase = FirebaseFirestore.instance;
  final emailKey = GlobalKey<FormState>();
  final passKey = GlobalKey<FormState>();  //

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
      //print('ERROR '+e.toString());
      messageToast("ERROR...", context);
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
                child: Form(key: emailKey,child: TextFormField(
                  controller: email,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'correo',
                  ),   
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                ),
            ),
          ),
          Center(
               child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Form(key: passKey,child:TextFormField(
                  controller: password,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'password',
                  ),
                  validator: (valuePass) {
                    if (valuePass == null || valuePass.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },   
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
              onPressed: () async {
                if (emailKey.currentState!.validate() && passKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );

                  print('Enviando datos...');
                  registerUser();
                  messageToast("Hecho", context);
                  Navigator.pushNamed(context, '/login');
                  
                }
                else{
                  messageToast("Error poner mas texto", context);
                }
              },
              child: Text('Registrarse'),
            ),   
          ),
        ],  
      ),
    );
  }
}