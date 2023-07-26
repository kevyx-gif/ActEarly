import 'package:actearly/pages/main_screens/screen1.dart';
import 'package:actearly/pages/main_screens/screen2.dart';
import 'package:flutter/material.dart';

//NabBar import
import 'package:google_nav_bar/google_nav_bar.dart';

//Text Imports
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              tabBackgroundColor: Colors.tealAccent.shade200,
              padding: EdgeInsets.all(15),
              gap: 8,
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'btnHome'.tr,
                ),
                GButton(
                  icon: Icons.bookmark,
                  text: 'btnTips'.tr,
                ),
                GButton(
                  icon: Icons.help,
                  text: 'btnHelp'.tr,
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'btnSettings'.tr,
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildPage() {
    return const Center(
      child: Text('Página Inicial'),
    );
  }
}
