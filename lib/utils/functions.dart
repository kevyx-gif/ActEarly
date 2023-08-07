import "package:flutter/material.dart";
import 'package:actearly/utils/futures.dart';
//Text Imports
import 'package:get/get.dart';

//login
void login(BuildContext context, TextEditingController email,
    TextEditingController password) async {
  if (await searchByFieldInCollection('users', 'email', email.text)) {
    //found password
    if (await searchByFieldInCollection('users', 'password', password.text)) {
      Navigator.pushNamed(context, '/main');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        'wrongPassword'.tr,
        textAlign: TextAlign.center,
      )));
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      'wrongEmail'.tr,
      textAlign: TextAlign.center,
    )));
  }
}

//----------------------------------------------//