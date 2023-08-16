import 'package:flutter/material.dart';
import 'package:actearly/utils/colors.dart';

// ignore: must_be_immutable
class ChildW extends StatefulWidget {
  BuildContext context;
  TextEditingController kidName;
  TextEditingController date;
  GlobalKey<FormState> formKeyName;
  GlobalKey<FormState> formKeyDate;
  GlobalKey<FormState> formKeySwitch;
  GlobalKey<FormState> formKeyDecision;
  ValueNotifier<bool> switchValue;
  ValueNotifier<bool> decisionValue;
  ValueNotifier<String> img;

  ChildW({
    required this.context,
    required this.kidName,
    required this.date,
    required this.formKeyName,
    required this.formKeyDate,
    required this.formKeySwitch,
    required this.formKeyDecision,
    required this.switchValue,
    required this.decisionValue,
    required this.img,
    super.key,
  });

  @override
  State<ChildW> createState() => cardWidget();
}

class cardWidget extends State<ChildW>
    with AutomaticKeepAliveClientMixin<ChildW> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(
        context); // Importante para habilitar la funcionalidad de mantener el estado
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
                                decoration: widget.img.value != ''
                                    ? BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(widget.img.value),
                                          fit: BoxFit.cover,
                                        ),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(20),
                                      )
                                    : BoxDecoration(
                                        color: widget.switchValue.value
                                            ? ColorConstants.pinkCard
                                            : ColorConstants.blueCard,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                child: widget.img.value == ''
                                    ? IconButton(
                                        iconSize: width * 0.09,
                                        color: ColorConstants.white,
                                        onPressed: () {
                                          setState(() {
                                            if (widget.img.value == '') {
                                              widget.img.value =
                                                  'lib/assets/img/pred.jpg';
                                            } else {
                                              widget.img.value = '';
                                            }
                                          });
                                        },
                                        icon: Icon(Icons.add))
                                    : IconButton(
                                        iconSize: width * 0.09,
                                        color: ColorConstants.white
                                            .withOpacity(0.50),
                                        onPressed: () {},
                                        icon: Icon(Icons.remove)),
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
                              //-------------------Inputs ---------------//
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                                      Switch(
                                        key: ValueKey(widget.formKeySwitch),
                                        // This bool value toggles the switch.
                                        value: widget.switchValue.value,
                                        activeTrackColor:
                                            ColorConstants.pinkCard,
                                        activeColor: ColorConstants.white,
                                        inactiveThumbColor:
                                            ColorConstants.white,
                                        inactiveTrackColor:
                                            ColorConstants.blueCard,

                                        onChanged: (bool value) {
                                          setState(() {
                                            widget.switchValue.value = value;
                                          });
                                        },
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
                                      child: Text('Nació Prematuro',
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
                                            key: ValueKey(
                                                widget.formKeyDecision),
                                            onTap: () {
                                              setState(() {
                                                if (widget
                                                        .decisionValue.value ==
                                                    false) {
                                                  widget.decisionValue.value =
                                                      !widget
                                                          .decisionValue.value;
                                                }
                                              });
                                            },
                                            child: Container(
                                                width: width * 0.06,
                                                height: width * 0.06,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: widget
                                                          .decisionValue.value
                                                      ? widget.switchValue.value
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
                                                if (widget
                                                        .decisionValue.value ==
                                                    true) {
                                                  widget.decisionValue.value =
                                                      !widget
                                                          .decisionValue.value;
                                                }
                                              });
                                            },
                                            child: Container(
                                                width: width * 0.06,
                                                height: width * 0.06,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: !widget
                                                          .decisionValue.value
                                                      ? widget.switchValue.value
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
