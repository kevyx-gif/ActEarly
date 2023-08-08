import "package:flutter/material.dart";
//utils import
import 'package:actearly/utils/functions.dart';
//Text Imports
import 'package:get/get.dart';
//colors import
import 'package:actearly/utils/colors.dart';
//widgets
import 'package:actearly/widgets/tools/tools.dart';
import 'package:actearly/widgets/buttons/buttons.dart';
//text size adapable
import 'package:auto_size_text/auto_size_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        image: AssetImage("lib/assets/img/bg_login.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  maxLines: 1,
                                  'greeting'.tr,
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: 'Archive',
                                    color: ColorConstants.white,
                                  ),
                                ),
                                AutoSizeText(
                                  maxLines: 1,
                                  'tittleLogin'.tr,
                                  style: TextStyle(
                                      color: ColorConstants.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Archive'),
                                ),
                              ],
                            )),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  child: AutoSizeText(
                                    maxLines: 1,
                                    'subtittleLogin'.tr,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Archive',
                                      color: ColorConstants.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: width,
                                  height: height * 0.85,
                                  child: Card(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 30),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              25, 15, 25, 25),
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        0, 0, 0, 20),
                                                    child: Column(children: [
                                                      Center(
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              AutoSizeText(
                                                                  'Act',
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        ColorConstants
                                                                            .blue,
                                                                    fontFamily:
                                                                        'Work_Sans',
                                                                    fontSize:
                                                                        40,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  )),
                                                              AutoSizeText(
                                                                  'Early',
                                                                  maxLines: 1,
                                                                  style:
                                                                      TextStyle(
                                                                    color: ColorConstants
                                                                        .purpleGray,
                                                                    fontFamily:
                                                                        'Work_Sans',
                                                                    fontSize:
                                                                        40,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ))
                                                            ]),
                                                      ),
                                                      Center(
                                                          child: AutoSizeText(
                                                        maxLines: 1,
                                                        'Learn the signs.',
                                                        style: TextStyle(
                                                            color:
                                                                ColorConstants
                                                                    .purple,
                                                            fontFamily:
                                                                'Work_Sans',
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      )),
                                                    ]),
                                                  ),

                                                  //-----------------------Input botons----------------------------//
                                                  Container(
                                                    child: Column(children: [
                                                      Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      12,
                                                                  vertical: 16),
                                                          child: TextFormField(
                                                            controller: email,
                                                            obscureText: false,
                                                            style: const TextStyle(
                                                                color: ColorConstants
                                                                    .TextGray),
                                                            decoration:
                                                                InputDecoration(
                                                              fillColor:
                                                                  ColorConstants
                                                                      .BackgroundGray,
                                                              filled: true,
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          20,
                                                                      vertical:
                                                                          20),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: Colors
                                                                        .transparent),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0), // Adjust the radius as needed
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: Colors
                                                                        .transparent),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0), // Adjust the radius as needed
                                                              ),
                                                              hintText:
                                                                  'textInputEmail'
                                                                      .tr,
                                                              hintStyle:
                                                                  const TextStyle(
                                                                      fontFamily:
                                                                          'Archive'),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      12,
                                                                  vertical: 16),
                                                          child: TextFormField(
                                                            controller:
                                                                password,
                                                            obscureText: true,
                                                            style: const TextStyle(
                                                                color: ColorConstants
                                                                    .TextGray),
                                                            decoration:
                                                                InputDecoration(
                                                              fillColor:
                                                                  ColorConstants
                                                                      .BackgroundGray,
                                                              filled: true,
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          20,
                                                                      vertical:
                                                                          18),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: Colors
                                                                        .transparent),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0), // Adjust the radius as needed
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: Colors
                                                                        .transparent),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0), // Adjust the radius as needed
                                                              ),
                                                              hintText:
                                                                  'textInputPassw'
                                                                      .tr,
                                                              hintStyle:
                                                                  const TextStyle(
                                                                      fontFamily:
                                                                          'Archive'),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          TextButton(
                                                            style: TextButton
                                                                .styleFrom(
                                                              foregroundColor:
                                                                  Colors.black,
                                                            ),
                                                            onPressed: () {},
                                                            child: AutoSizeText(
                                                                maxLines: 1,
                                                                'forgotPass'.tr,
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline,
                                                                    fontFamily:
                                                                        'Archive',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700)),
                                                          )
                                                        ],
                                                      )
                                                    ]),
                                                  ),

                                                  //-----------------------Input botons----------------------------//
                                                  Center(
                                                      child: SizedBox(
                                                    width: 200,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            shape:
                                                                StadiumBorder(),
                                                            side: BorderSide(
                                                                width: 2,
                                                                color: ColorConstants
                                                                    .borderBtnColor),
                                                            backgroundColor:
                                                                ColorConstants
                                                                    .btnColor),
                                                        onPressed: () => login(
                                                            context,
                                                            email,
                                                            password),
                                                        child: AutoSizeText(
                                                            maxLines: 1,
                                                            'textAccept'.tr)),
                                                  )),
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        0, 40, 0, 0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Center(
                                                          child: TextButton(
                                                            onPressed:
                                                                () async {
                                                              Navigator.pushNamed(
                                                                  context,
                                                                  '/register');
                                                            },
                                                            child: RichText(
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text:
                                                                        'textRegister_1'
                                                                            .tr,
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontFamily:
                                                                          'Archive',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        'textRegister_2'
                                                                            .tr,
                                                                    style:
                                                                        TextStyle(
                                                                      color: ColorConstants
                                                                          .blue,
                                                                      fontFamily:
                                                                          'Archive',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        buildOrSeparator(),
                                                        Container(
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 20, 0, 10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              btnGoogle(),
                                                              btnApple(),
                                                              btnInstagram(),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ))))),
                            ],
                          ),
                        ),
                      ],
                    )))));
  }
}
