// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:actearly/utils/colors.dart';
import 'package:actearly/utils/functions.dart';
import 'package:actearly/widgets/dialogMedia.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class dialogEditChild extends StatefulWidget {
  Map<String, dynamic> dataChild;
  String email;
  List<dynamic> children;
  dialogEditChild(this.email, this.dataChild, this.children, {super.key});

  @override
  _dialogEditChild createState() => _dialogEditChild();
}

class _dialogEditChild extends State<dialogEditChild>
    with TickerProviderStateMixin {
  bool _imageLoadingFailed = false;
  final kidName = TextEditingController();
  final date = TextEditingController();
  final formKeyName = GlobalKey<FormState>();
  final formKeyDate = GlobalKey<FormState>();
  final formKeySwitch = GlobalKey<FormState>();
  final formKeyDecision = GlobalKey<FormState>();
  bool switchValue = false;
  bool decisionValue = false;
  ValueNotifier<List<XFile>?> mediaFileList = ValueNotifier<List<XFile>?>(null);
  bool isButtonEnabled = true;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  );
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.easeIn);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    checkImage(widget.dataChild['picture']);
    switchValue = widget.dataChild['genre'];
    decisionValue = widget.dataChild['premature'];
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    _controller.forward(from: 1.0);
    return SingleChildScrollView(
      child: Container(
          color: Colors.transparent,
          height: height * 0.6,
          width: width * 0.8,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.all(0),
          child: Column(children: [
            Container(
                height: height * 0.6,
                width: width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                ),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //------------------------------Btn Add-------------------//;
                        Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(width * 0.02, 0, 0, 0),
                            width: width * 0.85,
                            child: mediaFileList.value != null
                                ? Stack(
                                    children: [
                                      Container(
                                        width: width * 0.35,
                                        height: width * 0.35,
                                        margin: EdgeInsets.only(
                                            bottom: height * 0.02),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 5,
                                                color: Color.fromARGB(
                                                    190, 61, 61, 61),
                                                spreadRadius: 0.5,
                                                offset:
                                                    Offset.fromDirection(-10))
                                          ],
                                        ),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.file(
                                              gaplessPlayback: true,
                                              alignment: Alignment.center,
                                              fit: BoxFit.cover,
                                              File(
                                                  mediaFileList.value![0].path),
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object error,
                                                      StackTrace? stackTrace) {
                                                return const Center(
                                                    child: Text(
                                                        'This image type is not supported'));
                                              },
                                            )),
                                      ),
                                      Positioned(
                                          left: width * 0.12,
                                          top: height * 0.05,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.edit,
                                              color: Colors.white60,
                                            ),
                                            onPressed: () async {
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
                                                        color:
                                                            Colors.transparent,
                                                        width: width * 0.8,
                                                        height: height * 0.6,
                                                        child: DialogMedia(),
                                                      ),
                                                    );
                                                  }).then((value) {
                                                setState(() {
                                                  print("se hizo el cambio");
                                                  mediaFileList.value = value;
                                                });
                                              });
                                            },
                                          ))
                                    ],
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5,
                                            color:
                                                Color.fromARGB(190, 61, 61, 61),
                                            spreadRadius: 0.5,
                                            offset: Offset.fromDirection(-10))
                                      ],
                                    ),
                                    width: width * 0.35,
                                    height: width * 0.35,
                                    margin:
                                        EdgeInsets.only(bottom: height * 0.02),
                                    child: _imageLoadingFailed
                                        ? CircleAvatar(
                                            radius: 0.05 * width,
                                            backgroundImage: AssetImage(
                                                'lib/assets/img/pred.jpg'),
                                          )
                                        : CircleAvatar(
                                            radius: 0.05 * width,
                                            backgroundImage: NetworkImage(
                                              widget.dataChild['picture'],
                                            ),
                                            child: Center(
                                              child: IconButton(
                                                  icon: Icon(Icons.edit,
                                                      color: Colors.white60),
                                                  onPressed: () async {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return Dialog(
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          50),
                                                              bottomLeft: Radius
                                                                  .circular(50),
                                                            )),
                                                            child: Container(
                                                              color: Colors
                                                                  .transparent,
                                                              width:
                                                                  width * 0.8,
                                                              height:
                                                                  height * 0.6,
                                                              child:
                                                                  DialogMedia(),
                                                            ),
                                                          );
                                                        }).then((value) {
                                                      if (value != null) {
                                                        setState(() {
                                                          mediaFileList.value =
                                                              value;
                                                        });
                                                      }
                                                    });
                                                  }),
                                            ),
                                          ),
                                  )),
                        //------------------------Forms--------------------------//

                        //-------------------Inputs ---------------//
                        Container(
                          width: width * 0.6,
                          padding: EdgeInsets.fromLTRB(
                              width * 0.05, 0, 10, height * 0.01),
                          child: Form(
                            key: formKeyName,
                            child: TextFormField(
                              controller: kidName,
                              obscureText: false,
                              style:
                                  const TextStyle(color: ColorConstants.black),
                              decoration: InputDecoration(
                                fillColor: ColorConstants.BackgroundGray,
                                filled: true,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(
                                      24.0), // Adjust the radius as needed
                                ),
                                hintText: widget.dataChild['nameChild'],
                                hintStyle: const TextStyle(
                                    fontFamily: 'Archive',
                                    color: ColorConstants.TextGray),
                                errorStyle: TextStyle(
                                  height: height * 0.0005,
                                  fontSize: height * 0.012,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'ErrorNoneText'.tr;
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.6,
                          padding: EdgeInsets.fromLTRB(width * 0.05, 0, 10, 0),
                          child: Form(
                            key: formKeyDate,
                            child: TextFormField(
                              controller: date,
                              readOnly: true, // none desktop
                              obscureText: false,
                              style:
                                  const TextStyle(color: ColorConstants.black),
                              decoration: InputDecoration(
                                fillColor: ColorConstants.BackgroundGray,
                                filled: true,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 10, 0, 10),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(
                                      24.0), // Adjust the radius as needed
                                ),
                                hintText: widget.dataChild['date'],
                                hintStyle: const TextStyle(
                                    fontFamily: 'Archive',
                                    color: ColorConstants.TextGray),
                                errorStyle: TextStyle(
                                  height: height * 0.0002,
                                  fontSize: height * 0.012,
                                ),
                              ),
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2018),
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  setState(() {
                                    date.text = DateFormat('yyyy-MM-dd')
                                        .format(pickedDate);
                                  });
                                }
                              },

                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'ErrorNoneDate'.tr;
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Container(
                            width: width * 0.6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //------------------------Text-----------------------//
                                Text(
                                  'titleMan'.tr,
                                  style: TextStyle(
                                      fontFamily: 'Archive',
                                      fontSize: width * 0.024,
                                      fontWeight: FontWeight.w700),
                                ),
                                //-------------------------Switch-------------------//
                                Switch(
                                  key: ValueKey(formKeySwitch),
                                  // This bool value toggles the switch.
                                  value: switchValue,
                                  activeTrackColor: ColorConstants.blue,
                                  activeColor: ColorConstants.white,
                                  inactiveThumbColor: ColorConstants.white,
                                  inactiveTrackColor: ColorConstants.blue,

                                  onChanged: (bool value) {
                                    setState(() {
                                      switchValue = value;
                                    });
                                  },
                                ),

                                //------------------------Text-----------------------//
                                Text(
                                  'titleWomen'.tr,
                                  style: TextStyle(
                                      fontFamily: 'Archive',
                                      fontSize: width * 0.024,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            )),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.fromLTRB(0, 0, 0, height * 0.01),
                                child: Text('titleBornPremature'.tr,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      key: ValueKey(formKeyDecision),
                                      onTap: () {
                                        setState(() {
                                          if (decisionValue == false) {
                                            decisionValue = !decisionValue;
                                          }
                                        });
                                      },
                                      child: Container(
                                          width: width * 0.06,
                                          height: width * 0.06,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: decisionValue
                                                ? ColorConstants.blue
                                                : ColorConstants.TextGray,
                                          ),
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              'titleNo'.tr,
                                              style: TextStyle(
                                                  color: ColorConstants.white,
                                                  fontFamily: 'Archive',
                                                  fontSize: width * 0.024,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          )),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (decisionValue == true) {
                                            decisionValue = !decisionValue;
                                          }
                                        });
                                      },
                                      child: Container(
                                          width: width * 0.06,
                                          height: width * 0.06,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: !decisionValue
                                                ? ColorConstants.blue
                                                : ColorConstants.TextGray,
                                          ),
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'titleYes'.tr,
                                              style: TextStyle(
                                                  color: ColorConstants.white,
                                                  fontFamily: 'Archive',
                                                  fontSize: width * 0.024,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              FadeTransition(
                                  opacity: _animation,
                                  child: Container(
                                    width: width * 0.4,
                                    margin: EdgeInsets.only(top: height * 0.03),
                                    child: isButtonEnabled
                                        ? ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                elevation: 3,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                primary: ColorConstants.blue),
                                            onPressed: () async {
                                              setState(() {
                                                isButtonEnabled = false;
                                              });

                                              final upload = await changeChild(
                                                context,
                                                widget.email,
                                                widget.dataChild['id'],
                                                kidName.text != ''
                                                    ? kidName.text
                                                    : widget
                                                        .dataChild['nameChild'],
                                                date.text != ''
                                                    ? date.text
                                                    : widget.dataChild['date'],
                                                switchValue,
                                                decisionValue,
                                                mediaFileList,
                                                widget.dataChild['dates'],
                                                widget.dataChild['indicador'],
                                                widget.children,
                                              );

                                              setState(() {
                                                if (upload) {
                                                  messageToast(
                                                      context,
                                                      'Los cambios han sido guardados',
                                                      ColorConstants.green,
                                                      ColorConstants.white);
                                                  _controller.forward(
                                                      from: 0.0);
                                                } else {
                                                  messageToast(
                                                      context,
                                                      'No se realizaron los cambios',
                                                      ColorConstants.red,
                                                      ColorConstants.white);
                                                  _controller.forward(
                                                      from: 0.0);
                                                }
                                                isButtonEnabled = true;
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: AutoSizeText(
                                              'textAccept'.tr,
                                              style: TextStyle(
                                                  color: ColorConstants.white,
                                                  fontFamily: 'Archive',
                                                  fontWeight: FontWeight.w600),
                                            ))
                                        : Container(
                                            height: (0.94 * height) * 0.03,
                                            width: width * 0.6,
                                            alignment: Alignment.center,
                                            child: LinearProgressIndicator(
                                              backgroundColor:
                                                  ColorConstants.white,
                                              color: ColorConstants.blue,
                                            ),
                                          ),
                                  )),
                            ],
                          ),
                        ),
                      ]),
                ))
          ])),
    );
  }
}
