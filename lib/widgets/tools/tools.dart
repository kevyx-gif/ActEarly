import 'package:flutter/material.dart';

//Separator ------- or ----------- //

Widget buildOrSeparator() {
  return Container(
      margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'OR',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontFamily: 'Archive',
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ));
}
