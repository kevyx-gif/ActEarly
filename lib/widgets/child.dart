// ignore_for_file: must_be_immutable
import 'package:actearly/pages/another_pages/indicatorsMain.dart';
import 'package:actearly/utils/functions.dart';
import 'package:actearly/widgets/dialogEditChild.dart';
import 'package:actearly/widgets/indactorSphere.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//buttons
import 'package:actearly/widgets/buttons/buttons.dart';
//text size adapable
import 'package:auto_size_text/auto_size_text.dart';
//Colors
import 'package:actearly/utils/colors.dart';
//Carousel
import 'package:carousel_slider/carousel_slider.dart';

class child extends StatefulWidget {
  ValueNotifier<Map<String, dynamic>> childData;
  DocumentSnapshot<Map<String, dynamic>>? userData;
  bool indicador;
  String email;
  child(this.childData, this.indicador, this.email, this.userData, {super.key});

  @override
  State<child> createState() => _child();
}

class _child extends State<child> {
  var currentPageIndex = 0;
  int oldYears = 0;

  ValueNotifier<String> months = ValueNotifier<String>('');

  int getYears(String date) {
    DateTime fechaNacimientoDateTime = DateTime.parse(date);
    DateTime fechaActual = DateTime.now();
    int monthDiff = fechaActual.month - fechaNacimientoDateTime.month;
    int year = fechaActual.year - fechaNacimientoDateTime.year;

    if (year < 0) year = 0;

    if (year > 0) {
      monthDiff += 12 * year;
    }
    print(monthDiff);
    return monthDiff;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final CarouselController _carouselController = CarouselController();
    oldYears = getYears(widget.childData.value['date']);
    months.value = '\n' + oldYears.toString() + ' months';

    List yearsOld = [
      '3\nmeses',
      '8\nmeses',
      '12\nmeses',
      '18\nmeses',
      '24\nmeses',
      '3\naños',
      '4\naños',
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
                                  widget.childData.value['picture']),
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
                                    text: widget.childData.value['nameChild'],
                                    style: TextStyle(
                                        color: ColorConstants.purple,
                                        fontFamily: 'Archive',
                                        fontSize: 0.06 * width,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  TextSpan(
                                    text: months.value,
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
                        ? Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(
                                right: width * 0.02, top: height * 0.025),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),

                                backgroundColor: MaterialStateProperty.all(
                                    ColorConstants
                                        .borderBtnColor), // <-- Button color
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                        (states) {
                                  if (states.contains(MaterialState.pressed))
                                    return ColorConstants.btnColor;
                                  return null; // <-- Splash color
                                }),
                              ),
                              child: Text(
                                'regresar',
                                style: TextStyle(
                                    fontFamily: 'Archive',
                                    fontSize: width * 0.03),
                              ),
                              onPressed: () => {
                                setState(() {
                                  widget.childData.value = {};
                                })
                              },
                            ),
                          )
                        : Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: width * 0.02),
                                    alignment: Alignment.center,
                                    width: width * 0.08,
                                    height: width * 0.08,
                                    child: ClipOval(
                                      child: Material(
                                        color: ColorConstants
                                            .blueNavbar, // Button color
                                        child: InkWell(
                                          splashColor: ColorConstants
                                              .blueCard, // Splash color
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Dialog(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                      bottomRight:
                                                          Radius.circular(50),
                                                      bottomLeft:
                                                          Radius.circular(50),
                                                    )),
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      width: width * 0.8,
                                                      height: height * 0.6,
                                                      child: dialogEditChild(
                                                          widget.email,
                                                          widget
                                                              .childData.value,
                                                          widget.userData!
                                                                  .data()?[
                                                              'children']),
                                                    ),
                                                  );
                                                });
                                          },
                                          child: SizedBox(
                                              width: width * 0.09,
                                              height: width * 0.09,
                                              child: Icon(
                                                Icons.edit,
                                                color: ColorConstants.white,
                                                size: width * 0.04,
                                              )),
                                        ),
                                      ),
                                    )),
                                Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: width * 0.02),
                                    alignment: Alignment.center,
                                    width: width * 0.08,
                                    height: width * 0.08,
                                    child: ClipOval(
                                      child: Material(
                                        color: ColorConstants
                                            .blueNavbar, // Button color
                                        child: InkWell(
                                          splashColor: ColorConstants
                                              .blueCard, // Splash color
                                          onTap: () async {
                                            // Assuming updateChildDatabase is an asynchronous function
                                            await updateChildDatabase(context,
                                                widget.email, [], 'children');
                                          },
                                          child: SizedBox(
                                              width: width * 0.09,
                                              height: width * 0.09,
                                              child: Icon(
                                                Icons.delete,
                                                color: ColorConstants.white,
                                                size: width * 0.04,
                                              )),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          )),
              ],
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //--------Data------------//
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, height * 0.02),
                        width: width,
                        height: height * 0.65,
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
                                  fontSize: 0.08 * width,
                                  fontFamily: 'Archive',
                                  fontWeight: FontWeight.w700,
                                  color: ColorConstants.borderBtnColor,
                                ),
                              ),
                            ),
                            //-----Indicadores------//
                            Container(
                                width: width * 0.86,
                                height: height * 0.5,
                                margin: EdgeInsets.symmetric(
                                    vertical: 0.01 * height),
                                child: GridView(
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.symmetric(
                                      vertical: height * 0.01),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: width * 0.05,
                                          mainAxisSpacing: 25,
                                          childAspectRatio: 2 / 2.3),
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  indicatorMain(
                                                      widget.childData,
                                                      lastYear(oldYears),
                                                      widget.email,
                                                      widget.userData![
                                                          'children'],
                                                      0)),
                                        );
                                      },
                                      child: indicador(
                                          context,
                                          width - 60 - 20,
                                          height * 0.10,
                                          calcPorc(widget.childData.value,
                                              'social', oldYears),
                                          'Sociales'),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  indicatorMain(
                                                      widget.childData,
                                                      lastYear(oldYears),
                                                      widget.email,
                                                      widget.userData![
                                                          'children'],
                                                      1)),
                                        );
                                      },
                                      child: indicador(
                                          context,
                                          width - 60 - 20,
                                          height * 0.10,
                                          calcPorc(widget.childData.value,
                                              'motorFino', oldYears),
                                          'Lenguaje'),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  indicatorMain(
                                                      widget.childData,
                                                      lastYear(oldYears),
                                                      widget.email,
                                                      widget.userData![
                                                          'children'],
                                                      2)),
                                        );
                                      },
                                      child: indicador(
                                          context,
                                          width - 60 - 20,
                                          height * 0.10,
                                          calcPorc(widget.childData.value,
                                              'cognitivo', oldYears),
                                          'Cognitivas'),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  indicatorMain(
                                                      widget.childData,
                                                      lastYear(oldYears),
                                                      widget.email,
                                                      widget.userData![
                                                          'children'],
                                                      3)),
                                        );
                                      },
                                      child: indicador(
                                          context,
                                          width - 60 - 20,
                                          height * 0.10,
                                          calcPorc(widget.childData.value,
                                              'motorGrueso', oldYears),
                                          'Movimiento'),
                                    ),
                                  ],
                                )),
                          ],
                        )),
                    Container(
                      width: width * 0.85,
                      height: height * 0.12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.77,
                            height: height * 0.10,
                            child: CarouselSlider(
                              carouselController: _carouselController,
                              options: CarouselOptions(
                                scrollDirection: Axis.vertical,
                                height: 140,
                                aspectRatio: 16 / 9,
                                viewportFraction: 1.0,
                                enableInfiniteScroll: true,
                                onPageChanged: (index, reason) {
                                  // Actualizar el estado cuando cambie la página

                                  setState(() {
                                    currentPageIndex = index;
                                  });
                                },
                              ),
                              items: List.generate(
                                3, // Cantidad de páginas
                                (pageIndex) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: List.generate(
                                      pageIndex == 2
                                          ? 1
                                          : 3, // Botones por página
                                      (buttonIndex) {
                                        final totalIndex =
                                            pageIndex * 3 + buttonIndex;
                                        print(totalIndex);
                                        return sphereIndicator(
                                            widget.childData,
                                            yearsOld,
                                            totalIndex,
                                            width,
                                            widget.email,
                                            widget.userData!['children'],
                                            oldYears);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.07,
                            height: height * 0.10,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 10.0,
                                    height: 10.0,
                                    margin:
                                        EdgeInsets.only(bottom: height * 0.005),
                                    decoration: BoxDecoration(
                                      color: (currentPageIndex == 0)
                                          ? ColorConstants.purple
                                          : ColorConstants.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 2,
                                            color:
                                                Color.fromARGB(186, 22, 22, 15),
                                            spreadRadius: 0.005,
                                            offset: Offset.fromDirection(-30))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 10.0,
                                    height: 10.0,
                                    margin:
                                        EdgeInsets.only(bottom: height * 0.005),
                                    decoration: BoxDecoration(
                                      color: (currentPageIndex == 1)
                                          ? ColorConstants.purple
                                          : ColorConstants.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 2,
                                            color:
                                                Color.fromARGB(186, 22, 22, 15),
                                            spreadRadius: 0.005,
                                            offset: Offset.fromDirection(-30))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 10.0,
                                    height: 10.0,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    decoration: BoxDecoration(
                                      color: (currentPageIndex == 2)
                                          ? ColorConstants.purple
                                          : ColorConstants.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 2,
                                            color:
                                                Color.fromARGB(186, 22, 22, 15),
                                            spreadRadius: 0.005,
                                            offset: Offset.fromDirection(-30))
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

List<Widget> buildPageIndicator(int pageIndex, int pageCount) {
  List<Widget> indicators = [];

  for (int i = 0; i < pageCount; i++) {
    indicators.add(Container(
      width: 10.0,
      height: 10.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (i == pageIndex) ? Colors.blue : Colors.grey,
      ),
    ));
  }

  return indicators;
}

int lastYear(int age) {
  int posicion = 0;
  if (age >= 0) {
    posicion = 0;
  }

  if (age >= 8) {
    posicion = 1;
  }

  if (age >= 12) {
    posicion = 2;
  }

  if (age >= 18) {
    posicion = 3;
  }

  if (age >= 24) {
    posicion = 4;
  }

  if (age >= 35) {
    posicion = 5;
  }

  if (age >= 47) {
    posicion = 6;
  }
  return posicion;
}
