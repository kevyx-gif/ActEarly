import 'package:flutter/material.dart';
import 'package:actearly/utils/colors.dart';

//btn switch
import 'package:actearly/widgets/tools/tools.dart';

Widget ChildW(BuildContext context, TextEditingController kidNameController,
    TextEditingController dateController, formKey) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  return Container(
      width: width * 0.85,
      height: height * 0.28,
      margin: EdgeInsets.fromLTRB(0, 0, 0, height * 0.01),
      child: Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          color: ColorConstants.white,
          shadowColor: ColorConstants.black,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Column(
            children: [
              Container(
                width: width * 0.84,
                height: height * 0.25,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: width * 0.25,
                        height: height * 0.24,
                        color: ColorConstants.BackgroundGray,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(onPressed: () {}, icon: Icon(Icons.add))
                          ],
                        ),
                      ),
                      Container(
                        width: width * 0.52,
                        height: height * 0.24,
                        color: ColorConstants.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: TextFormField(
                                key: formKey,
                                controller: kidNameController,
                                obscureText: false,
                                style: const TextStyle(
                                    color: ColorConstants.TextGray),
                                decoration: InputDecoration(
                                  fillColor: ColorConstants.BackgroundGray,
                                  filled: true,
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(20, 10, 0, 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(
                                        24.0), // Adjust the radius as needed
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(
                                        24.0), // Adjust the radius as needed
                                  ),
                                  hintText: 'Nombre',
                                  hintStyle:
                                      const TextStyle(fontFamily: 'Archive'),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: TextFormField(
                                controller: dateController,
                                obscureText: false,
                                style: const TextStyle(
                                    color: ColorConstants.TextGray),
                                decoration: InputDecoration(
                                  fillColor: ColorConstants.BackgroundGray,
                                  filled: true,
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(20, 10, 0, 10),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(
                                        24.0), // Adjust the radius as needed
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(
                                        24.0), // Adjust the radius as needed
                                  ),
                                  hintText: 'Fecha',
                                  hintStyle:
                                      const TextStyle(fontFamily: 'Archive'),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ],
          )));
}
