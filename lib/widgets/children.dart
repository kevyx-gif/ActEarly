// ignore_for_file: must_be_immutable

import 'package:actearly/widgets/cardChildList.dart';
import 'package:flutter/material.dart';

//Colors
import 'package:actearly/utils/colors.dart';

class children extends StatefulWidget {
  List<dynamic>? userData;

  children(this.userData, {super.key});

  @override
  State<children> createState() => _childrenState();
}

class _childrenState extends State<children> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<dynamic> children = widget.userData ?? [];

    return Scaffold(
        body: Container(
      width: width,
      height: 0.94 * height,
      decoration: BoxDecoration(
        color: Color(0xFFD9E3FC),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'My Children',
              style: TextStyle(
                  color: ColorConstants.purple,
                  fontFamily: 'Archive',
                  fontSize: width * 0.08,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.02),
              color: ColorConstants.BackgroundGray,
              width: width * 0.9,
              height: height * 0.6,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: children.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return cardChildList(
                        children[index], width * 0.9, height * 0.6);
                  }),
            )
          ]),
    ));
  }
}
