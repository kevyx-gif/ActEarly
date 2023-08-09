import 'package:flutter/material.dart';
//colors import
import 'package:actearly/utils/colors.dart';
//svg per
import 'package:flutter_svg/flutter_svg.dart';
//Text Imports
import 'package:get/get.dart';
//colors import
import 'package:actearly/utils/colors.dart';

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

//-----------------------botones auxiliares--------------------//

Widget btnLogOut() {
  return ElevatedButton.icon(
    onPressed: () {
      // Tu código de acción cuando se presiona el botón
    },
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        primary: ColorConstants.red
            .withOpacity(0.62) //elevated btton background color
        ),
    icon: SvgPicture.asset(
      'lib/assets/icons/salida.svg',
      width: 24, // Ancho del SVG
      height: 24, // Alto del SVG
      color: Colors.white, // Color del SVG
    ),
    label: Text('logOut'.tr),
  );
}
