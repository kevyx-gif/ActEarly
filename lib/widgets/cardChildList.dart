import 'package:actearly/widgets/children.dart';
import 'package:flutter/material.dart';

//Colors
import 'package:actearly/utils/colors.dart';

class cardChildList extends StatefulWidget {
  var children;
  final width;
  final height;

  cardChildList(this.children, double this.width, double this.height,
      {super.key});

  @override
  State<cardChildList> createState() => _cardChildList();
}

class _cardChildList extends State<cardChildList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.blue,
      margin: EdgeInsets.symmetric(horizontal: widget.width * 0.03),
      child: Card(
          margin: EdgeInsets.only(top: widget.height * 0.07),
          color: ColorConstants.white,
          shadowColor: ColorConstants.black,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )),
    );
  }
}
