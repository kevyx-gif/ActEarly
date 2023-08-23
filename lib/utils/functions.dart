import 'package:actearly/utils/colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import 'package:actearly/utils/futures.dart';
import 'package:actearly/widgets/cardChild.dart';
import 'package:flutter/services.dart';

//toast
import 'package:fluttertoast/fluttertoast.dart';
//Text Imports
import 'package:get/get.dart';
//firebase
import 'package:cloud_firestore/cloud_firestore.dart';
//multiMedia
import 'dart:io';

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
      Navigator.pushNamed(context, '/main');
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

//----------------------------Color progress bar-----------------//
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

//------------------------ ADD Child---------------------------//
Future<bool> addChildDatabase(BuildContext context, items, email) async {
  String imgPred =
      'https://firebasestorage.googleapis.com/v0/b/actearly-db.appspot.com/o/pred.jpg?alt=media&token=4bca616d-a874-41ad-a310-1f4ab0ddbfbc';
  bool upData = true;
  if (items.isNotEmpty) {
    List<Map<String, dynamic>> children = [];

    for (int i = 0; i < items.length; i++) {
      final child = (items[i].widgetBuilder(context) as ChildW);
      if (!child.formKeyName.currentState!.validate() &&
          !child.formKeyDate.currentState!.validate()) {
        upData = false;
        break;
      }
    }
    if (upData) {
      for (int i = 0; i < items.length; i++) {
        final child = (items[i].widgetBuilder(context) as ChildW);

        if (child.mediaFileList.value != null) {
          final imageFile = File(child.mediaFileList.value![0].path);
          final imgReference = await uploadImage(imageFile, email);

          children.add({
            'NameChild': child.kidName.text,
            'Date': child.date.text,
            'Genre': child.switchValue.value,
            'Premature': child.decisionValue.value,
            'Picture': imgReference
          });
        } else {
          children.add({
            'NameChild': child.kidName.text,
            'Date': child.date.text,
            'Genre': child.switchValue.value,
            'Premature': child.decisionValue.value,
            'Picture': imgPred
          });
        }
      }

      final update = await add(context, children, email);
      if (update) {
        return true;
      }
    }
    return false;
  } else {
    return false;
  }
}

Future<bool> add(
    BuildContext context, List<Map<String, dynamic>> childrenList, em) async {
  final firebase = FirebaseFirestore.instance;
  try {
    final data = await firebase.collection('users').doc(em).get();

    final user = data.data() as Map<String, dynamic>;

    // Atributos del documento/usuario logueado
    String email = user['email'];
    String userName = user['nameUser'];
    String pass = user['password'];
    String province = user['provinceTerritory'];
    String question = user['question'];
    String userType = user['userType'];
    List<dynamic> children =
        user.containsKey('children') ? data['children'] : [];

    if (children.isEmpty) {
      children = childrenList;
    } else {
      for (int i = 0; i < childrenList.length; i++) {
        children.add(childrenList[i]);
      }
    }

    try {
      await firebase.collection('users').doc(em).set({
        "nameUser": userName,
        "email": email,
        "password": pass,
        "userType": userType,
        "provinceTerritory": province,
        "question": question,
        "children": children
      });

      messageToast(context, 'Hijos agregados con exito', ColorConstants.green,
          ColorConstants.white);
      return true;
    } catch (e) {
      print('ERROR ' + e.toString());
      messageToast(
          context, 'Error al subir', ColorConstants.red, ColorConstants.white);
      return false;
    }
  } catch (e) {
    print('ERROR ' + e.toString());
    messageToast(
        context, 'Error al cargar', ColorConstants.red, ColorConstants.white);
    return false;
  }
}

Future<String> uploadImage(File image, imgReference) async {
  final nameFile = image.path.split("/").last;

  final storage = FirebaseStorage.instance;

  Reference ref = storage.ref().child(imgReference).child(nameFile);

  final UploadTask uploadtask = ref.putFile(image);

  final TaskSnapshot snapshot = await uploadtask.whenComplete(() => true);
  if (snapshot.state != TaskState.success) {
    return '';
  }

  final String url = await snapshot.ref.getDownloadURL();
  return url;
}
