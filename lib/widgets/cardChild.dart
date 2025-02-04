import 'package:flutter/material.dart';
import 'package:actearly/utils/colors.dart';
import 'package:actearly/widgets/dialogMedia.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import 'dart:io';

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
  ValueNotifier<List<XFile>?> mediaFileList;

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
    required this.mediaFileList,
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
      width: width,
      height: height * 0.325,
      margin: EdgeInsets.fromLTRB(0, 0, 0, height * 0.01),
      alignment: Alignment.center,
      child: Card(
        color: ColorConstants.white,
        shadowColor: ColorConstants.black,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          width: width * 0.9,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //------------------------------Btn Add-------------------//widget.controller.value?.play();
                Container(
                  margin: EdgeInsets.fromLTRB(width * 0.02, 0, 0, 0),
                  width: (width * 0.83) * 0.35,
                  height: height * 0.15,
                  child: widget.mediaFileList.value != null
                      ? Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    //offset: Offset(0, 4),
                                    color: Color.fromARGB(
                                        209, 65, 65, 65), //edited
                                    spreadRadius: 1,
                                    offset: Offset.fromDirection(1.0),
                                    blurRadius: 2 //edited
                                    )
                              ],
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle),
                          child: Stack(
                            children: [
                              Container(
                                width: (width * 0.83) * 0.35,
                                height: height * 0.15,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.file(
                                      gaplessPlayback: true,
                                      alignment: Alignment.center,
                                      fit: BoxFit.cover,
                                      File(widget.mediaFileList.value![0].path),
                                      errorBuilder: (BuildContext context,
                                          Object error,
                                          StackTrace? stackTrace) {
                                        return const Center(
                                            child: Text(
                                                'This image type is not supported'));
                                      },
                                    )),
                              ),
                              Positioned(
                                  left: width * 0.1,
                                  top: height * 0.05,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.white60,
                                    ),
                                    onPressed: () async {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              backgroundColor:
                                                  Colors.transparent,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(50),
                                                bottomLeft: Radius.circular(50),
                                              )),
                                              child: Container(
                                                color: Colors.transparent,
                                                width: width * 0.8,
                                                height: height * 0.6,
                                                child: DialogMedia(),
                                              ),
                                            );
                                          }).then((value) {
                                        setState(() {
                                          widget.mediaFileList.value = value;
                                        });
                                      });
                                    },
                                  ))
                            ],
                          ),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary: ColorConstants.blue),
                          onPressed: () async {
                            var status = await Permission.camera.request();

                            if (status.isGranted) {
                              // ignore: use_build_context_synchronously
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      backgroundColor: Colors.transparent,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(50),
                                        bottomLeft: Radius.circular(50),
                                      )),
                                      child: Container(
                                        color: Colors.transparent,
                                        width: width * 0.8,
                                        height: height * 0.6,
                                        child: DialogMedia(),
                                      ),
                                    );
                                  }).then((value) {
                                if (value != null) {
                                  setState(() {
                                    widget.mediaFileList.value = value;
                                  });
                                }
                              });
                            } else {
                              // El permiso no ha sido concedido, podrías mostrar un mensaje o realizar alguna acción alternativa
                              print('Permiso de cámara denegado');
                            }
                          },
                          child: Icon(Icons.add),
                        ),
                ),
                //------------------------Forms--------------------------//
                Container(
                  width: (width * 0.83) * 0.63,
                  height: height * 0.28,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //-------------------Inputs ---------------//
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            width * 0.05, 0, 10, height * 0.01),
                        child: Form(
                          key: widget.formKeyName,
                          child: TextFormField(
                            controller: widget.kidName,
                            obscureText: false,
                            style: const TextStyle(color: ColorConstants.black),
                            decoration: InputDecoration(
                              fillColor: ColorConstants.BackgroundGray,
                              filled: true,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(
                                    24.0), // Adjust the radius as needed
                              ),
                              hintText: 'titleName'.tr,
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
                        padding: EdgeInsets.fromLTRB(width * 0.05, 0, 10, 0),
                        child: Form(
                          key: widget.formKeyDate,
                          child: TextFormField(
                            controller: widget.date,
                            readOnly: true, // none desktop
                            obscureText: false,
                            style: const TextStyle(color: ColorConstants.black),
                            decoration: InputDecoration(
                              fillColor: ColorConstants.BackgroundGray,
                              filled: true,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 10, 0, 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(
                                    24.0), // Adjust the radius as needed
                              ),
                              hintText: 'titleDate'.tr,
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
                                  firstDate: DateTime(2019),
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                setState(() {
                                  widget.date.text = DateFormat('yyyy-MM-dd')
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
                            key: ValueKey(widget.formKeySwitch),
                            // This bool value toggles the switch.
                            value: widget.switchValue.value,
                            activeTrackColor: ColorConstants.blue,
                            activeColor: ColorConstants.white,
                            inactiveThumbColor: ColorConstants.white,
                            inactiveTrackColor: ColorConstants.blue,

                            onChanged: (bool value) {
                              setState(() {
                                widget.switchValue.value = value;
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
                                    key: ValueKey(widget.formKeyDecision),
                                    onTap: () {
                                      setState(() {
                                        if (widget.decisionValue.value ==
                                            false) {
                                          widget.decisionValue.value =
                                              !widget.decisionValue.value;
                                        }
                                      });
                                    },
                                    child: Container(
                                        width: width * 0.06,
                                        height: width * 0.06,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: widget.decisionValue.value
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
                                        if (widget.decisionValue.value ==
                                            true) {
                                          widget.decisionValue.value =
                                              !widget.decisionValue.value;
                                        }
                                      });
                                    },
                                    child: Container(
                                        width: width * 0.06,
                                        height: width * 0.06,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: !widget.decisionValue.value
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
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
