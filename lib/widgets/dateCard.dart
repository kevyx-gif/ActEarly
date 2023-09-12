// ignore_for_file: must_be_immutable

import 'package:actearly/utils/colors.dart';
import 'package:actearly/utils/functions.dart';
import 'package:actearly/widgets/dialogDateCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:get/get.dart';

class DateCard extends StatefulWidget {
  double width, height;
  Map<String, dynamic> date;
  String email;
  DocumentSnapshot<Map<String, dynamic>>? userData;
  DateCard(this.width, this.height, this.date, this.email, this.userData,
      {super.key});

  @override
  State<DateCard> createState() => _DateCard();
}

class _DateCard extends State<DateCard> {
  ScrollController rawController = ScrollController();
  @override
  Widget build(BuildContext context) {
    // Obtén la información de escalabilidad actual del dispositivo
    final mediaQueryData =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window);

    // Establece la información de escalabilidad manualmente para deshabilitarla
    final fixedMediaQueryData = mediaQueryData.copyWith(
      textScaleFactor: 1.0, // Establece un factor de escala fijo
    );
    return (widget.date['id'] == 0)
        ? Center(
            child: Container(
                child: Card(
                    elevation: 4,
                    child: Container(
                        width: widget.width * 0.45,
                        height: widget.height * 0.2,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: ColorConstants.blue,
                            side: BorderSide(
                              color: Colors.transparent, // Color del borde
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    backgroundColor: Colors.transparent,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                      topLeft: Radius.circular(50),
                                    )),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        color: Colors.white,
                                      ),
                                      width: widget.width * 0.8,
                                      height: widget.height * 0.7,
                                      child: DateDialog(
                                          widget.email, widget.userData),
                                    ),
                                  );
                                });
                          },
                          label: Text(
                            'btnAddDate'.tr,
                            style: TextStyle(
                                fontFamily: 'Archive',
                                fontSize: widget.width * 0.04,
                                color: ColorConstants.white),
                          ),
                          icon: Icon(
                            Icons.add,
                            color: ColorConstants.white,
                          ),
                        )))))
        : MediaQuery(
            data: fixedMediaQueryData,
            child: FlipCard(
              direction: FlipDirection.HORIZONTAL, // Dirección de volteo
              front: Center(
                  child: Stack(children: [
                Container(
                    child: Card(
                        elevation: 4,
                        child: Container(
                            color: ColorConstants.yellow,
                            width: widget.width * 0.45,
                            height: widget.height * 0.2,
                            child: Center(
                              child: Container(
                                  width: widget.width * 0.38,
                                  height: widget.height * 0.16,
                                  child: Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: widget.width * 0.03),
                                          width: widget.width * 0.3,
                                          height: widget.height * 0.04,
                                          child: Center(
                                              child: Text(
                                            widget.date['title'],
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontFamily: 'Work_Sans',
                                              color: ColorConstants.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: widget.width * 0.05,
                                            ),
                                          ))),
                                      Container(
                                          width: widget.width * 0.2,
                                          height: widget.height * 0.035,
                                          child: Center(
                                              child: Text(
                                            widget.date['name'],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Work_Sans',
                                                color: ColorConstants.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: widget.width * 0.04),
                                          ))),
                                      Container(
                                          width: widget.width * 0.2,
                                          height: widget.height * 0.032,
                                          child: Center(
                                              child: Text(
                                            widget.date['date'],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Work_Sans',
                                                color: ColorConstants.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: widget.width * 0.03),
                                          ))),
                                      Container(
                                          width: widget.width * 0.2,
                                          height: widget.height * 0.035,
                                          child: Center(
                                              child: Text(
                                            widget.date['time'],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Work_Sans',
                                                color: ColorConstants.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: widget.width * 0.03),
                                          )))
                                    ],
                                  )),
                            )))),
                Positioned(
                  top: -2,
                  left: -2,
                  child: IconButton(
                      onPressed: () async {
                        await deleteDateChild(widget.date['id'],
                            widget.userData!.data()?['children'], widget.email);
                      },
                      icon: Icon(
                        Icons.cancel_outlined,
                        size: widget.width * 0.09,
                        color: ColorConstants.red,
                      )),
                )
              ])),
              back: Center(
                child: Container(
                  child: Card(
                      elevation: 4,
                      child: Container(
                          color: ColorConstants.yellow,
                          width: widget.width * 0.45,
                          height: widget.height * 0.22,
                          child: Center(
                            child: Container(
                                width: widget.width * 0.4,
                                height: widget.height * 0.14,
                                child: Center(
                                  child: RawScrollbar(
                                      controller: rawController,
                                      isAlwaysShown: true,
                                      thumbColor: ColorConstants.bgColor,
                                      thickness: 7,
                                      radius: Radius.circular(50),
                                      child: SingleChildScrollView(
                                        controller: rawController,
                                        physics: ClampingScrollPhysics(),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 5),
                                        scrollDirection: Axis.vertical,
                                        child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 15, 5),
                                            child: Text(
                                              widget.date['description'],
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400),
                                              textAlign: TextAlign.justify,
                                            )),
                                      )),
                                )),
                          ))),
                ),
              ),
            ),
          );
  }
}
