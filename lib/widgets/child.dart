import 'package:flutter/material.dart';
//Just One Child

//buttons
import 'package:actearly/widgets/buttons/buttons.dart';

Widget child(BuildContext context) {
  // Obtén la información de escalabilidad actual del dispositivo
  final mediaQueryData =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window);

  // Establece la información de escalabilidad manualmente para deshabilitarla
  final fixedMediaQueryData = mediaQueryData.copyWith(
    textScaleFactor: 1.0, // Establece un factor de escala fijo
  );

  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  return MediaQuery(
      data: fixedMediaQueryData,
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          width: width,
          height: 0.935 * height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/img/bg_main.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(
                          0.03 * width, 0.022 * width, 0, 0),
                      child: btnLogOut(context, width)),
                  Container(
                      margin: EdgeInsets.fromLTRB(
                          0, 0.022 * width, 0.03 * width, 0),
                      child: btnInfo(context, width)),
                ],
              ),
              //picture
              Container(
                  width: 0.4 * width,
                  height: 0.4 * width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          color: Color.fromARGB(225, 134, 134, 134),
                          spreadRadius: 0.5)
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 0.05 * width,
                    backgroundImage: ExactAssetImage('lib/assets/img/pred.jpg'),
                  )),
            ],
          ),
        ),
      )));
}
