// ignore_for_file: must_be_immutable

import 'package:actearly/utils/colors.dart';
import 'package:actearly/widgets/dialogDateCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        child: Card(
          elevation: 4,
          child: Container(
              width: widget.width * 0.3,
              height: widget.height * 0.2,
              child: widget.date['id'] == 0
                  ? ElevatedButton.icon(
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: Colors.white,
                                  ),
                                  width: widget.width * 0.8,
                                  height: widget.height * 0.7,
                                  child:
                                      DateDialog(widget.email, widget.userData),
                                ),
                              );
                            });
                      },
                      label: Text('Add'),
                      icon: Icon(Icons.add),
                    )
                  : Center(
                      child: FlipCard(
                      direction:
                          FlipDirection.HORIZONTAL, // Dirección de volteo
                      front: Container(
                          width: widget.width * 0.25,
                          height: widget.height * 0.14,
                          child: Column(
                            children: [
                              Container(
                                  width: widget.width * 0.2,
                                  height: widget.height * 0.035,
                                  child: Center(
                                      child: Text(
                                    widget.date['title'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontFamily: 'Work_Sans',
                                        color: ColorConstants.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: widget.width * 0.05),
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
                                        fontSize: widget.width * 0.03),
                                  ))),
                              Container(
                                  width: widget.width * 0.2,
                                  height: widget.height * 0.035,
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
                      back: Container(
                          width: widget.width * 0.25,
                          height: widget.height * 0.14,
                          child:
                              Center(child: Text(widget.date['description']))),
                    ))),
        ),
      ),
    );
  }
}
