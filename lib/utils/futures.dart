import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

/////////
///
/////login
///
///

Future<bool> searchByFieldInCollection(
    String collectionName, String fieldName, String searchValue) async {
  try {
    // Obtiene una referencia a la colección especificada en Firestore.
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(collectionName);

    // Ejecuta la consulta para buscar documentos que coincidan con el valor específico en el campo especificado.
    final QuerySnapshot querySnapshot =
        await collectionRef.where(fieldName, isEqualTo: searchValue).get();

    return querySnapshot.size > 0;
  } catch (e) {
    print('Error al buscar documentos: $e');
    return false; // En caso de error, retornamos false.
  }
}
