import 'package:flutter/material.dart';
//Just One Child

//buttons
import 'package:actearly/widgets/buttons/buttons.dart';
//text size adapable
import 'package:auto_size_text/auto_size_text.dart';
//Colors
import 'package:actearly/utils/colors.dart';

Widget child(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  List yearsOld = [
    '2 meses',
    '4 meses',
    '6 meses',
    '2 meses',
    '9 meses',
    '1 año',
    '15 meses',
    '18 meses',
    '2 años',
    '30 meses',
    '3 años',
    '4 años',
    '5 años'
  ];

  return Scaffold(
      body: SingleChildScrollView(
    child: Container(
      width: width,
      height: 0.94 * height,
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
                  color: Colors.amber,
                  width: width * 0.5,
                  height: height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //picture
                      Container(
                          width: width * 0.2,
                          height: width * 0.2,
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
                            backgroundImage:
                                ExactAssetImage('lib/assets/img/pred.jpg'),
                          )),
                    ],
                  )),
              Container(
                  color: Colors.blue,
                  width: width * 0.5,
                  height: height * 0.1,
                  child: Text('hol')),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                  height: height * 0.3,
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
                              height: height * 0.15,
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

                          Container(
                            height: height * 0.035,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    side: BorderSide(
                                        width: 2,
                                        color: ColorConstants.borderBtnColor),
                                    backgroundColor: ColorConstants.btnColor),
                                onPressed: () {},
                                child: AutoSizeText(
                                    style: TextStyle(fontSize: width * 0.02),
                                    maxLines: 1,
                                    'Ver sugerencias')),
                          ),
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
                              EdgeInsets.symmetric(horizontal: width * 0.035),
                          child: Scrollbar(
                              child: ListView.builder(
                            itemCount: yearsOld.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return btnYears(
                                  context, yearsOld[index], width * 0.80);
                            },
                          )))))
            ],
          ),
        ],
      ),
    ),
  ));
}
