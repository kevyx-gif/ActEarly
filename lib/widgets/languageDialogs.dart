import 'package:actearly/utils/colors.dart';
import 'package:flutter/material.dart';
//futures import
import 'package:actearly/utils/futures.dart';

//dialogs
import 'package:quickalert/quickalert.dart';

//Text Imports
import 'package:get/get.dart';

//text size adapable
import 'package:auto_size_text/auto_size_text.dart';

class LanguageSelectionWidget extends StatefulWidget {
  @override
  _LanguageSelectionWidgetState createState() =>
      _LanguageSelectionWidgetState();
}

class _LanguageSelectionWidgetState extends State<LanguageSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    // Obtén la información de escalabilidad actual del dispositivo
    final mediaQueryData =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window);

    // Establece la información de escalabilidad manualmente para deshabilitarla
    final fixedMediaQueryData = mediaQueryData.copyWith(
      textScaleFactor: 1.0, // Establece un factor de escala fijo
    );

    return MediaQuery(
        data: fixedMediaQueryData,
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/img/bg_lenguajes.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              heightFactor: null,
              widthFactor: null,
              child: Card(
                elevation: 36,
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
                      child: AutoSizeText(
                        "titleLanguaje".tr,
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Archive'),
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
        ));
  }

  Widget _buildLanguageButton(String language) {
    // Obtén la información de escalabilidad actual del dispositivo
    final mediaQueryData =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window);

    // Establece la información de escalabilidad manualmente para deshabilitarla
    final fixedMediaQueryData = mediaQueryData.copyWith(
      textScaleFactor: 1.0, // Establece un factor de escala fijo
    );

    return MediaQuery(
        data: fixedMediaQueryData,
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          height: 45.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: ColorConstants.btnColor),
            onPressed: () {
              if (language == 'English') {
                QuickAlert.show(
                    customAsset: 'lib/assets/img/accept_bg.png',
                    context: context,
                    type: QuickAlertType.confirm,
                    title: 'Are you sure you should choose this language?',
                    confirmBtnText: 'Yes',
                    cancelBtnText: 'No',
                    confirmBtnColor: ColorConstants.blue,
                    cancelBtnTextStyle: TextStyle(
                      color: ColorConstants.blueGray,
                    ),
                    onConfirmBtnTap: () {
                      Get.updateLocale(Locale('en', 'CAN'));
                      chooseLanguaje();
                      Navigator.pop(context);
                    },
                    onCancelBtnTap: () => {Navigator.pop(context)});
              } else if (language == 'Español') {
                QuickAlert.show(
                    customAsset: 'lib/assets/img/accept_bg.png',
                    context: context,
                    backgroundColor: ColorConstants.white,
                    type: QuickAlertType.confirm,
                    title: '¿Está seguro de que debe elegir este idioma?',
                    confirmBtnText: 'Sí',
                    cancelBtnText: 'No',
                    titleColor: ColorConstants.black,
                    confirmBtnColor: ColorConstants.blue,
                    cancelBtnTextStyle: TextStyle(
                      color: ColorConstants.blueGray,
                    ),
                    onConfirmBtnTap: () {
                      Get.updateLocale(Locale('es', 'MX'));
                      chooseLanguaje();
                      Navigator.pop(context);
                    },
                    onCancelBtnTap: () => {Navigator.pop(context)});
              } else {
                QuickAlert.show(
                    customAsset: 'lib/assets/img/accept_bg.png',
                    context: context,
                    type: QuickAlertType.confirm,
                    title: 'Êtes-vous sûr de choisir cette langue?',
                    confirmBtnText: 'oui',
                    cancelBtnText: 'Non',
                    confirmBtnColor: ColorConstants.blue,
                    cancelBtnTextStyle: TextStyle(
                      color: ColorConstants.blueGray,
                    ),
                    onConfirmBtnTap: () {
                      Get.updateLocale(Locale('fr', 'CA'));
                      chooseLanguaje();
                      Navigator.pop(context);
                    },
                    onCancelBtnTap: () => {Navigator.pop(context)});
              }
            },
            child: AutoSizeText(
              language,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Archive'),
            ),
          ),
        ));
  }
}
