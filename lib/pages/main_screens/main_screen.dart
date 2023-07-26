import 'package:actearly/pages/main_screens/screen1.dart';
import 'package:actearly/pages/main_screens/screen2.dart';
import 'package:flutter/material.dart';

//NabBar import
import 'package:google_nav_bar/google_nav_bar.dart';

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
      bottomNavigationBar: GNav(
        tabs: const [
          GButton(icon: Icons.home),
          GButton(icon: Icons.bookmark),
          GButton(icon: Icons.help),
          GButton(icon: Icons.settings),
        ],
      ),
    );
  }

  Widget _buildPage() {
    return const Center(
      child: Text('Página Inicial'),
    );
  }
}
