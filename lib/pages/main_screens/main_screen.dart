import 'package:actearly/pages/main_screens/screen1.dart';
import 'package:actearly/pages/main_screens/screen2.dart';
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
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final userLog = getUserData();
  //base de dats
  final user = userActual();
  int _currentIndex = 0;
  //Tipos de usuario , nuevo(primer registro de hijo(s)) / simple(1 hijo añadido) / grande(más de 1 hijo registrado)
  String _userType = 'simple';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            _buildPage(),
            Screen1(),
            Screen2(),
          ],
        ),
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
                  icon: Icons.bookmark,
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

  Widget _buildPage() {
    if (_userType == 'nuevo') {
      return addChildWidget();
    } else {
      return ShowChildWidget(_userType);
    }
  }
}
