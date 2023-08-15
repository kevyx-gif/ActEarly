import 'package:flutter/material.dart';
import 'package:actearly/utils/colors.dart';

// ignore: must_be_immutable
class ChildW extends StatefulWidget {
  BuildContext context;
  TextEditingController kidName;
  TextEditingController date;
  GlobalKey<FormState> formKeyName;
  GlobalKey<FormState> formKeyDate;
  bool switchState;
  bool decisionState;

  ChildW({
    required this.context,
    required this.kidName,
    required this.date,
    required this.formKeyName,
    required this.formKeyDate,
    super.key,
    required this.switchState,
    required this.decisionState,
  });

  @override
  State<ChildW> createState() => cardWidget();
}

class cardWidget extends State<ChildW> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
        width: width * 0.85,
        height: height * 0.28,
        margin: EdgeInsets.fromLTRB(0, 0, 0, height * 0.01),
        child: Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            color: ColorConstants.white,
            shadowColor: ColorConstants.black,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              children: [
                Container(
                  width: width * 0.84,
                  height: height * 0.25,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //------------------------------Btn Add-------------------//
                        Container(
                          width: width * 0.25,
                          height: height * 0.24,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Ink(
                                width: width * 0.20,
                                height: width * 0.20,
                                decoration: BoxDecoration(
                                  color: widget.switchState
                                      ? ColorConstants.pinkCard
                                      : ColorConstants.blueCard,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: IconButton(
                                    iconSize: width * 0.09,
                                    color: ColorConstants.white,
                                    onPressed: () {},
                                    icon: Icon(Icons.add)),
                              ),
                            ],
                          ),
                        ),
                        //------------------------Forms--------------------------//
                        Container(
                          width: width * 0.52,
                          height: height * 0.24,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(width * 0.05, 0, 10, 0),
                                child: Form(
                                  key: widget.formKeyName,
                                  child: TextFormField(
                                    controller: widget.kidName,
                                    obscureText: false,
                                    style: const TextStyle(
                                        color: ColorConstants.black),
                                    decoration: InputDecoration(
                                      fillColor: ColorConstants.BackgroundGray,
                                      filled: true,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          20, 10, 0, 10),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(
                                            24.0), // Adjust the radius as needed
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(
                                            24.0), // Adjust the radius as needed
                                      ),
                                      hintText: 'Nombre',
                                      hintStyle: const TextStyle(
                                          fontFamily: 'Archive',
                                          color: ColorConstants.TextGray),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(width * 0.05, 0, 10, 0),
                                child: Form(
                                  key: widget.formKeyDate,
                                  child: TextFormField(
                                    controller: widget.date,
                                    obscureText: false,
                                    style: const TextStyle(
                                        color: ColorConstants.black),
                                    decoration: InputDecoration(
                                      fillColor: ColorConstants.BackgroundGray,
                                      filled: true,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          20, 10, 0, 10),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(
                                            24.0), // Adjust the radius as needed
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(
                                            24.0), // Adjust the radius as needed
                                      ),
                                      hintText: 'Fecha',
                                      hintStyle: const TextStyle(
                                          fontFamily: 'Archive',
                                          color: ColorConstants.TextGray),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      //------------------------Text-----------------------//
                                      Text(
                                        'Hombre',
                                        style: TextStyle(
                                            fontFamily: 'Archive',
                                            fontSize: width * 0.024,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      //-------------------------Switch-------------------//
                                      Form(
                                        child: Switch(
                                          // This bool value toggles the switch.
                                          value: widget.switchState,
                                          activeTrackColor:
                                              ColorConstants.pinkCard,
                                          activeColor: ColorConstants.white,
                                          inactiveThumbColor:
                                              ColorConstants.white,
                                          inactiveTrackColor:
                                              ColorConstants.blueCard,

                                          onChanged: (bool value) {
                                            setState(() {
                                              widget.switchState = value;
                                            });
                                          },
                                        ),
                                      ),

                                      //------------------------Text-----------------------//
                                      Text(
                                        'Mujer',
                                        style: TextStyle(
                                            fontFamily: 'Archive',
                                            fontSize: width * 0.024,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  )),
                              Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0, 0, 0, height * 0.01),
                                      child: Text('Nació Prematuro?',
                                          style: TextStyle(
                                              color: ColorConstants.TextGray,
                                              fontFamily: 'Archive',
                                              fontSize: width * 0.024,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                    Container(
                                      width: width * 0.20,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                widget.decisionState =
                                                    !widget.decisionState;
                                              });
                                            },
                                            child: Container(
                                                width: width * 0.05,
                                                height: width * 0.05,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: widget.decisionState
                                                      ? widget.switchState
                                                          ? ColorConstants
                                                              .pinkCard
                                                          : ColorConstants
                                                              .blueCard
                                                      : ColorConstants.TextGray,
                                                ),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    maxLines: 1,
                                                    textAlign: TextAlign.center,
                                                    'No',
                                                    style: TextStyle(
                                                        color: ColorConstants
                                                            .white,
                                                        fontFamily: 'Archive',
                                                        fontSize: width * 0.024,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                )),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                widget.decisionState =
                                                    !widget.decisionState;
                                              });
                                            },
                                            child: Container(
                                                width: width * 0.05,
                                                height: width * 0.05,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: !widget.decisionState
                                                      ? widget.switchState
                                                          ? ColorConstants
                                                              .pinkCard
                                                          : ColorConstants
                                                              .blueCard
                                                      : ColorConstants.TextGray,
                                                ),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'Si',
                                                    style: TextStyle(
                                                        color: ColorConstants
                                                            .white,
                                                        fontFamily: 'Archive',
                                                        fontSize: width * 0.024,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
              ],
            )));
  }
}
