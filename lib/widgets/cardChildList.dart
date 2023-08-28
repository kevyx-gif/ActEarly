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
                              widget.children['NameChild'],
                              style: TextStyle(
                                  color: ColorConstants.purple,
                                  fontFamily: 'Arcive',
                                  fontWeight: FontWeight.w700,
                                  fontSize: widget.width * 0.05),
                            ),
                          ),
                          Text(
                            widget.children['Date'],
                            style: TextStyle(
                                color: ColorConstants.black,
                                fontFamily: 'Arcive',
                                fontWeight: FontWeight.w700,
                                fontSize: widget.width * 0.03),
                          ),
                        ]),
                  ),
                  Container(
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
                                  onTap: () {},
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
                                  onTap: () {},
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
            left: widget.width * 0.13,
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
                child: CircleAvatar(
                  radius: 0.05 * widget.width,
                  backgroundImage: NetworkImage(widget.children['Picture']),
                )))
      ]),
    );
  }
}
