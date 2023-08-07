import 'package:flutter/material.dart';

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
  DropdownButtonExample(this.list);

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
    return DropdownButton<String>(
      value: selectedValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          selectedValue = value!;
        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
