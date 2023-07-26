import 'package:flutter/material.dart';
//futures import
import 'package:actearly/utils/futures.dart';

//dialogs
import 'package:quickalert/quickalert.dart';

//Text Imports
import 'package:get/get.dart';

class LanguageSelectionWidget extends StatefulWidget {
  @override
  _LanguageSelectionWidgetState createState() =>
      _LanguageSelectionWidgetState();
}

class _LanguageSelectionWidgetState extends State<LanguageSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/img/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          heightFactor: null,
          widthFactor: null,
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 60, 10, 20),
                  child: Text(
                    "titleLanguaje".tr,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 60),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildLanguageButton('English'),
                        _buildLanguageButton('Español'),
                        _buildLanguageButton('Français'),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageButton(String language) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(shape: StadiumBorder()),
      onPressed: () {
        if (language == 'English') {
          QuickAlert.show(
              context: context,
              type: QuickAlertType.confirm,
              title: 'Are you sure you should choose this language?',
              confirmBtnText: 'Yes',
              cancelBtnText: 'No',
              confirmBtnColor: Colors.green,
              onConfirmBtnTap: () {
                Get.updateLocale(Locale('en', 'CAN'));
                chooseLanguaje();
                Navigator.pop(context);
              },
              onCancelBtnTap: () => {Navigator.pop(context)});
        } else if (language == 'Español') {
          QuickAlert.show(
              context: context,
              type: QuickAlertType.confirm,
              title: '¿Está seguro de que debe elegir este idioma?',
              confirmBtnText: 'Sí',
              cancelBtnText: 'No',
              confirmBtnColor: Colors.green,
              onConfirmBtnTap: () {
                Get.updateLocale(Locale('es', 'MX'));
                chooseLanguaje();
                Navigator.pop(context);
              },
              onCancelBtnTap: () => {Navigator.pop(context)});
        } else {
          QuickAlert.show(
              context: context,
              type: QuickAlertType.confirm,
              title: 'Êtes-vous sûr de choisir cette langue?',
              confirmBtnText: 'oui',
              cancelBtnText: 'Non',
              confirmBtnColor: Colors.green,
              cancelBtnTextStyle: TextStyle(
                color: Colors.blueGrey,
              ),
              onConfirmBtnTap: () {
                Get.updateLocale(Locale('fr', 'CA'));
                chooseLanguaje();
                Navigator.pop(context);
              },
              onCancelBtnTap: () => {Navigator.pop(context)});
        }
      },
      child: Text(
        language,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
