import 'package:actearly/utils/colors.dart';
import "package:flutter/material.dart";
import 'package:actearly/utils/futures.dart';

//toast
import 'package:fluttertoast/fluttertoast.dart';
//platforms
import 'dart:io' show Platform;
//Text Imports
import 'package:get/get.dart';
//colores
import 'package:actearly/utils/colors.dart';

//-----------------Menssage Toast Per-----------------//
void messageToast(
    BuildContext context, String msg, Color backgroundC, Color color) {
  if (Platform.isAndroid) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      msg,
      textAlign: TextAlign.center,
    )));
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

//login
void login(BuildContext context, TextEditingController email,
    TextEditingController password) async {
  final emailUser = email.text;
  Color negro = ColorConstants.black;
  Color white = ColorConstants.white;
  Color red = ColorConstants.red;

  if (await searchByFieldInCollection('users', 'email', emailUser)) {
    //found password
    if (await searchByFieldInCollection('users', 'password', password.text)) {
      loggedIn();
      setUserData(emailUser);
      messageToast(context, 'hola $emailUser ', negro, white);
      Navigator.pushNamed(context, '/main');
    } else {
      messageToast(context, 'wrongPassword'.tr, red, white);
    }
  } else {
    messageToast(context, 'wrongEmail'.tr, red, white);
  }
}

//-----------------------------LogOut-------------------------//
void logOut(BuildContext context) {
  loggedOut();
  cleanUserData();
  messageToast(
      context, 'Cuenta cerrada', ColorConstants.red, ColorConstants.white);
  Navigator.pushNamed(context, '/login');
}
