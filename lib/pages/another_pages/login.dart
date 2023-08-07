import "package:flutter/material.dart";
//utils import
import 'package:actearly/utils/functions.dart';
//Text Imports
import 'package:get/get.dart';
//colors import
import 'package:actearly/utils/colors.dart';

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
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
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
                    Center(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'greeting'.tr,
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: 'Archive',
                                    color: ColorConstants.white,
                                  ),
                                ),
                                Text(
                                  'tittleLogin'.tr,
                                  style: TextStyle(
                                      color: ColorConstants.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Archive'),
                                ),
                              ],
                            ))),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text(
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
                              width: MediaQuery.of(context).size.width,
                              height: 740,
                              child: Card(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 15, 25, 25),
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
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
                                                          Text('Act',
                                                              style: TextStyle(
                                                                color:
                                                                    ColorConstants
                                                                        .blue,
                                                                fontFamily:
                                                                    'Work_Sans',
                                                                fontSize: 40,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              )),
                                                          Text('Early',
                                                              style: TextStyle(
                                                                color: ColorConstants
                                                                    .purpleGray,
                                                                fontFamily:
                                                                    'Work_Sans',
                                                                fontSize: 40,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ))
                                                        ]),
                                                  ),
                                                  Center(
                                                      child: Text(
                                                    'Learn the signs.',
                                                    style: TextStyle(
                                                        color: ColorConstants
                                                            .purple,
                                                        fontFamily: 'Work_Sans',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )),
                                                ]),
                                              ),

                                              //-----------------------Input botons----------------------------//
                                              Container(
                                                child: Column(children: [
                                                  Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 12,
                                                          vertical: 16),
                                                      child: TextFormField(
                                                        controller: email,
                                                        obscureText: false,
                                                        style: const TextStyle(
                                                            color:
                                                                ColorConstants
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
                                                                  vertical: 20),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .transparent),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24.0), // Adjust the radius as needed
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
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
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 12,
                                                          vertical: 16),
                                                      child: TextFormField(
                                                        controller: password,
                                                        obscureText: true,
                                                        style: const TextStyle(
                                                            color:
                                                                ColorConstants
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
                                                                  vertical: 18),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .transparent),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24.0), // Adjust the radius as needed
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
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
                                                        MainAxisAlignment.end,
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
                                                        child: Text(
                                                            'Olvidaste la contraseña',
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
                                                child: ElevatedButton(
                                                    onPressed: () => login(
                                                        context,
                                                        email,
                                                        password),
                                                    child: const Text('main')),
                                              ),
                                              Center(
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    Navigator.pushNamed(
                                                        context, '/register');
                                                  },
                                                  child: const Text('Register'),
                                                ),
                                              ),
                                            ],
                                          ))))),
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
