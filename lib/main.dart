import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:actearly/pages/main_screens/screen1.dart';
import 'package:actearly/pages/main_screens/screen2.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Farebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//Text Imports
import 'package:get/get.dart';

bool isChecked = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Initialize server with firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return MaterialApp(
      title: 'ActEarly',
      home: FutureBuilder(
        future: _checkTermsAndConditionsAccepted(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Mientras se comprueba si los términos han sido aceptados
            return const CircularProgressIndicator();
          } else {
            if (snapshot.data == true) {
              // Si los términos ya han sido aceptados, muestra la pantalla principal con el menú
              return const MyHomePage();
            } else {
              // Si los términos no han sido aceptados, muestra la pantalla de términos y condiciones
              return const TermsAndConditionsScreen();
            }
          }
        },
      ),
    );
  }

  Future<bool> _checkTermsAndConditionsAccepted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? accepted = prefs.getBool('terms_accepted');
    return accepted ??
        false; // Si no existe el valor, devuelve false (no aceptado)
  }
}

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

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('Términos y condiciones de uso de la aplicación \"ActEarly\"',
          style: TextStyle(fontSize: 15)),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: () {}, child: Text('Español')),
          ElevatedButton(onPressed: () {}, child: Text('English')),
          ElevatedButton(onPressed: () {}, child: Text('Français')),
        ],
      )
    ]));
  }
}
