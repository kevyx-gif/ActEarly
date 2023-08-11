import 'package:flutter/material.dart';
//Just One Child

//buttons
import 'package:actearly/widgets/buttons/buttons.dart';
//text size adapable
import 'package:auto_size_text/auto_size_text.dart';
//Colors
import 'package:actearly/utils/colors.dart';

Widget child(BuildContext context) {
  ScrollController _scrollController = ScrollController();
  // Obtén la información de escalabilidad actual del dispositivo
  final mediaQueryData =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window);

  // Establece la información de escalabilidad manualmente para deshabilitarla
  final fixedMediaQueryData = mediaQueryData.copyWith(
    textScaleFactor: 1.0, // Establece un factor de escala fijo
  );

  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  return Scaffold(
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
                  margin:
                      EdgeInsets.fromLTRB(0.03 * width, 0.022 * width, 0, 0),
                  child: btnLogOut(context, width)),
              Container(
                  margin:
                      EdgeInsets.fromLTRB(0, 0.022 * width, 0.03 * width, 0),
                  child: btnInfo(context, width)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              //Textos
              //-------Name Baby--------//
              Container(
                margin: EdgeInsets.symmetric(vertical: 0.02 * height),
                child: AutoSizeText(
                  maxLines: 1,
                  'Cinthya',
                  style: TextStyle(
                    fontSize: 0.065 * width,
                    fontFamily: 'Archive',
                    fontWeight: FontWeight.w700,
                    color: ColorConstants.black,
                  ),
                ),
              ),
              //----------Years Old---------///
              Container(
                margin: EdgeInsets.symmetric(vertical: 0.02 * height),
                child: AutoSizeText(
                  maxLines: 1,
                  '5 Meses',
                  style: TextStyle(
                    fontSize: 0.035 * width,
                    fontFamily: 'Archive',
                    fontWeight: FontWeight.w700,
                    color: ColorConstants.black,
                  ),
                ),
              ),
              //--------Data------------//
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, height * 0.02),
                  width: width,
                  height: height * 0.25,
                  child: Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      color: ColorConstants.colorCard,
                      shadowColor: ColorConstants.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //-------Text Indicadr--------//
                          Container(
                            margin:
                                EdgeInsets.symmetric(vertical: 0.01 * height),
                            child: AutoSizeText(
                              maxLines: 1,
                              'Indicadores',
                              style: TextStyle(
                                fontSize: 0.045 * width,
                                fontFamily: 'Archive',
                                fontWeight: FontWeight.w700,
                                color: ColorConstants.borderBtnColor,
                              ),
                            ),
                          ),
                          //-----Indicadores------//
                          Container(
                              width: width - 60 - 20,
                              height: height * 0.105,
                              margin:
                                  EdgeInsets.symmetric(vertical: 0.01 * height),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  indicador(context, width - 60 - 20,
                                      height * 0.10, 0.6, 'Sociales'),
                                  indicador(context, width - 60 - 20,
                                      height * 0.10, 0.7, 'Lenguaje'),
                                  indicador(context, width - 60 - 20,
                                      height * 0.10, 0.8, 'Cognitivas'),
                                  indicador(context, width - 60 - 20,
                                      height * 0.10, 0.2, 'Movimiento'),
                                ],
                              )),
                          //---------Buttons----------//
                          Center(
                              child: SizedBox(
                            width: width * 0.3,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    side: BorderSide(
                                        width: 2,
                                        color: ColorConstants.borderBtnColor),
                                    backgroundColor: ColorConstants.btnColor),
                                onPressed: () {},
                                child: AutoSizeText(
                                    style: TextStyle(fontSize: width * 0.2),
                                    maxLines: 1,
                                    'Ver sugerencias')),
                          )),
                        ],
                      ))),
              Container(
                  width: width * 0.85,
                  height: height * 0.10,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, height * 0.05),
                  child: Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      color: ColorConstants.white,
                      shadowColor: ColorConstants.black,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Container(
                          width: width * 0.80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          margin:
                              EdgeInsets.symmetric(horizontal: width * 0.04),
                          child: RawScrollbar(
                              controller: _scrollController,
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03),
                              thumbColor: ColorConstants.TextGray,
                              thickness:
                                  height * 0.005, //According to your choice
                              thumbVisibility: true, //
                              radius: Radius.circular(5),
                              child: ListView.builder(
                                itemCount: 7,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return btnYears(context, 1);
                                },
                              )))))
            ],
          ),
        ],
      ),
    ),
  ));
}
