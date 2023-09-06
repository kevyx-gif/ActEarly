import 'dart:math';

import 'package:actearly/pages/main_screens/main_screen.dart';
import 'package:actearly/utils/allMaps.dart';
import 'package:actearly/utils/colors.dart';

import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import 'package:actearly/utils/futures.dart';
import 'package:actearly/widgets/cardChild.dart';

import 'package:http/http.dart' as http;
//toast
import 'package:fluttertoast/fluttertoast.dart';
//Text Imports
import 'package:get/get.dart';
//firebase
import 'package:cloud_firestore/cloud_firestore.dart';
//multiMedia
import 'dart:io';

import 'package:image_picker/image_picker.dart';

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
      await setUserData(emailUser);
      messageToast(context, 'hola $emailUser ', negro, white);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(documentId: emailUser)));
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
  TextEditingController question,
  List children,
  List date,
) {
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
        "children": children,
        "date": date,
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
  String em = email;
  print("Hereeeee");
  print(em);
  if (items.isNotEmpty) {
    for (int i = 0; i < items.length; i++) {
      final child = (items[i].widgetBuilder(context) as ChildW);

      if (!child.formKeyName.currentState!.validate()) {
        upData = false;
        break;
      }
      if (!child.formKeyDate.currentState!.validate()) {
        upData = false;
        break;
      }
    }

    if (upData) {
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
        List<dynamic> children = user['children'] ?? [];
        List<dynamic> dates = [];
        indicadorClass indicador = indicadorClass();

        //---------------------------upload IMG-------------------------------------------//
        for (int i = 0; i < items.length; i++) {
          final child = (items[i].widgetBuilder(context) as ChildW);

          int uuid = Random().nextInt(100);
          do {
            uuid = Random().nextInt(100);
          } while (idFound(uuid, children) == true);

          if (child.mediaFileList.value != null) {
            final imageFile = File(child.mediaFileList.value![0].path);
            final imgReference = await uploadImage(imageFile, email);

            children.add({
              'id': uuid,
              'nameChild': child.kidName.text,
              'date': child.date.text,
              'genre': child.switchValue.value,
              'premature': child.decisionValue.value,
              'picture': imgReference,
              'dates': dates,
              'indicador': indicador.general,
            });
          } else {
            children.add({
              'id': uuid,
              'nameChild': child.kidName.text,
              'date': child.date.text,
              'genre': child.switchValue.value,
              'premature': child.decisionValue.value,
              'picture': imgPred,
              'dates': dates,
              'indicador': indicador.general,
            });
          }
        }
        //---------------------------------------------------------------//
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

          return true;
        } catch (e) {
          print('ERROR ' + e.toString());
          messageToast(context, 'Error al subir', ColorConstants.red,
              ColorConstants.white);
          return false;
        }
      } catch (e) {
        print('ERROR ' + e.toString());
        messageToast(context, 'Error al cargar', ColorConstants.red,
            ColorConstants.white);
        return false;
      }
    }
    messageToast(context, 'llene los textos porfavor', ColorConstants.red,
        ColorConstants.white);
    return false;
  } else {
    return false;
  }
}

bool idFound(id, children) {
  print("entro a la fun");
  print(id);
  if (children.length == 0) {
    print("lista vacia regresa");
    return false;
  } else {
    children.forEach((element) {
      if (element == id) {
        print("encontro el id");
        return true;
      }
    });
    print("no lo encontro, regresa a ponerlo");
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

//----------------------Upload User Children------------------------------//
Future<void> updateChildDatabase(
    BuildContext context, email, data, String field) async {
  String em = email;

  final firebase = FirebaseFirestore.instance;

  //---------------------------------------------------------------//
  try {
    await firebase.collection('users').doc(em).update({field: data});
  } catch (e) {
    print('ERROR ' + e.toString());
    messageToast(context, 'Error al hacer el cambio', ColorConstants.red,
        ColorConstants.white);
  }
}

//-----------------image offline------------------//
Future<bool> checkImage(urlImage) async {
  bool _imageLoadingFailed = false;
  try {
    final response = await http.get(Uri.parse(urlImage));
    if (response.statusCode == 200) {
      _imageLoadingFailed = false;
    } else {
      _imageLoadingFailed = true;
    }
    return _imageLoadingFailed;
  } catch (error) {
    _imageLoadingFailed = true;
    print("Error checking image: $error");
    return _imageLoadingFailed;
  }
}

//---------------------User in BD-------------------------------//
Future<bool> userExist(BuildContext context, email) async {
  String em = email;
  final firebase = FirebaseFirestore.instance;
  try {
    if ((await firebase.collection('users').doc(em).get()).exists) {
      return true;
    }
  } catch (e) {
    return false;
  }
  return false;
}

Future<bool> changeChild(
    BuildContext context,
    String email,
    var Id,
    String kidName,
    String date,
    bool switchValue,
    bool decisionValue,
    ValueNotifier<List<XFile>?> mediaFileList,
    List<dynamic> dates,
    Map<dynamic, dynamic> indicador,
    List<dynamic> childrenOrg) async {
  Map<String, dynamic> newChild = {
    'id': Id,
    'nameChild': kidName,
    'date': date,
    'genre': switchValue,
    'premature': decisionValue,
    'picture': '',
    'dates': dates,
    'indicador': indicador,
  };

  print('lista que llega');
  print(childrenOrg);
  List<dynamic> aux = childrenOrg;

  if (mediaFileList.value != null) {
    final imageFile = File(mediaFileList.value![0].path);
    final imgReference = await uploadImage(imageFile, email);
    newChild['picture'] = imgReference;
  } else {
    childrenOrg.forEach((element) {
      if (element['id'] == Id) {
        newChild['picture'] = element['picture'];
      }
    });
  }

  aux.removeWhere((map) => map['id'] == Id);

  aux.add(newChild);

  childrenOrg = aux;

  String em = email;

  final firebase = FirebaseFirestore.instance;

  //---------------------------------------------------------------//
  try {
    await firebase.collection('users').doc(em).update({'children': aux});
    return true;
  } catch (e) {
    print('ERROR ' + e.toString());
    return false;
  }
}
