import "package:flutter/material.dart";
import 'package:actearly/utils/futures.dart';

//toast
import 'package:fluttertoast/fluttertoast.dart';
//platforms
import 'dart:io' show Platform;
//Text Imports
import 'package:get/get.dart';

//login
void login(BuildContext context, TextEditingController email,
    TextEditingController password) async {
  if (await searchByFieldInCollection('users', 'email', email.text)) {
    //found password
    if (await searchByFieldInCollection('users', 'password', password.text)) {
      loggedIn();
      Fluttertoast.showToast(
        msg: "Welcome User",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.pushNamed(context, '/main');
    } else {
      if (Platform.isAndroid) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'wrongPassword'.tr,
          textAlign: TextAlign.center,
        )));
      } else {
        Fluttertoast.showToast(
          msg: 'wrongPassword'.tr,
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  } else {
    if (Platform.isAndroid) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        'wrongEmail'.tr,
        textAlign: TextAlign.center,
      )));
    } else {
      Fluttertoast.showToast(
        msg: 'wrongEmail'.tr,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}

//----------------------------------------------//
void messageToast(String msg, BuildContext context){
  if (Platform.isAndroid) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'wrongPassword'.tr,
          textAlign: TextAlign.center,
        )));
      } else {
        Fluttertoast.showToast(
          msg: 'wrongPassword'.tr,
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
}