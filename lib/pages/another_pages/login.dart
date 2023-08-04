import "package:flutter/material.dart";
import 'package:actearly/utils/futures.dart';
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
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/img/bg_login.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'greeting'.tr,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Archive',
                        color: ColorConstants.white,
                      ),
                    ),
                    Text(
                      'tittleLogin'.tr,
                      style: TextStyle(
                          color: ColorConstants.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Archive'),
                    ),
                  ],
                )),
                Center(
                  child: Text(
                    'subtittleLogin'.tr,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Archive',
                      color: ColorConstants.white,
                    ),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 700,
                    child: Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(25, 15, 25, 25),
                            child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Act',
                                                style: TextStyle(
                                                    color: ColorConstants.blue,
                                                    fontFamily: 'Work_Sans',
                                                    fontSize: 34)),
                                            Text('Early',
                                                style: TextStyle(
                                                    color: ColorConstants
                                                        .purpleGray,
                                                    fontFamily: 'Work_Sans',
                                                    fontSize: 34))
                                          ]),
                                    ),
                                    Center(
                                        child: Text('Learn the signs.',
                                            style: TextStyle(
                                                color: ColorConstants.purple,
                                                fontFamily: 'Work_Sans',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700))),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 16),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'correo',
                                          ),
                                          controller: email,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 16),
                                        child: TextFormField(
                                          controller: password,
                                          obscureText: true,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Password',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            //Found Email Navigator.pushNamed(context, '/main');
                                            if (await searchByFieldInCollection(
                                                'users', 'email', email.text)) {
                                              //found password
                                              if (await searchByFieldInCollection(
                                                  'users',
                                                  'password',
                                                  password.text)) {
                                                Navigator.pushNamed(
                                                    context, '/main');
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                  'wrongPassword'.tr,
                                                  textAlign: TextAlign.center,
                                                )));
                                              }
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                'wrongEmail'.tr,
                                                textAlign: TextAlign.center,
                                              )));
                                            }
                                          },
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
            )));
  }
}
