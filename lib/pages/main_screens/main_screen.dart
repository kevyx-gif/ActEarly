import 'package:actearly/pages/main_screens/screen1.dart';
import 'package:actearly/pages/main_screens/screen2.dart';
import 'package:actearly/pages/main_screens/Screen3.dart';
import 'package:actearly/utils/colors.dart';
import 'package:flutter/material.dart';

//NabBar import
import 'package:google_nav_bar/google_nav_bar.dart';

//Futures
import 'package:actearly/utils/futures.dart';

//Pages
import 'package:actearly/widgets/addChild.dart';
import 'package:actearly/widgets/showChild.dart';

import '../../utils/class.dart';

class MyHomePage extends StatefulWidget {
  final String documentId;
  final userType = 'simple';
  MyHomePage({required this.documentId, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  //Tipos de usuario , nuevo(primer registro de hijo(s)) / simple(1 hijo añadido) / grande(más de 1 hijo registrado)

  @override
  Widget build(BuildContext context) {
    widget.userType == 'nuevo' ? 1 : 0;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
          width: width,
          height: 0.940 * height,
          child: IndexedStack(
            index: _currentIndex,
            children: <Widget>[
              ShowChildWidget(widget.userType),
              addChildWidget(),
              Screen2(),
              Screen3(documentId: widget.documentId),
            ],
          ),
        )),
        bottomNavigationBar: Container(
          height: 0.065 * height,
          color: ColorConstants.blueNavbar,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
            child: GNav(
              backgroundColor: ColorConstants.blueNavbar,
              color: ColorConstants.white,
              activeColor: Colors.white,
              tabBackgroundColor: ColorConstants.TextGrayF,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              gap: 9,
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              tabs: [
                GButton(
                  icon: Icons.home,
                ),
                GButton(
                  icon: Icons.add_reaction,
                ),
                GButton(
                  icon: Icons.help,
                ),
                GButton(
                  icon: Icons.settings,
                ),
              ],
            ),
          ),
        ));
  }
}
