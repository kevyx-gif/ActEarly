import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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
        body: Stack(
          children: [
            const Text(''),
            menuBtn(
              riveOnInit: (artboard) {},
              press: () {},
            )
          ],
        ));
  }
}

class menuBtn extends StatelessWidget {
  const menuBtn({
    required this.press,
    required this.riveOnInit,
    super.key,
  });

  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(left: 16, top: 16),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 3), blurRadius: 8)
            ]),
        child: Icon(Icons.menu),
      ),
    ));
  }
}
