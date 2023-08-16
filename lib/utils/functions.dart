import 'package:actearly/utils/colors.dart';
import "package:flutter/material.dart";
import 'package:actearly/utils/futures.dart';

//toast
import 'package:fluttertoast/fluttertoast.dart';
//platforms
import 'dart:io' show Platform;
//Text Imports
import 'package:get/get.dart';
//firebase
import 'package:cloud_firestore/cloud_firestore.dart';

//-----------------Menssage Toast Per-----------------//
void messageToast(
    BuildContext context, String msg, Color backgroundC, Color color) {
  if (Platform.isAndroid) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(color: color),
      ),
      duration: const Duration(milliseconds: 800),
      backgroundColor: backgroundC,
    ));
  } else {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundC,
      textColor: color,
      fontSize: 16.0,
    );
  }
}

void login(BuildContext context, TextEditingController email,
    TextEditingController password) async {
  final emailUser = email.text;
  Color negro = ColorConstants.green;
  Color white = ColorConstants.white;
  Color red = ColorConstants.red;

  if (await searchByFieldInCollection('users', 'email', emailUser)) {
    //found password
    if (await searchByFieldInCollection('users', 'password', password.text)) {
      loggedIn();
      setUserData(emailUser);
      messageToast(context, 'hola $emailUser ', negro, white);
      Navigator.pushNamed(context, '/mainPage');
    } else {
      messageToast(context, 'wrongPassword'.tr, red, white);
    }
  } else {
    messageToast(context, 'wrongEmail'.tr, red, white);
  }
}

void register(
    BuildContext context,
    GlobalKey<FormState> emailKey,
    GlobalKey<FormState> passKey,
    GlobalKey<FormState> nameUserKey,
    GlobalKey<FormState> questionKey,
    TextEditingController nameUser,
    TextEditingController email,
    TextEditingController password,
    TextEditingController userType,
    TextEditingController provinceTerritory,
    TextEditingController question) {
  registerUser() async {
    final firebase = FirebaseFirestore.instance;
    try {
      await firebase.collection('users').doc(email.text).set({
        "nameUser": nameUser.text,
        "email": email.text,
        "password": password.text,
        "userType": userType.text,
        "provinceTerritory": provinceTerritory.text,
        "question": question.text,
      });
    } catch (e) {
      //print('ERROR '+e.toString());
      messageToast(context, "ERROR", ColorConstants.red, ColorConstants.white);
    }
  }

  if (nameUserKey.currentState!.validate() &&
      emailKey.currentState!.validate() &&
      passKey.currentState!.validate() &&
      questionKey.currentState!.validate()) {
    print('Enviando datos...');
    registerUser();
    messageToast(context, "HECHO", ColorConstants.blue, ColorConstants.white);
    Navigator.pushNamed(context, '/login');
  } else {
    messageToast(context, "ERROR", ColorConstants.red, ColorConstants.white);
  }
}

//-----------------------------LogOut-------------------------//
void logOut(BuildContext context) {
  loggedOut();
  cleanUserData();
  messageToast(
      context, 'Cuenta cerrada', ColorConstants.black, ColorConstants.white);
  Navigator.pushNamed(context, '/login');
}

//----------------------------Determinar Color-----------------//
Color ProgressColor(porcentaje) {
  switch (porcentaje) {
    case < 0.8 && > 0.6:
      return ColorConstants.yellow;
    case <= 0.6:
      return ColorConstants.redProgress;
    default:
      return ColorConstants.green;
  }
}

Color ProgressColorShadow(porcentaje) {
  switch (porcentaje) {
    case < 0.8 && > 0.6:
      return ColorConstants.yellowShadow;
    case <= 0.6:
      return ColorConstants.redShadow;
    default:
      return ColorConstants.greenShadow;
  }
}
