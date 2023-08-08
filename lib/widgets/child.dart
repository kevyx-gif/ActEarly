import 'package:flutter/material.dart';
//Just One Child

Widget child(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Scaffold(
    body: Container(
      width: width,
      height: height,
      child: Column(
        children: [
          Row(
            children: [],
          ),
          Center(child: Text('Hola')),
        ],
      ),
    ),
  );
}
