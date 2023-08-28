import "package:flutter/material.dart";

class DateChildren extends StatefulWidget {
  const DateChildren({ super.key });

  @override
  State<DateChildren> createState() => _DateChildrenState();
}

class _DateChildrenState extends State<DateChildren> {

  final titleDate = TextEditingController();
  final date = TextEditingController();
  final timeDate = TextEditingController();
  final descriptionDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Date Children'),
      ),  
      body: const Center(
        child: Text('Page Date Children'),
      ),
    );
  }
}