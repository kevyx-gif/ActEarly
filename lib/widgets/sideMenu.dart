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
              InfoCard(name: 'perfil', about: 'cuidador'),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Browse".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              sideMenu()
            ]),
          ),
        ),
      ),
    );
  }
}

class sideMenu extends StatelessWidget {
  const sideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Divider(
              color: Colors.white24,
              height: 1,
            )),
        ListTile(
          leading: SizedBox(
            height: 34,
            width: 34,
            child: Icon(Icons.send),
          ),
          title: Text('Send info.', style: TextStyle(color: Colors.white)),
        )
      ],
    );
  }
}
