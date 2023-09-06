import 'package:actearly/pages/another_pages/indicatorsMain.dart';
import 'package:actearly/utils/colors.dart';
import 'package:flutter/material.dart';

class sphereIndicator extends StatefulWidget {
  ValueNotifier<Map<String, dynamic>> child;
  List yearsOld;
  int totalIndex;
  double width;
  sphereIndicator(this.child, this.yearsOld, this.totalIndex, this.width,
      {super.key});

  @override
  State<sphereIndicator> createState() => _sphereIndicator();
}

class _sphereIndicator extends State<sphereIndicator> {
  int yearsOldNum = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  indicatorMain(widget.child, widget.totalIndex)),
        );
      },
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
        backgroundColor: MaterialStateProperty.all(
            ColorConstants.borderBtnColor), // <-- Button color
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed))
            return ColorConstants.btnColor; // <-- Splash color
        }),
      ),
    );
  }
}
