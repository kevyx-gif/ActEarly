import 'package:actearly/utils/colors.dart';
import 'package:actearly/utils/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class dialogUser extends StatefulWidget {
  DocumentSnapshot<Map<String, dynamic>>? userData;
  String email;
  double width;
  double height;
  dialogUser(this.email, this.userData, this.width, this.height, {super.key});

  @override
  _dialogUser createState() => _dialogUser();
}

class _dialogUser extends State<dialogUser> {
  String selectedValueTerr = "";
  String selectedValueId = "";

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    String aux = widget.userData!.data()?['provinceTerritory'];
    String aux2 = widget.userData!.data()?['userType'];

    selectedValueTerr = aux == '' ? 'Alberta' : aux;
    selectedValueId = aux2 == '' ? 'Padre/Tutor Legal' : aux2;
  }

  @override
  Widget build(BuildContext context) {
    final nameUser = TextEditingController();
    final email = TextEditingController();
    final password = TextEditingController();
    final userType = TextEditingController();
    final provinceTerritory = TextEditingController();
    final question = TextEditingController();

    final nameUserKey = GlobalKey<FormState>();
    final emailKey = GlobalKey<FormState>();
    final passKey = GlobalKey<FormState>();
    final userTypeKey = GlobalKey<FormState>();
    final provinceTerritoryKey = GlobalKey<FormState>();
    final questionKey = GlobalKey<FormState>();

    List<String> listUser = <String>[
      'Padre/Tutor Legal',
      'Educador/Maestro',
      'Usuario/Cuidador',
      'Evaluador a domicilio'
    ];
    List<String> listProvincesTerritory = <String>[
      'Alberta',
      'British Columbia',
      'Manitoba',
      'New Brunswick',
      'Newfoundland and Labrador',
      'Northwest Territories',
      'Nova Scotia',
      'Nunavut',
      'Ontario',
      'Prince Edward Islan',
      'Quebec',
      'Saskatchewan',
      'Yukon'
    ];

    return Center(
      child: Container(
        width: widget.width * 0.9,
        height: widget.height * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: widget.width * 0.82,
              height: widget.height * 0.12,
              child: Row(
                children: [
                  Container(
                      width: widget.width * 0.42,
                      height: widget.height * 0.1,
                      decoration: BoxDecoration(
                          color: ColorConstants.purple,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50))),
                      child: Center(
                          child: Text(
                        'titleName'.tr,
                        style: TextStyle(color: ColorConstants.white),
                      ))),
                  Container(
                      width: widget.width * 0.4,
                      height: widget.height * 0.1,
                      decoration: BoxDecoration(
                          color: ColorConstants.purple,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      child: Center(
                        child: Container(
                            alignment: Alignment.centerLeft,
                            width: widget.width * 0.36,
                            margin: EdgeInsets.only(right: widget.width * 0.07),
                            child: Form(
                              key: nameUserKey,
                              child: TextFormField(
                                controller: nameUser,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(
                                          24.0), // Adjust the radius as needed
                                    ),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    labelStyle:
                                        TextStyle(color: ColorConstants.white),
                                    hintText:
                                        widget.userData!.data()?['nameUser'],
                                    hintStyle: TextStyle(
                                        color: ColorConstants.whiteGray)),
                              ),
                            )),
                      ))
                ],
              ),
            ),
            Container(
              width: widget.width * 0.82,
              height: widget.height * 0.12,
              child: Row(
                children: [
                  Container(
                      width: widget.width * 0.42,
                      height: widget.height * 0.1,
                      decoration: BoxDecoration(
                          color: ColorConstants.purple,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50))),
                      child: Center(
                          child: Text(
                        'titleEmail'.tr,
                        style: TextStyle(color: ColorConstants.white),
                      ))),
                  Container(
                      width: widget.width * 0.4,
                      height: widget.height * 0.1,
                      decoration: BoxDecoration(
                          color: ColorConstants.purple,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      child: Center(
                        child: Container(
                            alignment: Alignment.centerLeft,
                            width: widget.width * 0.36,
                            margin: EdgeInsets.only(right: widget.width * 0.07),
                            child: Form(
                              key: emailKey,
                              child: TextFormField(
                                controller: email,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(
                                          24.0), // Adjust the radius as needed
                                    ),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    labelStyle:
                                        TextStyle(color: ColorConstants.white),
                                    hintText: widget.userData!.data()?['email'],
                                    hintStyle: TextStyle(
                                        color: ColorConstants.whiteGray)),
                              ),
                            )),
                      ))
                ],
              ),
            ),
            Container(
              width: widget.width * 0.82,
              height: widget.height * 0.12,
              child: Row(
                children: [
                  Container(
                      width: widget.width * 0.32,
                      height: widget.height * 0.1,
                      decoration: BoxDecoration(
                          color: ColorConstants.purple,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50))),
                      child: Center(
                          child: Text(
                        'titleTerri'.tr,
                        style: TextStyle(color: ColorConstants.white),
                      ))),
                  Container(
                      width: widget.width * 0.5,
                      height: widget.height * 0.1,
                      decoration: BoxDecoration(
                          color: ColorConstants.purple,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      child: Center(
                        child: Container(
                            alignment: Alignment.center,
                            width: widget.width * 0.45,
                            child: Form(
                                key: provinceTerritoryKey,
                                child: Container(
                                    width: 0.75 * widget.width,
                                    height: 0.065 * widget.height,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: ColorConstants.BackgroundGray,
                                    ),
                                    margin: EdgeInsets.fromLTRB(
                                        0, 0.005 * widget.height, 0, 0),
                                    padding: EdgeInsets.fromLTRB(
                                        0.06 * widget.width,
                                        0.004 * widget.height,
                                        0.03 * widget.width,
                                        0),
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      alignment: Alignment.centerLeft,
                                      value: selectedValueTerr,
                                      icon: const Icon(
                                          Icons.arrow_drop_down_sharp),
                                      style: const TextStyle(
                                          color: ColorConstants.TextGrayF),
                                      underline: Container(
                                        height: 0,
                                        color: const Color.fromARGB(
                                            0, 124, 77, 255),
                                      ),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          selectedValueTerr = value!;
                                          provinceTerritory.text = value;
                                        });
                                      },
                                      items: listProvincesTerritory
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    )))),
                      ))
                ],
              ),
            ),
            Container(
              width: widget.width * 0.82,
              height: widget.height * 0.12,
              child: Row(
                children: [
                  Container(
                      width: widget.width * 0.42,
                      height: widget.height * 0.1,
                      decoration: BoxDecoration(
                          color: ColorConstants.purple,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50))),
                      child: Center(
                          child: Text(
                        'titlePass'.tr,
                        style: TextStyle(color: ColorConstants.white),
                      ))),
                  Container(
                      width: widget.width * 0.4,
                      height: widget.height * 0.1,
                      decoration: BoxDecoration(
                          color: ColorConstants.purple,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      child: Center(
                        child: Container(
                            alignment: Alignment.centerLeft,
                            width: widget.width * 0.36,
                            margin: EdgeInsets.only(right: widget.width * 0.07),
                            child: Form(
                              key: passKey,
                              child: TextFormField(
                                controller: password,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(
                                          24.0), // Adjust the radius as needed
                                    ),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    labelStyle:
                                        TextStyle(color: ColorConstants.white),
                                    hintText:
                                        widget.userData!.data()?['password'],
                                    hintStyle: TextStyle(
                                        color: ColorConstants.whiteGray)),
                              ),
                            )),
                      ))
                ],
              ),
            ),
            Container(
              width: widget.width * 0.82,
              height: widget.height * 0.12,
              child: Row(
                children: [
                  Container(
                      width: widget.width * 0.32,
                      height: widget.height * 0.1,
                      decoration: BoxDecoration(
                          color: ColorConstants.purple,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50))),
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: widget.width * 0.05),
                        child: Text(
                          'titleIdent'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: ColorConstants.white),
                        ),
                      ))),
                  Container(
                      width: widget.width * 0.5,
                      height: widget.height * 0.1,
                      decoration: BoxDecoration(
                          color: ColorConstants.purple,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      child: Center(
                        child: Container(
                            alignment: Alignment.center,
                            width: widget.width * 0.5,
                            child: Form(
                              key: userTypeKey,
                              child: Center(
                                child: Container(
                                  width: widget.width * 0.45,
                                  height: 0.065 * widget.height,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: ColorConstants.BackgroundGray,
                                  ),
                                  margin: EdgeInsets.fromLTRB(
                                      0, 0.005 * widget.height, 0, 0),
                                  padding: EdgeInsets.fromLTRB(
                                      0.06 * widget.width,
                                      0.004 * widget.height,
                                      0.03 * widget.width,
                                      0),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    alignment: Alignment.centerLeft,
                                    value: selectedValueId,
                                    icon:
                                        const Icon(Icons.arrow_drop_down_sharp),
                                    style: const TextStyle(
                                        color: ColorConstants.TextGrayF),
                                    underline: Container(
                                      height: 0,
                                      color:
                                          const Color.fromARGB(0, 124, 77, 255),
                                    ),
                                    onChanged: (String? value) {
                                      // This is called when the user selects an item.
                                      setState(() {
                                        selectedValueId = value!;
                                        userType.text = value;
                                      });
                                    },
                                    items: listUser
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            )),
                      ))
                ],
              ),
            ),
            Container(
              width: widget.width * 0.82,
              height: widget.height * 0.12,
              child: Row(
                children: [
                  Container(
                      width: widget.width * 0.42,
                      height: widget.height * 0.1,
                      decoration: BoxDecoration(
                          color: ColorConstants.purple,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50))),
                      child: Center(
                          child: Text(
                        'titleQuestion'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ColorConstants.white),
                      ))),
                  Container(
                      width: widget.width * 0.4,
                      height: widget.height * 0.1,
                      decoration: BoxDecoration(
                          color: ColorConstants.purple,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      child: Center(
                        child: Container(
                            alignment: Alignment.centerLeft,
                            width: widget.width * 0.36,
                            margin: EdgeInsets.only(right: widget.width * 0.07),
                            child: Form(
                              key: questionKey,
                              child: TextFormField(
                                controller: question,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(
                                          24.0), // Adjust the radius as needed
                                    ),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    labelStyle:
                                        TextStyle(color: ColorConstants.white),
                                    hintText:
                                        widget.userData!.data()?['question'],
                                    hintStyle: TextStyle(
                                        color: ColorConstants.whiteGray)),
                              ),
                            )),
                      )),
                ],
              ),
            ),
            Container(
              width: widget.width,
              child: Center(
                child: Container(
                  width: widget.width * 0.5,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(ColorConstants.blue),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)))),
                      onPressed: () async {
                        if (await changeUser(
                            widget.userData,
                            widget.email,
                            nameUser,
                            email,
                            password,
                            userType,
                            provinceTerritory,
                            question)) {
                          messageToast(context, 'user change',
                              ColorConstants.green, ColorConstants.white);
                          Navigator.pop(context);
                        } else {
                          messageToast(context, 'user not change',
                              ColorConstants.red, ColorConstants.white);
                        }
                      },
                      child: Text('textAccept'.tr)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
