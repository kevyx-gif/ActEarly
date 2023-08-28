import 'package:flutter/material.dart';

//List Children
class children extends StatefulWidget {
  const children({super.key});

  @override
  State<children> createState() => _childrenState();
}

class _childrenState extends State<children> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Container(
        child: Text('hola'),
      ),
    );
  }
}
