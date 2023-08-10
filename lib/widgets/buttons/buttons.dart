import 'package:actearly/utils/functions.dart';
import 'package:flutter/material.dart';
//colors import
import 'package:actearly/utils/colors.dart';
//svg per
import 'package:flutter_svg/flutter_svg.dart';
//Text Imports
import 'package:get/get.dart';
//text size adapable
import 'package:auto_size_text/auto_size_text.dart';

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

Widget btnLogOut(BuildContext context, width) {
  return ElevatedButton(
    onPressed: () {
      logOut(context);
    },
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        primary: ColorConstants.red
            .withOpacity(0.62) //elevated btton background color
        ),
    child: AutoSizeText(
      'logOut'.tr,
      maxLines: 1,
      style: TextStyle(
          fontFamily: 'Archive',
          fontSize: 0.025 * width,
          fontWeight: FontWeight.w700),
    ),
  );
}

Widget btnInfo(BuildContext context, width) {
  return Container(
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
        backgroundColor: Color.fromARGB(255, 29, 202, 255),
        child: IconButton(
            color: Colors.white,
            iconSize: 0.05 * width,
            icon: SvgPicture.asset(
              'lib/assets/icons/info.svg',
              width: 0.05 * width, // Ancho del SVG
              height: 0.05 * width, // Alto del SVG
            ),
            onPressed: () {}),
      ));
}
