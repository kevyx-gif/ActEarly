// ignore_for_file: must_be_immutable

import 'package:actearly/pages/another_pages/indicatorsMain.dart';
import 'package:actearly/utils/colors.dart';
import 'package:flutter/material.dart';

class sphereIndicator extends StatefulWidget {
  ValueNotifier<Map<String, dynamic>> child;
  List yearsOld;
  int totalIndex;
  double width;
  String email;
  List<dynamic> children;
  int months;
  sphereIndicator(this.child, this.yearsOld, this.totalIndex, this.width,
      this.email, this.children, this.months,
      {super.key});

  @override
  State<sphereIndicator> createState() => _sphereIndicator();
}

class _sphereIndicator extends State<sphereIndicator> {
  int yearsOldNum = 0;
  bool oldEnough = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('meses en indicadorSphere');
    print(widget.months);

    if (widget.totalIndex == 0 && widget.months >= 0) {
      oldEnough = true;
    }

    if (widget.totalIndex == 1 && widget.months >= 8) {
      oldEnough = true;
    }

    if (widget.totalIndex == 2 && widget.months >= 12) {
      oldEnough = true;
    }

    if (widget.totalIndex == 3 && widget.months >= 18) {
      oldEnough = true;
    }

    if (widget.totalIndex == 4 && widget.months >= 24) {
      oldEnough = true;
    }

    if (widget.totalIndex == 5 && widget.months >= 35) {
      oldEnough = true;
    }

    return ElevatedButton(
      onPressed: oldEnough
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => indicatorMain(widget.child,
                        widget.totalIndex, widget.email, widget.children, 0)),
              );
            }
          : null,
      child: Text(
        widget.yearsOld[widget.totalIndex],
        maxLines: 2,
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Archive', fontWeight: FontWeight.w600),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: widget.width * 0.04)),
        backgroundColor: MaterialStateProperty.all(oldEnough
            ? ColorConstants.borderBtnColor
            : ColorConstants.BackgroundGray), // <-- Button color
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed))
            return ColorConstants.btnColor;
          return null; // <-- Splash color
        }),
      ),
    );
  }
}
