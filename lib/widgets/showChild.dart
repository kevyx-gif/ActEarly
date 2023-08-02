import 'package:flutter/material.dart';

class ShowChildWidget extends StatefulWidget {
  final String userType;

  ShowChildWidget(this.userType);

  @override
  _ShowChild createState() => _ShowChild();
}

class _ShowChild extends State<ShowChildWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.userType == 'simple') {
      // Access userType using widget property
      return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Center(child: Text('Hola')),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [Text("show childs")],
          ),
        ),
      );
    }
  }
}
