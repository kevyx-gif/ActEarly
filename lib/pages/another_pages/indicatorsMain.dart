import 'dart:ffi';

import 'package:actearly/utils/allMaps.dart';
import 'package:actearly/utils/colors.dart';
import 'package:actearly/widgets/indicatorCard.dart';
import 'package:flutter/material.dart';

class indicatorMain extends StatefulWidget {
  ValueNotifier<Map<String, dynamic>> child;
  indicatorMain(this.child, {super.key});

  @override
  State<indicatorMain> createState() => _indicatorMain();
}

class _indicatorMain extends State<indicatorMain> {
  ValueNotifier<indicadorClass> indicadores =
      ValueNotifier<indicadorClass>(indicadorClass());
  bool selectedSocial = true;
  bool selectedLang = false;
  bool mov = false;
  bool cogn = false;
  int indexMap = 0;
  int yearsOld = 0;
  int sizeMap = 0;

  int getYears(String date) {
    DateTime fechaNacimientoDateTime = DateTime.parse(date);
    DateTime fechaActual = DateTime.now();
    int monthDiff = fechaActual.month - fechaNacimientoDateTime.month;
    if (monthDiff < 0) {
      monthDiff += 12;
    }

    return monthDiff;
  }

  @override
  void initState() {
    super.initState();
    indicadores.value.setData(widget.child.value['indicador']);
    yearsOld = getYears(widget.child.value['date'].toString());
    sizeMap = indicadores.value.getMont(yearsOld)[selectMap(indexMap)].length;
  }

  @override
  void dispose() {
    super.dispose();
  }

  String selectMap(intx) {
    switch (intx) {
      case 1:
        {
          return 'motorFino';
        }

      case 2:
        {
          return 'motorGrueso';
        }

      case 3:
        {
          return 'cognitivo';
        }

      default:
        {
          return 'social';
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(65, 217, 227, 252),
        ),
        width: width,
        height: height,
        child: Center(
            child: Column(
          children: [
            Container(
                width: width,
                height: height * 0.92,
                child: Row(
                  children: [
                    Container(
                      width: width * 0.82,
                      height: height * 0.92,
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(left: width * 0.02),
                          width: width * 0.8,
                          height: height * 0.9,
                          child: Card(
                              color: ColorConstants.white,
                              shadowColor: ColorConstants.black,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: width * 0.03,
                                    top: height * 0.02,
                                    bottom: height * 0.02),
                                child: RawScrollbar(
                                  isAlwaysShown: true,
                                  thumbColor: ColorConstants.bgColor,
                                  thickness: 7,
                                  radius: Radius.circular(50),
                                  child: ListView.builder(
                                      itemCount: sizeMap,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var key = indicadores.value
                                            .getMont(
                                                yearsOld)[selectMap(indexMap)]
                                            .keys
                                            .elementAt(index);

                                        return IndicatorCard(
                                          key,
                                          (width * 0.8),
                                          (height * 0.9),
                                          indicadores.value.getMont(yearsOld)[
                                              selectMap(indexMap)][key],
                                          onAnswerChanged: (newAnswer) {
                                            setState(() {
                                              indicadores.value
                                                          .getMont(yearsOld)[
                                                      selectMap(indexMap)]
                                                  [key] = newAnswer;
                                            });
                                          },
                                        );
                                      }),
                                ),
                              )),
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.18,
                      height: height * 0.92,
                      child: SizedBox(
                        child: Stack(
                          children: [
                            AnimatedPositioned(
                              width: width * 0.145,
                              height: width * 0.145,
                              top: selectedSocial
                                  ? height * 0.01
                                  : height * 0.59,
                              left: width * 0.025,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (selectedSocial == false) {
                                      selectedLang = false;
                                      mov = false;
                                      cogn = false;
                                      indexMap = 0;
                                    }
                                    selectedSocial = !selectedSocial;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: selectedSocial
                                        ? ColorConstants.btnColor
                                        : ColorConstants.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 2,
                                          color: Color.fromARGB(
                                              188, 197, 197, 197),
                                          spreadRadius: 0.5,
                                          offset: Offset.fromDirection(-10))
                                    ],
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Sociales',
                                    style: TextStyle(
                                        fontFamily: 'Archive',
                                        fontSize: width * 0.025,
                                        color: selectedSocial
                                            ? ColorConstants.white
                                            : ColorConstants.black),
                                  )),
                                ),
                              ),
                            ),
                            AnimatedPositioned(
                              width: width * 0.145,
                              height: width * 0.145,
                              top: selectedLang ? height * 0.01 : height * 0.67,
                              left: width * 0.025,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (selectedLang == false) {
                                      selectedSocial = false;
                                      mov = false;
                                      cogn = false;
                                      indexMap = 1;
                                    }
                                    selectedLang = !selectedLang;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: selectedLang
                                        ? ColorConstants.btnColor
                                        : ColorConstants.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 2,
                                          color: Color.fromARGB(
                                              188, 197, 197, 197),
                                          spreadRadius: 0.5,
                                          offset: Offset.fromDirection(-10))
                                    ],
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Lenguaje',
                                    style: TextStyle(
                                        fontFamily: 'Archive',
                                        fontSize: width * 0.025,
                                        color: selectedLang
                                            ? ColorConstants.white
                                            : ColorConstants.black),
                                  )),
                                ),
                              ),
                            ),
                            AnimatedPositioned(
                              width: width * 0.145,
                              height: width * 0.145,
                              top: mov ? height * 0.01 : height * 0.75,
                              left: width * 0.025,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (mov == false) {
                                      selectedSocial = false;
                                      selectedLang = false;
                                      cogn = false;
                                      indexMap = 2;
                                    }
                                    mov = !mov;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: mov
                                        ? ColorConstants.btnColor
                                        : ColorConstants.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 2,
                                          color: Color.fromARGB(
                                              188, 197, 197, 197),
                                          spreadRadius: 0.5,
                                          offset: Offset.fromDirection(-10))
                                    ],
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Movimiento',
                                    style: TextStyle(
                                        fontFamily: 'Archive',
                                        fontSize: width * 0.025,
                                        color: mov
                                            ? ColorConstants.white
                                            : ColorConstants.black),
                                  )),
                                ),
                              ),
                            ),
                            AnimatedPositioned(
                              width: width * 0.145,
                              height: width * 0.145,
                              top: cogn ? height * 0.01 : height * 0.83,
                              left: width * 0.025,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (cogn == false) {
                                      selectedSocial = false;
                                      selectedLang = false;
                                      mov = false;
                                      indexMap = 3;
                                    }
                                    cogn = !cogn;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: cogn
                                        ? ColorConstants.btnColor
                                        : ColorConstants.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 2,
                                          color: Color.fromARGB(
                                              188, 197, 197, 197),
                                          spreadRadius: 0.5,
                                          offset: Offset.fromDirection(-10))
                                    ],
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Cognitivo',
                                    style: TextStyle(
                                        fontFamily: 'Archive',
                                        fontSize: width * 0.025,
                                        color: cogn
                                            ? ColorConstants.white
                                            : ColorConstants.black),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
              width: width,
              height: height * 0.08,
              child: Center(
                  child: Text(indicadores.value
                      .getMont(yearsOld)[selectMap(indexMap)]
                      .toString())),
            )
          ],
        )),
      ),
    );
  }
}
