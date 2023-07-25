import 'package:actearly/pages/another_pages/login.dart';
import 'package:actearly/pages/another_pages/page404.dart';
import 'package:actearly/pages/another_pages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:actearly/pages/main_screens/screen1.dart';
import 'package:actearly/pages/main_screens/screen2.dart';

//Farebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//Text Imports
import 'package:get/get.dart';
import 'package:actearly/utils/Messages.dart';

//Widgets import
import 'package:actearly/widgets/languageDialogs.dart';

//pages import
import 'package:actearly/pages/another_pages/terms&cond.dart';

//futures import
import 'package:actearly/utils/futures.dart';

bool isChecked = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Initialize server with firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(Messages());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return GetMaterialApp(
      locale: const Locale('en', 'CAN'),
      translationsKeys: Messages(),
      title: 'ActEarly',
      home: FutureBuilder(
        future: firstChooseLanguaje(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Mientras se comprueba si ya hay un lenguaje predeterminado
            return const CircularProgressIndicator();
          } else {
            if (snapshot.data == true) {
              // Si ya hay lenguaje comprobamos los terminos y condiciones
              return FutureBuilder(
                future: checkTermsAndConditionsAccepted(),
                builder: (context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Mientras se comprueba si estan aceptados los terminos y condiciones
                    return const CircularProgressIndicator();
                  } else {
                    if (snapshot.data == true) {
                      return const MyHomePage();
                    } else {
                      return TermsAndConditionsScreen();
                    }
                  }
                },
              );
            } else {
              return LanguageSelectionWidget();
            }
          }
        },
      ),
      //initialRoute: '/',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const Page404(),
        );
      },
    );
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
