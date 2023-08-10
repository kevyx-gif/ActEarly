import 'package:flutter/material.dart';

//Colors
import 'package:actearly/utils/colors.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //List<String> optionsList = ['Option 1', 'Option 2', 'Option 3'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DropdownButton'),
        ),
        body: Center(
            //child: DropdownButtonExample(optionsList),
            ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  final List<String> list;
  final TextEditingController controller;
  final String tittle;
  DropdownButtonExample(
      this.list, TextEditingController this.controller, String this.tittle);

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String selectedValue = "";

  @override
  void initState() {
    super.initState();
    selectedValue = widget.list.first;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0.039 * width, 0, 0, 0),
              child: Text(widget.tittle),
            )
          ],
        ),
        Container(
            width: 0.75 * width,
            height: 0.065 * height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: ColorConstants.BackgroundGray,
            ),
            margin: EdgeInsets.fromLTRB(0, 0.005 * height, 0, 0),
            padding: EdgeInsets.fromLTRB(
                0.06 * width, 0.004 * height, 0.03 * width, 0),
            child: DropdownButton<String>(
              isExpanded: true,
              alignment: Alignment.centerLeft,
              value: selectedValue,
              icon: const Icon(Icons.arrow_drop_down_sharp),
              style: const TextStyle(color: ColorConstants.TextGrayF),
              underline: Container(
                height: 0,
                color: const Color.fromARGB(0, 124, 77, 255),
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  selectedValue = value!;
                  widget.controller.text = value;
                });
              },
              items: widget.list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ))
      ],
    ));
  }
}
