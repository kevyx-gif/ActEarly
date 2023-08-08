import 'package:flutter/material.dart';

import 'package:actearly/widgets/child.dart';
import 'package:actearly/widgets/children.dart';

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
      return child(context);
    } else {
      return children(context);
    }
  }
}
