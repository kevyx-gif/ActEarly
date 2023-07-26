import 'package:actearly/pages/main_screens/screen1.dart';
import 'package:actearly/pages/main_screens/screen2.dart';
import 'package:flutter/material.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentIndex =
                0; // Establecer el índice a 0 para volver a la página principal
          });
        },
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.people),
              onPressed: () {
                setState(() {
                  _currentIndex =
                      1; // Establecer el índice a 1 para ir a la Página 1
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                setState(() {
                  _currentIndex =
                      2; // Establecer el índice a 2 para ir a la Página 2
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage() {
    return const Center(
      child: Text('Página Inicial'),
    );
  }
}
