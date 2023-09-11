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
  bool seePass = false;

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
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.10),
                          margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'greeting'.tr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Archive',
                                    fontSize: 0.050 * width,
                                  ),
                                ),
                                TextSpan(
                                  text: 'tittleLogin'.tr,
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
                              Center(
                                child: Container(
                                  child: AutoSizeText(
                                    maxLines: 1,
                                    'subtittleLogin'.tr,
                                    style: TextStyle(
                                      fontSize: 0.045 * width,
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
                                                        child: RichText(
                                                          maxLines: 1,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: 'Act',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontFamily:
                                                                      'Work_Sans',
                                                                  fontSize:
                                                                      0.095 *
                                                                          width,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: 'Early',
                                                                style:
                                                                    TextStyle(
                                                                  color: ColorConstants
                                                                      .purpleGray,
                                                                  fontFamily:
                                                                      'Work_Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      0.095 *
                                                                          width,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
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
                                                            fontSize:
                                                                0.045 * width,
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
                                                          child: Stack(
                                                              children: [
                                                                TextFormField(
                                                                  controller:
                                                                      password,
                                                                  obscureText:
                                                                      seePass
                                                                          ? false
                                                                          : true,
                                                                  style: const TextStyle(
                                                                      color: ColorConstants
                                                                          .TextGray),
                                                                  decoration:
                                                                      InputDecoration(
                                                                    fillColor:
                                                                        ColorConstants
                                                                            .BackgroundGray,
                                                                    filled:
                                                                        true,
                                                                    contentPadding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            20,
                                                                        vertical:
                                                                            18),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              color: Colors.transparent),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24.0), // Adjust the radius as needed
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              color: Colors.transparent),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24.0), // Adjust the radius as needed
                                                                    ),
                                                                    hintText:
                                                                        'textInputPassw'
                                                                            .tr,
                                                                    hintStyle: const TextStyle(
                                                                        fontFamily:
                                                                            'Archive'),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                    top: 16,
                                                                    right: 20,
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          seePass =
                                                                              !seePass;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .remove_red_eye,
                                                                      ),
                                                                    ))
                                                              ]),
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
                                                                    fontSize:
                                                                        0.010 *
                                                                            width,
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
                                                                      fontSize:
                                                                          0.03 *
                                                                              width,
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
                                                                      fontSize:
                                                                          0.03 *
                                                                              width,
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
