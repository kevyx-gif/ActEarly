import 'package:actearly/services/firebase_service.dart';
import 'package:flutter/material.dart';
//Just One Child

//buttons
import 'package:actearly/widgets/buttons/buttons.dart';

Widget child(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  final emailUser = getUser();

  return Scaffold(
    body: Container(
      width: width,
      height: height,
      child: Column(
        children: [
          Row(
            children: [btnLogOut(context)],
          ),
          Center(child: Text('Hola $emailUser')),
        ],
      ),
    ),
  );
}
