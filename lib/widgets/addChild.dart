import 'package:actearly/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:actearly/utils/class.dart';

//Card Child
import 'package:actearly/widgets/cardChild.dart';

//Multimedia
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';

//Text
import 'package:get/get.dart';

//text size adapable
import 'package:auto_size_text/auto_size_text.dart';

//import to toastMessage
import 'package:actearly/utils/functions.dart';

class addChildWidget extends StatefulWidget {
  final String documentId;

  addChildWidget({required this.documentId, super.key});

  @override
  _addChild createState() => _addChild();
}

class _addChild extends State<addChildWidget> {
  final Map<ListItem, Key> itemKeys = {};
  final List<ListItem> items = [];

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
          height: 0.94 * height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/img/register_child.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  height: (0.94 * height) * 0.9,
                  child: Scrollbar(
                      child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            if (!itemKeys.containsKey(item)) {
                              itemKeys[item] =
                                  UniqueKey(); // Generate a unique key for the item
                            }
                            final key = itemKeys[item];

                            return Dismissible(
                                key: ValueKey(key),
                                onDismissed: (DismissDirection direction) {
                                  setState(() {
                                    itemKeys.remove(item);
                                    items.removeAt(index);
                                  });
                                },
                                child: items[index].widgetBuilder(context));
                          })),
                ),
                Container(
                    height: (0.94 * height) * 0.08,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 7,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  primary: ColorConstants.white),
                              child: AutoSizeText('btnAdd'.tr,
                                  style: TextStyle(
                                      color: ColorConstants.TextGrayF,
                                      fontFamily: 'Archive',
                                      fontWeight: FontWeight.w600)),
                              onPressed: () {
                                setState(() {
                                  // Variables para almacenar
                                  final kidName = TextEditingController();
                                  final date = TextEditingController();
                                  final formKeyName = GlobalKey<FormState>();
                                  final formKeyDate = GlobalKey<FormState>();
                                  final formKeySwitch = GlobalKey<FormState>();
                                  final formKeyDecision =
                                      GlobalKey<FormState>();
                                  ValueNotifier<bool> switchValueNotifier =
                                      ValueNotifier<bool>(false);
                                  ValueNotifier<bool> decisionBtnNotifier =
                                      ValueNotifier<bool>(true);
                                  ValueNotifier<List<XFile>?> mediaFileList =
                                      ValueNotifier<List<XFile>?>(null);

                                  items.add(ListItem(
                                    widgetBuilder: (
                                      context,
                                    ) {
                                      return ChildW(
                                        context: context,
                                        kidName: kidName,
                                        date: date,
                                        formKeyName: formKeyName,
                                        formKeyDate: formKeyDate,
                                        formKeySwitch: formKeySwitch,
                                        formKeyDecision: formKeyDecision,
                                        switchValue: switchValueNotifier,
                                        decisionValue: decisionBtnNotifier,
                                        mediaFileList: mediaFileList,
                                      );
                                    },
                                  ));
                                });
                              }),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 7,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  primary: ColorConstants.white),
                              onPressed: () async {
                                final error = await addChildDatabase(
                                    context, items, widget.documentId);
                                setState(() {
                                  if (error) {
                                    itemKeys.clear();
                                    items.clear();
                                  }
                                });
                              },
                              child: AutoSizeText(
                                'textAccept'.tr,
                                style: TextStyle(
                                    color: ColorConstants.TextGrayF,
                                    fontFamily: 'Archive',
                                    fontWeight: FontWeight.w700),
                              ))
                        ])),
              ])),
    );
  }
}
