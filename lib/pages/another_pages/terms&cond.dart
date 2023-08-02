import 'package:flutter/material.dart';

//Checar plataforma
import 'dart:io' show Platform;

//Progress Indicador IOS
import 'package:flutter/cupertino.dart';

//Text Imports
import 'package:get/get.dart';

//futures import
import 'package:actearly/utils/futures.dart';

//colors import
import 'package:actearly/utils/colors.dart';

enum ButtonState { init, loading, done }

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsScreen> createState() =>
      TermsAndConditionsScreenState();
}

class TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  bool isAnimating = true;
  ButtonState state = ButtonState.init;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isStretched = isAnimating || state == ButtonState.init;
    final isDone = state == ButtonState.done;
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/assets/img/bg4.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Text(
              "titleTermsCond".tr,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0, 4),
                    blurRadius: 25,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 25),
                child: Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 4),
                    scrollDirection: Axis.vertical,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 4),
                        child: Text(
                          "termsAndCond".tr,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.justify,
                        )),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
            padding: EdgeInsets.all(8),
            child: Center(
                child: AnimatedContainer(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    width: state == ButtonState.init ? width : 50,
                    onEnd: () => setState(() => isAnimating = !isAnimating),
                    height: 40,
                    child: isStretched
                        ? buildButton()
                        : buildSmallButton(isDone))),
          )
        ],
      ),
    ));
  }

  Widget buildButton() => Container(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              side: BorderSide(width: 2, color: Colors.blue.shade600)),
          onPressed: () async {
            setState(() => state = ButtonState.loading);
            await Future.delayed(Duration(milliseconds: 1200));
            setState(() => state = ButtonState.done);
            await Future.delayed(Duration(milliseconds: 1200));
            acceptTermsAndConditionsAccepted();
            //Mandar al login
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: FittedBox(
            child: Text('textAccept'.tr,
                style: TextStyle(fontSize: 18, color: Colors.white)),
          )));

  Widget buildSmallButton(bool isDone) {
    final color = isDone ? Colors.green : ColorConstants.btnColor;

    return Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: isDone
            ? Icon(Icons.done, size: 30, color: Colors.white)
            : Center(
                child: SizedBox(
                child: Center(
                    child: Platform.isAndroid
                        ? CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          )
                        : CupertinoActivityIndicator()),
                height: 30.0,
                width: 30.0,
              )));
  }
}
