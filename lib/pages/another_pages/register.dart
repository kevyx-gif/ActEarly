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
//colores
import 'package:actearly/utils/colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({ super.key });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
  
}

class _RegisterPageState extends State<RegisterPage> {

  final nameUser = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final userType = TextEditingController();
  final provinceTerritory = TextEditingController();
  final question = TextEditingController();

  final firebase = FirebaseFirestore.instance;

  final nameUserKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormState>();
  final passKey = GlobalKey<FormState>();
  final userTypeKey = GlobalKey<FormState>();
  final provinceTerritoryKey = GlobalKey<FormState>();
  final questionKey = GlobalKey<FormState>();
   

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
        "nameUser": nameUser.text,
        "email": email.text,
        "password": password.text,
        "userType": userType.text,
        "provinceTerritory": provinceTerritory.text,
        "question": question.text,
        }
      );
    }catch(e){
      //print('ERROR '+e.toString());
      messageToast(context, "ERROR", ColorConstants.red, ColorConstants.white);
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
                child: Form(key: nameUserKey,child: TextFormField(
                  controller: nameUser,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'name',
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
            child: DropdownButtonExample(listUser, userType),  
          ),
          Center( 
            child: DropdownButtonExample(listProvincesTerritory, provinceTerritory),   
          ),
          Center(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Form(key: questionKey,child: TextFormField(
                  controller: question,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'password recovery question',
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
            child: ElevatedButton(
              onPressed: () async {
                if (emailKey.currentState!.validate() && passKey.currentState!.validate() &&nameUserKey.currentState!.validate() && questionKey.currentState!.validate()) {
                  print('Enviando datos...');
                  registerUser();
                  messageToast(context, "HECHO", ColorConstants.green, ColorConstants.white);
                  Navigator.pushNamed(context, '/login');
                  
                }
                else{
                  messageToast(context, "ERROR", ColorConstants.red, ColorConstants.white);
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