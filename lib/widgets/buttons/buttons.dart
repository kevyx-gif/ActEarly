import 'package:actearly/utils/functions.dart';
import 'package:flutter/material.dart';
//colors import
import 'package:actearly/utils/colors.dart';

//text size adapable
import 'package:auto_size_text/auto_size_text.dart';
//porcentaje
import 'package:percent_indicator/linear_percent_indicator.dart';

//-------------------------botones flotantes------------------------------//

Widget btnGoogle() {
  return InkWell(
    onTap: () {
      // Acción cuando se toca el botón
    },
    child: Stack(
      children: [
        Container(
          width: 40, // Ancho deseado
          height: 40, // Alto deseado
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Hace que el fondo sea circular
            color: ColorConstants.BackgroundGrayImages, // Color de fondo gris
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Image.asset(
              'lib/assets/img/google.png', // Ruta de la imagen PNG
              width: 30, // Ancho de la imagen
              height: 30, // Alto de la imagen
              fit: BoxFit.cover, // Ajusta la imagen para cubrir el espacio
            ),
          ),
        ),
      ],
    ),
  );
}

Widget btnApple() {
  return InkWell(
    onTap: () {
      // Acción cuando se toca el botón
    },
    child: Stack(
      children: [
        Container(
          width: 40, // Ancho deseado
          height: 40, // Alto deseado
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Hace que el fondo sea circular
            color: ColorConstants.BackgroundGrayImages, // Color de fondo gris
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Image.asset(
              'lib/assets/img/apple.png', // Ruta de la imagen PNG
              width: 30, // Ancho de la imagen
              height: 30, // Alto de la imagen
              fit: BoxFit.cover, // Ajusta la imagen para cubrir el espacio
            ),
          ),
        ),
      ],
    ),
  );
}

Widget btnInstagram() {
  return InkWell(
    onTap: () {
      // Acción cuando se toca el botón
    },
    child: Stack(
      children: [
        Container(
          width: 40, // Ancho deseado
          height: 40, // Alto deseado
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Hace que el fondo sea circular
            color: ColorConstants.BackgroundGrayImages, // Color de fondo gris
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Image.asset(
              'lib/assets/img/instagram.png', // Ruta de la imagen PNG
              width: 30, // Ancho de la imagen
              height: 30, // Alto de la imagen
              fit: BoxFit.cover, // Ajusta la imagen para cubrir el espacio
            ),
          ),
        ),
      ],
    ),
  );
}

//----------Indicadores---------------//
Widget indicador(BuildContext context, width, height, porcentaje, tittle) {
  String porc = (porcentaje * 100).round().toString();
  Color progressC = ProgressColor(porcentaje);
  Color backgrC = ProgressColorShadow(porcentaje);

  return Container(
    child: Card(
      margin: EdgeInsets.only(top: height * 0.5),
      color: ColorConstants.white,
      shadowColor: ColorConstants.black,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: height * 0.2),
              child: AutoSizeText(
                maxLines: 1,
                '$tittle',
                style: TextStyle(
                  fontSize: 0.05 * width,
                  fontFamily: 'Archive',
                  fontWeight: FontWeight.w700,
                  color: ColorConstants.black,
                ),
              ),
            ),
            Container(
              width: width * 0.4,
              height: height * 0.5,
              child: LinearPercentIndicator(
                lineHeight: height * 0.3,
                barRadius: Radius.circular(25),
                width: width * 0.4,
                animation: true,
                animationDuration: 2000,
                percent: porcentaje,
                progressColor: progressC,
                backgroundColor: backgrC,
                center: Text(
                  '$porc %',
                  style: TextStyle(
                      color: ColorConstants.white,
                      fontFamily: 'Archive',
                      fontWeight: FontWeight.w700),
                ),
              ),
            )
          ]),
    ),
  );
}

Widget btnYears(BuildContext context, textInfo, width) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: width * 0.02),
    width: width * 0.2,
    decoration:
        BoxDecoration(shape: BoxShape.circle, color: ColorConstants.purple),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 7,
            shape: CircleBorder(),
            side: BorderSide(width: 2, color: ColorConstants.purpleGray),
            backgroundColor: ColorConstants.btnColor),
        onPressed: () {},
        child: Center(
          child: Text(
            maxLines: 2,
            '$textInfo',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width * 0.035,
              fontFamily: 'Archive',
              fontWeight: FontWeight.w700,
            ),
          ),
        )),
  );
}
