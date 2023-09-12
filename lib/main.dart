import 'package:actearly/pages/another_pages/login.dart';
import 'package:actearly/pages/another_pages/page404.dart';
import 'package:actearly/pages/another_pages/register.dart';
import 'package:actearly/pages/another_pages/registerFirst.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
import 'package:actearly/pages/main_screens/main_screen.dart';

//futures import
import 'package:actearly/utils/futures.dart';

bool isChecked = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Initialize server with firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final userLogin = await getUserData();
  Get.put(Messages());
  runApp(MyApp(userLogin: userLogin));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  String userLogin;
  MyApp({required this.userLogin, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return GetMaterialApp(
      locale: const Locale('en', 'CAN'),
      translationsKeys: Messages(),
      title: 'ActEarly',
      home: FutureBuilder(
        future: checkChosenLanguage(),
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
                  // Mientras se comprueba si estan aceptados los terminos y condiciones
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else {
                    // si ya estan aceptados los terminos y condiciones
                    if (snapshot.data == true) {
                      return FutureBuilder(
                        future: checkLoggedInAccount(),
                        builder: (context, AsyncSnapshot<bool> snapshot) {
                          // Mientras se comprueba si ya esta logueado
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else {
                            // si ya esta logueado
                            if (snapshot.data == true) {
                              return MyHomePage(documentId: userLogin);
                            } else {
                              return LoginPage();
                            }
                          }
                        },
                      );
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
      routes: {
        '/main': (context) => MyHomePage(documentId: userLogin),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/registerFirst': (context) => RegisterFirstPage(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const Page404(),
        );
      },
    );
  }
}
