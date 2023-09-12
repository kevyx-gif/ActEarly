import 'package:actearly/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:actearly/utils/class.dart';

//Card Child
import 'package:actearly/widgets/cardChild.dart';

//Multimedia
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

class _addChild extends State<addChildWidget> with TickerProviderStateMixin {
  final Map<ListItem, Key> itemKeys = {};
  final List<ListItem> items = [];
  bool isButtonEnabled = true;
  ScrollController rawController = ScrollController();

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  );
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.easeIn);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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

    _controller.forward(from: 1.0);

    return MediaQuery(
      data: fixedMediaQueryData,
      child: Container(
          width: width,
          height: 0.94 * height,
          decoration: const BoxDecoration(
            color: ColorConstants.purple,
          ),
          child: Column(children: [
            Expanded(
              child: RawScrollbar(
                  isAlwaysShown: true,
                  controller: rawController,
                  thumbColor: ColorConstants.bgColor,
                  thickness: 7,
                  radius: Radius.circular(50),
                  child: ListView.builder(
                      controller: rawController,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        if (!itemKeys.containsKey(item)) {
                          itemKeys[item] = UniqueKey();
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
              child: isButtonEnabled
                  ? Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FadeTransition(
                                opacity: _animation,
                                child: Container(
                                  margin:
                                      EdgeInsets.fromLTRB(width * 0.1, 0, 0, 0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 7,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          primary: ColorConstants.white),
                                      child: AutoSizeText('btnAdd'.tr,
                                          style: TextStyle(
                                              color: ColorConstants.black,
                                              fontFamily: 'Archive',
                                              fontWeight: FontWeight.w600)),
                                      onPressed: () {
                                        setState(() {
                                          // Variables para almacenar
                                          final kidName =
                                              TextEditingController();
                                          final date = TextEditingController();
                                          final formKeyName =
                                              GlobalKey<FormState>();
                                          final formKeyDate =
                                              GlobalKey<FormState>();
                                          final formKeySwitch =
                                              GlobalKey<FormState>();
                                          final formKeyDecision =
                                              GlobalKey<FormState>();
                                          ValueNotifier<bool>
                                              switchValueNotifier =
                                              ValueNotifier<bool>(false);
                                          ValueNotifier<bool>
                                              decisionBtnNotifier =
                                              ValueNotifier<bool>(true);
                                          ValueNotifier<List<XFile>?>
                                              mediaFileList =
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
                                                formKeyDecision:
                                                    formKeyDecision,
                                                switchValue:
                                                    switchValueNotifier,
                                                decisionValue:
                                                    decisionBtnNotifier,
                                                mediaFileList: mediaFileList,
                                              );
                                            },
                                          ));
                                        });
                                      }),
                                )),
                            FadeTransition(
                                opacity: _animation,
                                child: Container(
                                  margin:
                                      EdgeInsets.fromLTRB(0, 0, width * 0.1, 0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 7,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          primary: ColorConstants.white),
                                      onPressed: () async {
                                        setState(() {
                                          isButtonEnabled = false;
                                        });
                                        final upload = await addChildDatabase(
                                            context, items, widget.documentId);
                                        setState(() {
                                          if (upload) {
                                            itemKeys.clear();
                                            items.clear();
                                            messageToast(
                                                context,
                                                'toastAddChild'.tr,
                                                ColorConstants.green,
                                                ColorConstants.white);
                                            _controller.forward(from: 0.0);
                                          }
                                          isButtonEnabled = true;
                                        });
                                      },
                                      child: AutoSizeText(
                                        'textAccept'.tr,
                                        style: TextStyle(
                                            color: ColorConstants.black,
                                            fontFamily: 'Archive',
                                            fontWeight: FontWeight.w600),
                                      )),
                                ))
                          ]),
                    )
                  : Container(
                      height: (0.94 * height) * 0.03,
                      width: width * 0.6,
                      alignment: Alignment.center,
                      child: LinearProgressIndicator(
                        backgroundColor: ColorConstants.white,
                        color: ColorConstants.purple,
                      ),
                    ),
            )
          ])),
    );
  }
}
