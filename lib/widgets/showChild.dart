import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:actearly/widgets/child.dart';
import 'package:actearly/widgets/children.dart';

class ShowChildWidget extends StatefulWidget {
  DocumentSnapshot<Map<String, dynamic>>? userData;

  ShowChildWidget(this.userData);

  @override
  _ShowChild createState() => _ShowChild();
}

class _ShowChild extends State<ShowChildWidget> {
  @override
  Widget build(BuildContext context) {
    List<dynamic>? childrenData = widget.userData!.data()?['children'] ?? [];
    bool indicador = childrenData!.length == 1 ? false : true;
    ValueNotifier<Map<String, dynamic>> childData =
        ValueNotifier<Map<String, dynamic>>(childrenData[0]);

    return childrenData.length == 1
        ? child(childData, indicador)
        : children(childrenData);
  }
}
