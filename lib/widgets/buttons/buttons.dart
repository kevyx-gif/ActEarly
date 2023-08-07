import 'package:flutter/material.dart';
//colors import
import 'package:actearly/utils/colors.dart';

//botones flotantes

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
