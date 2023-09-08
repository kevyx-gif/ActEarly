// ignore_for_file: must_be_immutable

import 'package:actearly/utils/colors.dart';
import 'package:flutter/material.dart';

class IndicatorCard extends StatefulWidget {
  String question;
  String answer;
  double width;
  double height;
  Function(String) onAnswerChanged; // Nueva función de callback
  IndicatorCard(this.question, this.width, this.height, this.answer,
      {required this.onAnswerChanged, Key? key})
      : super(key: key);

  @override
  State<IndicatorCard> createState() => _IndicatorCard();
}

class _IndicatorCard extends State<IndicatorCard> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstants.white,
      shadowColor: ColorConstants.black,
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: [
          Container(
            width: widget.width * 0.82,
            height: widget.height * 0.1,
            child: Center(
              child: Container(
                width: widget.width * 0.65,
                height: widget.height * 0.15,
                alignment: Alignment.center,
                child: Text(
                  widget.question,
                  style: TextStyle(fontFamily: 'Archive'),
                ),
              ),
            ),
          ),
          Container(
            width: widget.width * 0.8,
            height: widget.height * 0.12,
            child: Center(
              child: Container(
                width: widget.width * 0.77,
                height: widget.height * 0.09,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print(widget.answer);
                        setState(() {
                          widget.onAnswerChanged('no');
                        });
                        print(widget.answer);
                      },
                      child: Text('No',
                          style: TextStyle(fontSize: widget.width * 0.04)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.answer == 'no'
                            ? ColorConstants.btnColor
                            : ColorConstants.TextGray,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // <-- Radius
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.onAnswerChanged('');
                        });
                      },
                      child: Text('Todavia No',
                          style: TextStyle(fontSize: widget.width * 0.04)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.answer == ''
                            ? ColorConstants.btnColor
                            : ColorConstants.TextGray,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.onAnswerChanged('yes');
                        });
                      },
                      child: Text('Sí',
                          style: TextStyle(fontSize: widget.width * 0.04)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.answer == 'yes'
                            ? ColorConstants.btnColor
                            : ColorConstants.TextGray,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // <-- Radius
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
