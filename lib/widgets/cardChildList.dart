// ignore_for_file: must_be_immutable

import 'package:actearly/pages/main_screens/main_screen.dart';
import 'package:actearly/utils/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//Colors
import 'package:actearly/utils/colors.dart';
import 'package:get/get.dart';

class cardChildList extends StatefulWidget {
  DocumentSnapshot<Map<String, dynamic>>? userData;
  Map<String, dynamic> child;
  ValueNotifier<Map<String, dynamic>> selectChild;
  String email;
  final width;
  final height;

  cardChildList(this.email, this.child, double this.width, double this.height,
      {this.userData, required this.selectChild, super.key});

  @override
  State<cardChildList> createState() => _cardChildList();
}

//widget.userData!.data()?['children']
class _cardChildList extends State<cardChildList> {
  bool _imageLoadingFailed = false;

  @override
  void initState() {
    super.initState();
    checkImage(widget.child['Picture']);
  }

  @override
  void dispose() {
    // Dispose logic if needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> auxList =
        List.from(widget.userData?['children']);
    return Container(
      child: Stack(children: [
        Card(
          margin: EdgeInsets.only(top: widget.height * 0.08),
          color: ColorConstants.white,
          shadowColor: ColorConstants.black,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Container(
              alignment: Alignment.center,
              width: widget.width,
              height: widget.height * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: widget.height * 0.067),
                    width: widget.width * 0.4,
                    height: widget.height * 0.09,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: widget.width * 0.3,
                            height: widget.height * 0.04,
                            alignment: Alignment.center,
                            child: Text(
                              widget.child['NameChild'],
                              style: TextStyle(
                                  color: ColorConstants.purple,
                                  fontFamily: 'Arcive',
                                  fontWeight: FontWeight.w700,
                                  fontSize: widget.width * 0.05),
                            ),
                          ),
                          Text(
                            widget.child['Date'],
                            style: TextStyle(
                                color: ColorConstants.black,
                                fontFamily: 'Arcive',
                                fontWeight: FontWeight.w700,
                                fontSize: widget.width * 0.03),
                          ),
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: widget.height * 0.014),
                    width: widget.width * 0.38,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            width: widget.width * 0.08,
                            height: widget.width * 0.08,
                            child: ClipOval(
                              child: Material(
                                color:
                                    ColorConstants.blueNavbar, // Button color
                                child: InkWell(
                                  splashColor:
                                      ColorConstants.blueCard, // Splash color
                                  onTap: () {},
                                  child: SizedBox(
                                      width: widget.width * 0.09,
                                      height: widget.width * 0.09,
                                      child: Icon(
                                        Icons.edit,
                                        color: ColorConstants.white,
                                        size: widget.width * 0.04,
                                      )),
                                ),
                              ),
                            )),
                        Container(
                            alignment: Alignment.center,
                            width: widget.width * 0.08,
                            height: widget.width * 0.08,
                            child: ClipOval(
                              child: Material(
                                color:
                                    ColorConstants.blueNavbar, // Button color
                                child: InkWell(
                                  splashColor:
                                      ColorConstants.blueCard, // Splash color
                                  onTap: () {
                                    setState(() {
                                      widget.selectChild.value = widget.child;
                                    });
                                  },
                                  child: SizedBox(
                                      width: widget.width * 0.09,
                                      height: widget.width * 0.09,
                                      child: Icon(
                                        Icons.remove_red_eye,
                                        color: ColorConstants.white,
                                        size: widget.width * 0.04,
                                      )),
                                ),
                              ),
                            )),
                        Container(
                            alignment: Alignment.center,
                            width: widget.width * 0.08,
                            height: widget.width * 0.08,
                            child: ClipOval(
                              child: Material(
                                color:
                                    ColorConstants.blueNavbar, // Button color
                                child: InkWell(
                                  splashColor:
                                      ColorConstants.blueCard, // Splash color
                                  onTap: () async {
                                    setState(() {
                                      auxList.removeWhere((map) =>
                                          map['Id'] == widget.child['Id']);

                                      widget.userData!.data()?['children'] =
                                          auxList;
                                    });
                                    // Assuming updateChildDatabase is an asynchronous function
                                    await updateChildDatabase(context,
                                        widget.email, auxList, 'children');
                                  },
                                  child: SizedBox(
                                      width: widget.width * 0.09,
                                      height: widget.width * 0.09,
                                      child: Icon(
                                        Icons.delete,
                                        color: ColorConstants.white,
                                        size: widget.width * 0.04,
                                      )),
                                ),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              )),
        ),
        Positioned(
            top: 0,
            left: widget.width * 0.1,
            child: Container(
                width: widget.width * 0.22,
                height: widget.width * 0.22,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Color.fromARGB(190, 61, 61, 61),
                        spreadRadius: 3,
                        offset: Offset.fromDirection(-10))
                  ],
                ),
                child: _imageLoadingFailed
                    ? CircleAvatar(
                        radius: 0.05 * widget.width,
                        backgroundImage: AssetImage('lib/assets/img/pred.jpg'),
                      )
                    : CircleAvatar(
                        radius: 0.05 * widget.width,
                        backgroundImage: NetworkImage(
                          widget.child['Picture'],
                        ),
                      )))
      ]),
    );
  }
}
