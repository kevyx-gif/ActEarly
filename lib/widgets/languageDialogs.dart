import 'package:flutter/material.dart';
//futures import
import 'package:actearly/utils/futures.dart';

//dialogs
import 'package:quickalert/quickalert.dart';

//Text Imports
import 'package:get/get.dart';

void LanguageSelectionWidgetState(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildLanguageButton('English', context),
                buildLanguageButton('Español', context),
                buildLanguageButton('Français', context),
              ],
            ),
          ),
        );
      });
}

Widget buildLanguageButton(String language, BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      if (language == 'English') {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.confirm,
            text: 'Are you sure you should choose this language?',
            confirmBtnText: 'Yes',
            cancelBtnText: 'No',
            confirmBtnColor: Colors.green,
            onConfirmBtnTap: () {
              Get.updateLocale(Locale('en', 'CAN'));
              chooseLanguaje();
            },
            onCancelBtnTap: () => {CloseButton()});
      } else if (language == 'Español') {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.confirm,
            text: '¿Está seguro de que debe elegir este idioma?',
            confirmBtnText: 'Sí',
            cancelBtnText: 'No',
            confirmBtnColor: Colors.green,
            onConfirmBtnTap: () {
              Get.updateLocale(Locale('es', 'MX'));
              chooseLanguaje();
            },
            onCancelBtnTap: () => {});
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.confirm,
            text: 'Êtes-vous sûr de choisir cette langue?',
            confirmBtnText: 'oui',
            cancelBtnText: 'Non',
            confirmBtnColor: Colors.green,
            onConfirmBtnTap: () {
              Get.updateLocale(Locale('fr', 'CA'));
              chooseLanguaje();
            },
            onCancelBtnTap: () => {});
      }
    },
    child: Text(language),
  );
}
