import 'package:actearly/pages/main_screens/screen2.dart';
import 'package:actearly/pages/main_screens/Screen3.dart';
import 'package:actearly/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//NabBar import
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

//Pages
import 'package:actearly/widgets/addChild.dart';
import 'package:actearly/widgets/showChild.dart';

import '../another_pages/dateChildren.dart';

class MyHomePage extends StatefulWidget {
  final String documentId;

  MyHomePage({required this.documentId, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(widget.documentId)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            var userData = snapshot.data;

            return SingleChildScrollView(
                child: Container(
              width: width,
              height: 0.940 * height,
              child: IndexedStack(
                index: _currentIndex,
                children: <Widget>[
                  ShowChildWidget(userData, widget.documentId),
                  //Screen1(),
                  DateChildren(widget.documentId,userData),
                  addChildWidget(documentId: widget.documentId),
                  Screen2(),
                  Screen3(documentId: widget.documentId),
                ],
              ),
            ));
          }),
      bottomNavigationBar: CurvedNavigationBar(
        height: 0.060 * height,
        backgroundColor: _currentIndex == 2
            ? Color.fromARGB(255, 129, 129, 245)
            : _currentIndex == 0
                ? Color.fromARGB(65, 217, 227, 252)
                : ColorConstants.white,
        color: ColorConstants.blueNavbar,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          Icon(Icons.home, color: ColorConstants.white),
          Icon(
            Icons.calendar_month,
            color: ColorConstants.white,
          ),
          Icon(
            Icons.add_circle,
            color: ColorConstants.white,
          ),
          Icon(
            Icons.star_outlined,
            color: ColorConstants.white,
          ),
          Icon(
            Icons.settings,
            color: ColorConstants.white,
          ),
        ],
      ),
    );
  }
}
