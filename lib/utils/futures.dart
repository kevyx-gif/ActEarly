import 'package:shared_preferences/shared_preferences.dart';

//main

Future<bool> checkTermsAndConditionsAccepted() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? accepted = prefs.getBool('terms_accepted');
  return accepted ??
      false; // Si no existe el valor, devuelve false (no aceptado)
}

void acceptTermsAndConditionsAccepted() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('terms_accepted', true);
}

Future<bool> checkChosenLanguage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? accepted = prefs.getBool('first_choose');
  return accepted ??
      false; // Si no existe el valor, devuelve false (no aceptado)
}

void chooseLanguaje() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('first_choose', true);
}

Future<bool> checkLoggedInAccount() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? accepted = prefs.getBool('account_initiated');
  return accepted ??
      false; // Si no existe el valor, devuelve false (no aceptado)
}

void loggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('account_initiated', true);
}
