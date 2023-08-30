import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:actearly/widgets/child.dart';
import 'package:actearly/widgets/children.dart';

class ShowChildWidget extends StatefulWidget {
  DocumentSnapshot<Map<String, dynamic>>? userData;
  String email;

  ShowChildWidget(this.userData, this.email, {super.key});

  @override
  _ShowChild createState() => _ShowChild();
}

class _ShowChild extends State<ShowChildWidget> {
  @override
  Widget build(BuildContext context) {
    List<dynamic>? childrenData = widget.userData!.data()?['children'] ?? [];
    bool indicador = childrenData!.length == 1 ? false : true;

    if (!childrenData.isEmpty) {
      ValueNotifier<Map<String, dynamic>> childData =
          ValueNotifier<Map<String, dynamic>>(childrenData[0]);

      return childrenData.length == 1
          ? child(childData, indicador)
          : children(widget.userData, widget.email);
    } else {
      return children(widget.userData, widget.email);
    }
  }
}
