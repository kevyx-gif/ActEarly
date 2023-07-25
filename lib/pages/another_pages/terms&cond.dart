import 'package:flutter/material.dart';

//Text Imports
import 'package:get/get.dart';

//futures import
import 'package:actearly/utils/futures.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsScreen> createState() =>
      TermsAndConditionsScreenState();
}

class TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15),
          Text(
            "titleTermsCond".tr,
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Expanded(
            child: Card(
              margin: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.justify,
                        )),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: SizedBox.fromSize(
              size: Size(56, 56), // button width and height
              child: ClipOval(
                child: Material(
                  color: Colors.green, // button color
                  child: InkWell(
                      splashColor: Colors.lightGreen, // splash color
                      onTap: () {
                        acceptTermsAndConditionsAccepted();
                      }, // button pressed
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.task_alt_rounded,
                                color: Colors.white), // icon
                            Text(
                              "textAccept".tr,
                              style: TextStyle(color: Colors.white),
                            ), // text
                          ],
                        ),
                      )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
