// ignore_for_file: must_be_immutable

import 'package:actearly/utils/colors.dart';
import 'package:actearly/utils/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateDialog extends StatefulWidget {
  String email;
  DocumentSnapshot<Map<String, dynamic>>? userData;
  DateDialog(this.email, this.userData, {super.key});

  @override
  State<DateDialog> createState() => _DateDialog();
}

class _DateDialog extends State<DateDialog> {
  final GlobalKey<FormState> titleDateKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _descriptionController = TextEditingController();
  List<dynamic>? childrenData = [];
  List<String> dropdownList = ['select Child'];
  String dropdownValue = 'select Child';
  String hrCounter = '00';
  String minCounter = '00';
  String secCounter = '00';
  String temp = "";

  void disposed() {
    super.dispose;
  }

  @override
  void initState() {
    childrenData = (widget.userData!.data()?['children'] ?? []);
    childrenData?.forEach((element) {
      dropdownList.add(element['nameChild']);
    });
    //listNameChild =
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Center(
        child: Form(
          key: titleDateKey,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: height * 0.03),
            height: height * 0.68,
            width: width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.6,
                  margin: EdgeInsets.symmetric(vertical: height * 0.02),
                  padding: EdgeInsets.fromLTRB(width * 0.05, 0, 10, 0),
                  child: TextFormField(
                    controller: _titleController,
                    obscureText: false,
                    style: const TextStyle(color: ColorConstants.black),
                    decoration: InputDecoration(
                      fillColor: ColorConstants.BackgroundGray,
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(
                            24.0), // Adjust the radius as needed
                      ),
                      hintText: 'titulo',
                      hintStyle: const TextStyle(
                          fontFamily: 'Archive',
                          color: ColorConstants.TextGray),
                      errorStyle: TextStyle(
                        height: height * 0.0002,
                        fontSize: height * 0.012,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: width * 0.52,
                  height: height * 0.055,
                  margin: EdgeInsets.only(
                      top: height * 0.02,
                      bottom: height * 0.02,
                      left: width * 0.02),
                  padding: EdgeInsets.fromLTRB(width * 0.05, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: ColorConstants.BackgroundGray,
                    borderRadius: BorderRadius.circular(
                        50), //border raiuds of dropdown button
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      menuMaxHeight: height * 0.12,
                      isDense: true,
                      isExpanded: true,
                      itemHeight: height * 0.06,
                      value: dropdownValue,
                      items: dropdownList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: width * 0.035),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            dropdownValue = newValue; // Valor actual
                          });
                        }
                      },
                    ),
                  ),
                ),
                Container(
                  width: width * 0.6,
                  margin: EdgeInsets.symmetric(vertical: height * 0.02),
                  padding: EdgeInsets.fromLTRB(width * 0.05, 0, 10, 0),
                  child: TextFormField(
                    controller: _dateController,
                    readOnly: true, // none desktop
                    obscureText: false,
                    style: const TextStyle(color: ColorConstants.black),
                    decoration: InputDecoration(
                      fillColor: ColorConstants.BackgroundGray,
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(
                            24.0), // Adjust the radius as needed
                      ),
                      hintText: 'fecha',
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
                          _dateController.text =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
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
                Container(
                  width: width * 0.6,
                  margin: EdgeInsets.symmetric(vertical: height * 0.02),
                  padding: EdgeInsets.fromLTRB(width * 0.05, 0, 10, 0),
                  child: TextFormField(
                    controller: _timeController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: false),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(9),
                    ],
                    obscureText: false,
                    style: const TextStyle(color: ColorConstants.black),
                    decoration: InputDecoration(
                      fillColor: ColorConstants.BackgroundGray,
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(
                            24.0), // Adjust the radius as needed
                      ),
                      hintText: 'Time',
                      hintStyle: const TextStyle(
                          fontFamily: 'Archive',
                          color: ColorConstants.TextGray),
                      errorStyle: TextStyle(
                        height: height * 0.0002,
                        fontSize: height * 0.012,
                      ),
                    ),
                    onChanged: (val) {
                      String y = "";
                      switch (val.length) {
                        case 0:
                          setState(() {
                            hrCounter = "00";
                            minCounter = "00";
                            secCounter = "00";
                          });
                          break;
                        case 1:
                          setState(() {
                            secCounter = "0" + val;
                            temp = val;
                            _timeController.value =
                                _timeController.value.copyWith(
                              text: hrCounter +
                                  ":" +
                                  minCounter +
                                  ":" +
                                  secCounter,
                              selection:
                                  const TextSelection.collapsed(offset: 8),
                            );
                          });
                          break;
                        default:
                          setState(() {
                            for (int i = 1; i <= val.length - 1; i++) {
                              y = y + val.substring(i, i + 1);
                            }
                            y = y.replaceAll(":", "");
                            val = y.substring(0, 2) +
                                ":" +
                                y.substring(2, 4) +
                                ":" +
                                y.substring(4, 6);
                            temp = val;
                            _timeController.value =
                                _timeController.value.copyWith(
                              text: val,
                              selection:
                                  const TextSelection.collapsed(offset: 8),
                            );
                          });
                          break;
                      }
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: width * 0.6,
                  height: height * 0.1,
                  margin: EdgeInsets.only(top: height * 0.02),
                  padding: EdgeInsets.fromLTRB(width * 0.05, 0, 10, 0),
                  child: TextFormField(
                    textAlign: TextAlign.justify,
                    controller: _descriptionController,
                    obscureText: false,
                    keyboardType: TextInputType.multiline,
                    scrollPhysics: AlwaysScrollableScrollPhysics(),
                    maxLines: null,
                    style: const TextStyle(color: ColorConstants.black),
                    decoration: InputDecoration(
                      fillColor: ColorConstants.BackgroundGray,
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(
                            24.0), // Adjust the radius as needed
                      ),
                      hintText: 'Description',
                      hintStyle: const TextStyle(
                          fontFamily: 'Archive',
                          color: ColorConstants.TextGray),
                      errorStyle: TextStyle(
                        height: height * 0.0002,
                        fontSize: height * 0.012,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: width * 0.8,
                  height: height * 0.052,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (titleDateKey.currentState!.validate()) {
                          if (dropdownValue != 'select Child') {
                            Map<String, dynamic> cita = {
                              'title': _titleController.text,
                              'name': dropdownValue,
                              'date': _dateController.text,
                              'time': _timeController.text,
                              'description': _descriptionController.text
                            };
                            if (await addDateChild(
                                cita, childrenData, widget.email)) {
                              messageToast(context, 'cita añadida ',
                                  ColorConstants.green, ColorConstants.white);
                            } else {
                              messageToast(
                                  context,
                                  'no se pudo añadir la cita ',
                                  ColorConstants.red,
                                  ColorConstants.white);
                            }
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: Text('textAccept'.tr),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
