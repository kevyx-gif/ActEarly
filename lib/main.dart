import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:actearly/pages/main_screens/screen1.dart';
import 'package:actearly/pages/main_screens/screen2.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Farebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
            return CircularProgressIndicator();
          } else {
            if (snapshot.data == true) {
              // Si los términos ya han sido aceptados, muestra la pantalla principal con el menú
              return MyHomePage();
            } else {
              // Si los términos no han sido aceptados, muestra la pantalla de términos y condiciones
              return TermsAndConditionsScreen();
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
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.people),
              onPressed: () {
                setState(() {
                  _currentIndex =
                      1; // Establecer el índice a 1 para ir a la Página 1
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
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
    return Center(
      child: Text('Página Inicial'),
    );
  }
}

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Términos y Condiciones'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool('terms_accepted', true);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
          child: Text('Aceptar'),
        ),
      ),
    );
  }
}
