// ignore_for_file: must_be_immutable

import 'package:actearly/utils/colors.dart';
import 'package:actearly/widgets/dateCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DateChildren extends StatefulWidget {
  String email;
  DocumentSnapshot<Map<String, dynamic>>? userData;

  DateChildren(this.email, this.userData, {super.key});

  @override
  State<DateChildren> createState() => _DateChildrenState();
}

class _DateChildrenState extends State<DateChildren> {
  ScrollController rawController = ScrollController();
  ScrollController gridController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(widget.email)
          .snapshots(), // Reemplaza con la ruta de tu documento en Firestore
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return Text(
              'Error al cargar los datos'); // Maneja los errores o datos nulos aquí
        }

        final userData = snapshot.data!.data();
        List<Map<String, dynamic>> dates = [
          {'id': 0}
        ];

        if (userData != null && userData['children'] != null) {
          userData['children'].forEach((element) {
            element['dates'].forEach((item) {
              dates.insert(0, item);
            });
          });
        }

        return buildGridView(dates);
      },
    );
  }

  Widget buildGridView(List<Map<String, dynamic>> dates) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height * 0.9,
      child: RawScrollbar(
        isAlwaysShown: true,
        controller: rawController,
        thumbColor: ColorConstants.bgColor,
        thickness: 7,
        radius: Radius.circular(50),
        child: Padding(
          padding: EdgeInsets.only(right: (width * 0.03)),
          child: GridView.builder(
            controller: rawController,
            itemCount: dates.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: width * 0.01,
              mainAxisSpacing: 25,
              childAspectRatio: 3 / 3.5,
            ),
            itemBuilder: (BuildContext ctxt, int index) {
              return DateCard(
                  width, height, dates[index], widget.email, widget.userData);
            },
          ),
        ),
      ),
    );
  }
}
