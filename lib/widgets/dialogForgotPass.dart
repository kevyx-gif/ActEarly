import 'package:actearly/utils/colors.dart';
import 'package:actearly/utils/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class dialogPass extends StatefulWidget {
  double width;
  double height;
  dialogPass(this.width, this.height, {super.key});

  @override
  _dialogPass createState() => _dialogPass();
}

class _dialogPass extends State<dialogPass> {
  final question = TextEditingController();
  final email = TextEditingController();
  final emailKey = GlobalKey<FormState>();
  final questionKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            child: Container(
                width: widget.width * 0.9,
                height: widget.height * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: widget.height * 0.08),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ColorConstants.purpleGray),
                      width: widget.width * 0.9,
                      height: widget.height * 0.3,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: widget.height * 0.05),
                          child: Text(
                            'Veuillez entrer votre adresse e-mail et la réponse à votre question de récupération. Votre mot de passe sera envoyé à votre adresse e-mail. Merci !',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: ColorConstants.white,
                                fontFamily: 'Archive',
                                fontSize: widget.width * 0.05,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: widget.width * 0.75,
                      height: widget.height * 0.12,
                      child: Center(
                        child: Form(
                          key: emailKey,
                          child: TextFormField(
                            controller: email,
                            style:
                                const TextStyle(color: ColorConstants.TextGray),
                            decoration: InputDecoration(
                              fillColor: ColorConstants.BackgroundGray,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 18),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(
                                    24.0), // Adjust the radius as needed
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(
                                    24.0), // Adjust the radius as needed
                              ),
                              hintText: 'titleEmail'.tr,
                              hintStyle: const TextStyle(fontFamily: 'Archive'),
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
                    ),
                    Container(
                      width: widget.width * 0.75,
                      height: widget.height * 0.12,
                      child: Center(
                        child: Form(
                          key: questionKey,
                          child: TextFormField(
                            controller: question,
                            style:
                                const TextStyle(color: ColorConstants.TextGray),
                            decoration: InputDecoration(
                              fillColor: ColorConstants.BackgroundGray,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 18),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(
                                    24.0), // Adjust the radius as needed
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(
                                    24.0), // Adjust the radius as needed
                              ),
                              hintText: 'titleQuestion'.tr,
                              hintStyle: const TextStyle(fontFamily: 'Archive'),
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
                    ),
                    Container(
                      width: widget.width * 0.9,
                      height: widget.height * 0.2,
                      child: Center(
                        child: Container(
                            width: widget.width * 0.4,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40))),
                                    elevation: MaterialStatePropertyAll(5),
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorConstants.btnColor)),
                                onPressed: () async {
                                  if (emailKey.currentState!.validate() &&
                                      questionKey.currentState!
                                          .validate()) if (await forgotPass(
                                      email.text, question.text)) {
                                    messageToast(
                                        context,
                                        'password sent',
                                        ColorConstants.green,
                                        ColorConstants.white);
                                  } else {
                                    messageToast(
                                        context,
                                        'verify your data',
                                        ColorConstants.red,
                                        ColorConstants.white);
                                  }
                                },
                                child: Text('textAccept'.tr))),
                      ),
                    ),
                  ],
                ))));
  }
}
