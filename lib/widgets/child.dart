// ignore_for_file: must_be_immutable
import 'package:actearly/widgets/indactorSphere.dart';
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
  bool indicador;
  child(this.childData, this.indicador, {super.key});

  @override
  State<child> createState() => _child();
}

class _child extends State<child> {
  var currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final CarouselController _carouselController = CarouselController();

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
                                    text: '\n5 Meses',
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
                                        return sphereIndicator(widget.childData,
                                            yearsOld, totalIndex, width);
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
