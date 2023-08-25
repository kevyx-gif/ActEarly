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
            child: Column(children: [InfoCard()]),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        "Holi",
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text("Cuidador", style: TextStyle(color: Colors.white)),
    );
  }
}
