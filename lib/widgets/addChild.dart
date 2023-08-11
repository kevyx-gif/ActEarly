import 'package:flutter/material.dart';

class addChildWidget extends StatefulWidget {
  @override
  _addChild createState() => _addChild();
}

class _addChild extends State<addChildWidget> {
  List<String> testData = ['One', 'Two'];

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
        child: Scaffold(
            resizeToAvoidBottomInset:
                false, // Stops widgets from being moved by keyboard
            appBar: AppBar(title: Text('Test')),
            body: Column(children: [
              Flexible(
                  flex: 1,
                  child: ListView.builder(
                      itemCount: testData.length,
                      itemBuilder: (context, index) {
                        return Card(child: Text(testData[index]));
                      })),
              Flexible(
                  flex: 1,
                  child: Row(children: [
                    ElevatedButton(
                        child: Text('Add'),
                        onPressed: () {
                          setState(() {
                            testData.add('Test');
                          });
                        }),
                    ElevatedButton(
                        child: Text('Remove'),
                        onPressed: () {
                          setState(() {
                            if (testData.length > 0) {
                              testData.removeLast();
                            }
                          });
                        })
                  ]))
            ])));
  }
}
