// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
//buttons
import 'package:actearly/widgets/buttons/buttons.dart';
//text size adapable
import 'package:auto_size_text/auto_size_text.dart';
//Colors
import 'package:actearly/utils/colors.dart';
//

class child extends StatefulWidget {
  ValueNotifier<Map<String, dynamic>> childData;
  bool indicador;
  child(this.childData, this.indicador, {super.key});

  @override
  State<child> createState() => _child();
}

class _child extends State<child> {
  @override
  Widget build(BuildContext context) {
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
          color: Color.fromARGB(65, 217, 227, 252),
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
                    width: width * 0.48,
                    height: height * 0.09,
                    margin:
                        EdgeInsets.only(top: height * 0.03, left: width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                    blurRadius: 5,
                                    color: Color.fromARGB(190, 61, 61, 61),
                                    spreadRadius: 0.5,
                                    offset: Offset.fromDirection(-10))
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 0.05 * width,
                              backgroundImage: NetworkImage(
                                  widget.childData.value['Picture']),
                            )),
                        Container(
                          width: width * 0.28,
                          height: height * 0.09,
                          child: Center(
                            child: RichText(
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Cinthya\n',
                                    style: TextStyle(
                                        color: ColorConstants.purple,
                                        fontFamily: 'Archive',
                                        fontSize: 0.06 * width,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  TextSpan(
                                    text: '5 Meses',
                                    style: TextStyle(
                                      color: ColorConstants.black,
                                      fontFamily: 'Archive',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 0.030 * width,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                Container(
                    width: width * 0.5,
                    height: height * 0.1,
                    child: widget.indicador != false
                        ? Positioned(
                            top: height * 0.06,
                            left: 0.06,
                            child: Container(
                              child: ElevatedButton(
                                child: Text('regresar'),
                                onPressed: () => {
                                  setState(() {
                                    widget.childData.value = {};
                                  })
                                },
                              ),
                            ))
                        : SizedBox()),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //--------Data------------//
                  Container(
                      color: Colors.amber,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, height * 0.02),
                      width: width,
                      height: height * 0.6,
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
                                margin: EdgeInsets.symmetric(
                                    vertical: 0.01 * height),
                                child: AutoSizeText(
                                  maxLines: 1,
                                  'Indicadores',
                                  style: TextStyle(
                                    fontSize: 0.08 * width,
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
                                  margin: EdgeInsets.symmetric(
                                      vertical: 0.01 * height),
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
                                            color:
                                                ColorConstants.borderBtnColor),
                                        backgroundColor:
                                            ColorConstants.btnColor),
                                    onPressed: () {},
                                    child: AutoSizeText(
                                        style:
                                            TextStyle(fontSize: width * 0.02),
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
                              margin: EdgeInsets.symmetric(
                                  horizontal: width * 0.035),
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
            ),
          ],
        ),
      ),
    ));
  }
}
