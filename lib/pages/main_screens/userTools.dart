// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:actearly/utils/functions.dart';
import 'package:actearly/widgets/dialogChangeLanguaje.dart';
import 'package:actearly/widgets/dialogUser.dart';
import 'package:actearly/widgets/languageDialogs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            width: width,
            height: height * 0.1,
            child: Center(
              child: Container(
                width: width * 0.5,
                height: height * 0.05,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          shape: MaterialStatePropertyAll(
                              ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)))),
                      label: Text('edituser'.tr),
                      onPressed: () => {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    backgroundColor: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                    )),
                                    child: Container(
                                      color: Colors.transparent,
                                      width: width * 0.8,
                                      height: height * 0.8,
                                      child: dialogUser(
                                          widget.documentId,
                                          widget.userData,
                                          (width * 0.8),
                                          (height * 0.8)),
                                    ),
                                  );
                                })
                          },
                      icon: Icon(Icons.edit_sharp)),
                ),
              ),
            ),
          ),
          /*
          Container(
            width: width,
            height: height * 0.1,
            child: Center(
              child: Container(
                width: width * 0.5,
                height: height * 0.05,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          shape: MaterialStatePropertyAll(
                              ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)))),
                      label: Text('Exportar informacion'),
                      onPressed: () => {},
                      icon: Icon(Icons.send_and_archive_outlined)),
                ),
              ),
            ),
          ),*/
          Container(
            width: width,
            height: height * 0.1,
            child: Center(
              child: Container(
                width: width * 0.5,
                height: height * 0.05,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          shape: MaterialStatePropertyAll(
                              ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)))),
                      label: Text('changelanguage'.tr),
                      onPressed: () => {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    backgroundColor: Colors.transparent,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                      topLeft: Radius.circular(50),
                                    )),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        color: Colors.white,
                                      ),
                                      width: width * 0.9,
                                      height: height * 0.4,
                                      child: LanguajeDialog(),
                                    ),
                                  );
                                })
                          },
                      icon: Icon(Icons.language)),
                ),
              ),
            ),
          ),
          Container(
            width: width,
            height: height * 0.1,
            child: Center(
              child: Container(
                width: width * 0.5,
                height: height * 0.05,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          shape: MaterialStatePropertyAll(
                              ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)))),
                      label: Text('logOut'.tr),
                      onPressed: () => {logOut(context)},
                      icon: Icon(Icons.exit_to_app)),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
