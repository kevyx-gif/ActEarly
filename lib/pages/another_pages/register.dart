import 'package:actearly/utils/functions.dart';
import "package:flutter/material.dart";
import 'package:actearly/widgets/dropdown.dart';
//Text Imports
import 'package:get/get.dart';
//colores
import 'package:actearly/utils/colors.dart';
//text size adapable
import 'package:auto_size_text/auto_size_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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

  final children = [];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
    // Obtén la información de escalabilidad actual del dispositivo
    final mediaQueryData =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window);

    // Establece la información de escalabilidad manualmente para deshabilitarla
    final fixedMediaQueryData = mediaQueryData.copyWith(
      textScaleFactor: 1.0, // Establece un factor de escala fijo
    );

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return MediaQuery(
      data: fixedMediaQueryData,
      child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/img/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.10),
              margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'greetingRegister'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Archive',
                        fontSize: 0.050 * width,
                      ),
                    ),
                    TextSpan(
                      text: 'tittleRegister'.tr,
                      style: TextStyle(
                        color: ColorConstants.white,
                        fontFamily: 'Archive',
                        fontWeight: FontWeight.w700,
                        fontSize: 0.050 * width,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: width,
                      height: height * 0.85,
                      child: Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(25, 15, 25, 25),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      //-----------------------Input botons----------------------------//
                                      Container(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0.039 * width, 0, 0, 0),
                                                child: Text('titleName'.tr),
                                              )
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0.005 * height, 0, 0),
                                            child: Form(
                                              key: nameUserKey,
                                              child: TextFormField(
                                                controller: nameUser,
                                                obscureText: false,
                                                style: const TextStyle(
                                                    color: ColorConstants
                                                        .TextGray),
                                                decoration: InputDecoration(
                                                  fillColor: ColorConstants
                                                      .BackgroundGray,
                                                  filled: true,
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20,
                                                          vertical: 20),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors
                                                                .transparent),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0), // Adjust the radius as needed
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors
                                                                .transparent),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0), // Adjust the radius as needed
                                                  ),
                                                  hintText: 'John',
                                                  hintStyle: const TextStyle(
                                                      fontFamily: 'Archive'),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'ErrorNoneText'.tr;
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      )),

                                      Container(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0.039 * width, 0, 0, 0),
                                                  child: Text('titleEmail'.tr),
                                                )
                                              ],
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0.005 * height, 0, 0),
                                              child: Form(
                                                key: emailKey,
                                                child: TextFormField(
                                                  controller: email,
                                                  obscureText: false,
                                                  style: const TextStyle(
                                                      color: ColorConstants
                                                          .TextGray),
                                                  decoration: InputDecoration(
                                                    fillColor: ColorConstants
                                                        .BackgroundGray,
                                                    filled: true,
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 20,
                                                            vertical: 20),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .transparent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0), // Adjust the radius as needed
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .transparent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0), // Adjust the radius as needed
                                                    ),
                                                    hintText:
                                                        'Example@gmail.com',
                                                    hintStyle: const TextStyle(
                                                        fontFamily: 'Archive'),
                                                  ),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'ErrorNoneText'.tr;
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ),
                                          ])),

                                      Container(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0.039 * width, 0, 0, 0),
                                                  child: Text('titlePass'.tr),
                                                )
                                              ],
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0.005 * height, 0, 0),
                                              child: Form(
                                                key: passKey,
                                                child: TextFormField(
                                                  controller: password,
                                                  obscureText: false,
                                                  style: const TextStyle(
                                                      color: ColorConstants
                                                          .TextGray),
                                                  decoration: InputDecoration(
                                                    fillColor: ColorConstants
                                                        .BackgroundGray,
                                                    filled: true,
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 20,
                                                            vertical: 20),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .transparent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0), // Adjust the radius as needed
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .transparent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0), // Adjust the radius as needed
                                                    ),
                                                    hintText: '********',
                                                    hintStyle: const TextStyle(
                                                        fontFamily: 'Archive'),
                                                  ),
                                                  validator: (valuePass) {
                                                    if (valuePass == null ||
                                                        valuePass.isEmpty) {
                                                      return 'ErrorNoneText'.tr;
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            )
                                          ])),
                                      Center(
                                        child: DropdownButtonExample(listUser,
                                            userType, 'titleIdent'.tr),
                                      ),
                                      Center(
                                        child: DropdownButtonExample(
                                            listProvincesTerritory,
                                            provinceTerritory,
                                            'titleTerri'.tr),
                                      ),
                                      Container(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0.039 * width, 0, 0, 0),
                                                  child:
                                                      Text('titleQuestion'.tr),
                                                )
                                              ],
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0.005 * height, 0, 0),
                                              child: Form(
                                                key: questionKey,
                                                child: TextFormField(
                                                  controller: question,
                                                  obscureText: false,
                                                  style: const TextStyle(
                                                      color: ColorConstants
                                                          .TextGray),
                                                  decoration: InputDecoration(
                                                    fillColor: ColorConstants
                                                        .BackgroundGray,
                                                    filled: true,
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 20,
                                                            vertical: 20),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .transparent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0), // Adjust the radius as needed
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .transparent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0), // Adjust the radius as needed
                                                    ),
                                                    hintText:
                                                        'First child\'s name',
                                                    hintStyle: const TextStyle(
                                                        fontFamily: 'Archive'),
                                                  ),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'ErrorNoneText'.tr;
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ),
                                          ])),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () async {
                                                  register(
                                                      context,
                                                      emailKey,
                                                      passKey,
                                                      nameUserKey,
                                                      questionKey,
                                                      nameUser,
                                                      email,
                                                      password,
                                                      userType,
                                                      provinceTerritory,
                                                      question,
                                                      children);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    shape: StadiumBorder(),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0.08 * width,
                                                            0,
                                                            0.08 * width,
                                                            0),
                                                    side: BorderSide(
                                                        width: 2,
                                                        color: ColorConstants
                                                            .borderBtnColor),
                                                    backgroundColor:
                                                        ColorConstants
                                                            .btnColor),
                                                child: AutoSizeText(
                                                    maxLines: 1,
                                                    'textAccept'.tr)),
                                          ]),
                                    ],
                                  ))))),
                ],
              ),
            ),
          ],
        ),
      ))),
    );
  }
}
