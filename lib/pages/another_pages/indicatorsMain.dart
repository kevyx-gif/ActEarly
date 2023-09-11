// ignore_for_file: must_be_immutable

import 'package:actearly/utils/allMaps.dart';
import 'package:actearly/utils/colors.dart';
import 'package:actearly/utils/functions.dart';

import 'package:actearly/widgets/indicatorCard.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ButtonState { init, loading, done }

class indicatorMain extends StatefulWidget {
  ValueNotifier<Map<String, dynamic>> child;
  int indicatorSelect;
  String email;
  List<dynamic> children;
  int firstIndex;
  indicatorMain(this.child, this.indicatorSelect, this.email, this.children,
      this.firstIndex,
      {super.key});

  @override
  State<indicatorMain> createState() => _indicatorMain();
}

class _indicatorMain extends State<indicatorMain> {
  ValueNotifier<indicadorClass> indicadores =
      ValueNotifier<indicadorClass>(indicadorClass());
  bool selectedSocial = false;
  bool selectedLang = false;
  bool mov = false;
  bool cogn = false;
  int indexMap = 0;
  int sizeMap = 0;
  bool isAnimating = true;
  ButtonState state = ButtonState.init;

  @override
  void initState() {
    super.initState();
    indicadores.value.setData(widget.child.value['indicador']);
    indexMap = widget.firstIndex;
    sizeMap = indicadores.value
        .getMont(widget.indicatorSelect)[selectMap(indexMap)]
        .keys
        .length;
    switch (indexMap) {
      case == 0:
        {
          selectedSocial = true;
          selectedLang = false;
          mov = false;
          cogn = false;
        }
        break;
      case == 1:
        {
          selectedSocial = false;
          selectedLang = true;
          mov = false;
          cogn = false;
        }
        break;
      case == 2:
        {
          selectedSocial = false;
          selectedLang = false;
          mov = true;
          cogn = false;
        }
        break;
      case == 3:
        {
          selectedSocial = false;
          selectedLang = false;
          mov = false;
          cogn = true;
        }
        break;
    }
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
    final width2 = MediaQuery.of(context).size.width / 2.5;
    final isStretched = isAnimating || state == ButtonState.init;
    final isDone = state == ButtonState.done;

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
              height: height * 0.07,
              child: Center(
                child: Text(
                  selectMap(indexMap).toUpperCase(),
                  style: TextStyle(
                      fontSize: width * 0.05,
                      fontFamily: 'Archive',
                      fontWeight: FontWeight.w600,
                      color: ColorConstants.purple),
                ),
              ),
            ),
            Container(
                width: width,
                height: height * 0.85,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      width: width * 0.86,
                      height: height * 0.85,
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(left: width * 0.02),
                          width: width * 0.86,
                          height: height * 0.9,
                          child: Container(
                            padding: EdgeInsets.only(
                                top: height * 0.02, bottom: height * 0.009),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            margin: EdgeInsets.only(
                                right: width * 0.02,
                                top: height * 0.02,
                                bottom: height * 0.02),
                            child: RawScrollbar(
                              isAlwaysShown: true,
                              thumbColor: ColorConstants.whiteGray,
                              thickness: 5,
                              radius: Radius.circular(50),
                              child: ListView.builder(
                                  itemCount: sizeMap,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    print('que onda con el index');
                                    print(indicadores.value
                                        .getMont(widget.indicatorSelect)[
                                            selectMap(indexMap)]
                                        .keys);
                                    print(sizeMap);
                                    print(index);
                                    var key = indicadores.value
                                        .getMont(widget.indicatorSelect)[
                                            selectMap(indexMap)]
                                        .keys
                                        .elementAt(index);
                                    final gradientOpacity =
                                        0.5; // Ajusta el valor según tus preferencias

                                    return Container(
                                      margin: EdgeInsets.only(
                                          top: (width * 0.8) * 0.005,
                                          bottom: (height * 0.9) * 0.02,
                                          left: (width * 0.8) * 0.05,
                                          right: (width * 0.8) * 0.04),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.transparent,
                                            Colors.transparent,
                                            Colors.white
                                                .withOpacity(gradientOpacity),
                                          ],
                                          stops: [0, 0.95, 1],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                      child: IndicatorCard(
                                        key,
                                        (width * 0.8),
                                        (height * 0.9),
                                        indicadores.value.getMont(
                                                widget.indicatorSelect)[
                                            selectMap(indexMap)][key],
                                        onAnswerChanged: (newAnswer) {
                                          setState(() {
                                            indicadores.value.getMont(
                                                        widget.indicatorSelect)[
                                                    selectMap(indexMap)][key] =
                                                newAnswer;
                                          });
                                        },
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.14,
                      height: height * 0.85,
                      child: SizedBox(
                        child: Stack(
                          children: [
                            AnimatedPositioned(
                              width: width * 0.11,
                              height: width * 0.11,
                              top: selectedSocial
                                  ? height * 0.01
                                  : height * 0.54,
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
                                    sizeMap = indicadores.value
                                        .getMont(widget.indicatorSelect)[
                                            selectMap(indexMap)]
                                        .length;
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
                                          color:
                                              Color.fromARGB(49, 105, 105, 105),
                                          spreadRadius: 0.5,
                                          offset: Offset.fromDirection(-5))
                                    ],
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Soc',
                                    style: TextStyle(
                                        fontFamily: 'Archive',
                                        fontSize: width * 0.025,
                                        fontWeight: FontWeight.w700,
                                        color: selectedSocial
                                            ? ColorConstants.white
                                            : ColorConstants.black),
                                  )),
                                ),
                              ),
                            ),
                            AnimatedPositioned(
                              width: width * 0.11,
                              height: width * 0.11,
                              top: selectedLang ? height * 0.01 : height * 0.62,
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
                                    sizeMap = indicadores.value
                                        .getMont(widget.indicatorSelect)[
                                            selectMap(indexMap)]
                                        .length;
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
                                          color:
                                              Color.fromARGB(49, 105, 105, 105),
                                          spreadRadius: 0.5,
                                          offset: Offset.fromDirection(-5))
                                    ],
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Leng',
                                    style: TextStyle(
                                        fontFamily: 'Archive',
                                        fontSize: width * 0.025,
                                        fontWeight: FontWeight.w700,
                                        color: selectedLang
                                            ? ColorConstants.white
                                            : ColorConstants.black),
                                  )),
                                ),
                              ),
                            ),
                            AnimatedPositioned(
                              width: width * 0.11,
                              height: width * 0.11,
                              top: mov ? height * 0.01 : height * 0.7,
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
                                    sizeMap = indicadores.value
                                        .getMont(widget.indicatorSelect)[
                                            selectMap(indexMap)]
                                        .length;
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
                                          color:
                                              Color.fromARGB(49, 105, 105, 105),
                                          spreadRadius: 0.5,
                                          offset: Offset.fromDirection(-5))
                                    ],
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Mov',
                                    style: TextStyle(
                                        fontFamily: 'Archive',
                                        fontSize: width * 0.025,
                                        fontWeight: FontWeight.w700,
                                        color: mov
                                            ? ColorConstants.white
                                            : ColorConstants.black),
                                  )),
                                ),
                              ),
                            ),
                            AnimatedPositioned(
                              width: width * 0.11,
                              height: width * 0.11,
                              top: cogn ? height * 0.01 : height * 0.78,
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
                                    sizeMap = indicadores.value
                                        .getMont(widget.indicatorSelect)[
                                            selectMap(indexMap)]
                                        .length;
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
                                          color:
                                              Color.fromARGB(49, 105, 105, 105),
                                          spreadRadius: 0.5,
                                          offset: Offset.fromDirection(-5))
                                    ],
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Cog',
                                    style: TextStyle(
                                        fontFamily: 'Archive',
                                        fontSize: width * 0.025,
                                        fontWeight: FontWeight.w700,
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
              width: width * 0.8,
              height: height * 0.08,
              child: Center(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: isStretched
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.center,
                children: [
                  isStretched
                      ? Container(
                          width: width * 0.25,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 7,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  primary: ColorConstants.btnColor),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: AutoSizeText(
                                'return'.tr,
                                style: TextStyle(
                                    color: ColorConstants.white,
                                    fontFamily: 'Archive',
                                    fontWeight: FontWeight.w600),
                              )))
                      : SizedBox(),
                  Container(
                    width: width * 0.25,
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.easeOut,
                        width: state == ButtonState.init ? width2 : width * 0.9,
                        onEnd: () => setState(() => isAnimating = !isAnimating),
                        height: 35,
                        child: isStretched
                            ? buildButton()
                            : buildSmallButton(isDone, width, height)),
                  ),
                ],
              )),
            )
          ],
        )),
      ),
    );
  }

  Widget buildButton() => Container(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              primary: ColorConstants.btnColor),
          onPressed: () async {
            setState(() => state = ButtonState.loading);
            setState(() {
              widget.child.value['indicador'] = indicadores.value.general;
            });
            if (await updateIndicator(
                widget.child.value, widget.children, widget.email)) {
              setState(() => state = ButtonState.done);
              await Future.delayed(Duration(milliseconds: 1200));
              Navigator.pop(context);
            } else {
              print('fallo');
            }

            setState(() => state = ButtonState.init);
          },
          child: AutoSizeText(
            'textAccept'.tr,
            style: TextStyle(
                color: ColorConstants.white,
                fontFamily: 'Archive',
                fontWeight: FontWeight.w600),
          )));

  Widget buildSmallButton(bool isDone, double width, dynamic height) {
    final color = isDone ? ColorConstants.btnColor : ColorConstants.btnColor;

    return isDone
        ? Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: Icon(Icons.done, size: 30, color: ColorConstants.white))
        : Center(
            child: Container(
              height: height * 0.01,
              width: width * 0.9,
              child: LinearProgressIndicator(
                backgroundColor: ColorConstants.white,
                color: ColorConstants.purple,
              ),
            ),
          );
  }
}

/*
indicadores.value
                      .getMont(widget.indicatorSelect)[selectMap(indexMap)]
                      .toString()
*/