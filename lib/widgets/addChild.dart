import 'package:flutter/material.dart';

class addChildWidget extends StatefulWidget {
  @override
  _addChild createState() => _addChild();
}

class _addChild extends State<addChildWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [Text("Holi new child")],
      ),
    ));
  }
}
