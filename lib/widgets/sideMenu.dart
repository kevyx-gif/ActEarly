import 'package:actearly/widgets/cardSideMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 200,
          height: double.infinity,
          color: Color(0xFF17203A),
          child: SafeArea(
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Divider(
                    color: Colors.white24,
                    height: 1,
                  )),
              InfoCard(name: 'perfil', about: 'cuidador'),
              ListTile(
                leading: SizedBox(
                  height: 34,
                  width: 34,
                  child: Icon(Icons.send),
                ),
                title:
                    Text('Send info.', style: TextStyle(color: Colors.white)),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
