import 'package:actearly/utils/colors.dart';
import 'package:actearly/utils/futures.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class LanguajeDialog extends StatefulWidget {
  LanguajeDialog({super.key});

  @override
  State<LanguajeDialog> createState() => _LanguajeDialog();
}

class _LanguajeDialog extends State<LanguajeDialog> {
  void disposed() {
    super.dispose;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
        ),
        image: DecorationImage(
          image: AssetImage("lib/assets/img/bg_lenguajes.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        heightFactor: null,
        widthFactor: null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
              margin: EdgeInsets.fromLTRB(width * 0.08, 0, width * 0.08, 0),
              child: AutoSizeText(
                "titleLanguaje".tr,
                maxLines: 1,
                style: TextStyle(
                    color: ColorConstants.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Archive'),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 60),
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
    );
  }

  Widget _buildLanguageButton(String language) {
    // Obtén la información de escalabilidad actual del dispositivo
    final mediaQueryData =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window);

    // Establece la información de escalabilidad manualmente para deshabilitarla
    final fixedMediaQueryData = mediaQueryData.copyWith(
      textScaleFactor: 1.0, // Establece un factor de escala fijo
    );

    final width = MediaQuery.of(context).size.width;

    return MediaQuery(
        data: fixedMediaQueryData,
        child: SizedBox(
            width: width * 0.23,
            height: 45.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: ColorConstants.btnColor),
              onPressed: () {
                if (language == 'English') {
                  Get.updateLocale(Locale('en', 'CAN'));
                  chooseLanguaje();
                  Navigator.pop(context);
                } else if (language == 'Español') {
                  Get.updateLocale(Locale('es', 'MX'));
                  chooseLanguaje();
                  Navigator.pop(context);
                } else {
                  Get.updateLocale(Locale('fr', 'CA'));
                  chooseLanguaje();
                  Navigator.pop(context);
                }
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.018 * width),
                  child: FittedBox(
                    child: AutoSizeText(
                      language,
                      style: TextStyle(
                          color: ColorConstants.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Archive'),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  )),
            )));
  }
}
