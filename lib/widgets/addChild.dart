import 'package:flutter/material.dart';
import 'package:actearly/utils/class.dart';
import 'package:actearly/widgets/cardChild.dart';

class addChildWidget extends StatefulWidget {
  @override
  _addChild createState() => _addChild();
}

class _addChild extends State<addChildWidget> {
  final List<ListItem> items = [];
  var indexList = 0;

  @override
  Widget build(BuildContext context) {
    // Obtén la información de escalabilidad actual del dispositivo
    final mediaQueryData =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window);

    // Establece la información de escalabilidad manualmente para deshabilitarla
    final fixedMediaQueryData = mediaQueryData.copyWith(
      textScaleFactor: 1.0, // Establece un factor de escala fijo
    );

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return MediaQuery(
        data: fixedMediaQueryData,
        child: Container(
            width: width,
            height: 0.940 * height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/img/register_child.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      height: (0.935 * height) * 0.9,
                      child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final keyU = UniqueKey();
                            return Dismissible(
                                key: ValueKey(keyU),
                                onDismissed: (DismissDirection direction) {
                                  setState(() {
                                    items.removeAt(index);
                                  });
                                },
                                child: items[index].widgetBuilder(context));
                          })),
                  Container(
                      height: (0.935 * height) * 0.1,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                child: Text('Add'),
                                onPressed: () {
                                  setState(() {
                                    // Variables para almacenar kidName y date
                                    final kidName = TextEditingController();
                                    final date = TextEditingController();
                                    final formKey = GlobalKey<FormState>();
                                    items.addAll({
                                      ListItem(
                                          widgetBuilder: (context) => ChildW(
                                              context, kidName, date, formKey))
                                    });
                                    indexList++;
                                  });
                                }),
                            ElevatedButton(
                                onPressed: () {}, child: Text('Accept'))
                          ])),
                ])));
  }
}
