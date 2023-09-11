// ignore_for_file: must_be_immutable

import 'package:actearly/utils/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserTools extends StatefulWidget {
  DocumentSnapshot<Map<String, dynamic>>? userData;
  String documentId;

  UserTools(this.userData, this.documentId, {super.key});

  @override
  _UserTools createState() => _UserTools();
}

class _UserTools extends State<UserTools> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.amber,
            width: width,
            height: height * 0.3,
            child: IconButton(
                onPressed: () => {logOut(context)},
                icon: Icon(Icons.exit_to_app)),
          )
        ],
      ),
    ));
  }
}
