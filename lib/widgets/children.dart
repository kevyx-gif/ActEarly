// ignore_for_file: must_be_immutable

import 'package:actearly/widgets/cardChildList.dart';
import 'package:actearly/widgets/child.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//Colors
import 'package:actearly/utils/colors.dart';

class children extends StatefulWidget {
  DocumentSnapshot<Map<String, dynamic>>? userData;
  String email;
  children(this.userData, this.email, {super.key});

  @override
  State<children> createState() => _childrenState();
}

class _childrenState extends State<children> {
  final ScrollController controller = ScrollController();
  ValueNotifier<Map<String, dynamic>> selectChild =
      ValueNotifier<Map<String, dynamic>>({});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool indicador = true;

  @override
  void dispose() {
    // Dispose logic if needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<dynamic>? listChildren = widget.userData!.data()?['children'] ?? [];

    return ValueListenableBuilder<Map<String, dynamic>>(
        valueListenable: selectChild,
        builder: (BuildContext context, Map<String, dynamic> selectedChild,
            Widget? childWidget) {
          return selectedChild.isEmpty
              ? Scaffold(
                  key: _scaffoldKey,
                  body: Container(
                    width: width,
                    height: 0.94 * height,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(65, 217, 227, 252),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: height * 0.05, left: width * 0.08),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'My\nChildren',
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: ColorConstants.purple,
                                  fontFamily: 'Archive',
                                  fontSize: width * 0.09,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  top: height * 0.1, left: width * 0.04),
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03),
                              width: width * 0.93,
                              height: height * 0.5,
                              child: Scrollbar(
                                  controller: controller,
                                  child: GridView.builder(
                                      padding: EdgeInsets.symmetric(
                                          vertical: height * 0.01),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: width * 0.07,
                                              mainAxisSpacing: 25,
                                              childAspectRatio: 3 / 3.5),
                                      itemCount: listChildren?.length,
                                      itemBuilder:
                                          (BuildContext ctxt, int index) {
                                        return Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 15, 5),
                                            child: cardChildList(
                                              widget.email,
                                              listChildren?[index],
                                              width * 0.9,
                                              height * 0.6,
                                              selectChild: selectChild,
                                              userData: widget.userData,
                                            ));
                                      })))
                        ]),
                  ))
              : child(selectChild, indicador);
        });
  }
}
