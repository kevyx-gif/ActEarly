import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:actearly/utils/colors.dart';

class DialogMedia extends StatefulWidget {
  DialogMedia({Key? key}) : super(key: key);

  @override
  _DialogMediaState createState() => _DialogMediaState();
}

class _DialogMediaState extends State<DialogMedia> {
  List<XFile>? _mediaFileList;

  final ImagePicker _picker = ImagePicker();

  Future<void> _onImageButtonPressed(
    ImageSource source,
    BuildContext context,
  ) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1080,
        maxHeight: 1920,
        imageQuality: 100,
      );
      setState(() {
        if (pickedFile != null) {
          _mediaFileList = [pickedFile];
        }
      });
    } catch (e) {
      setState(() {
        print('Pick image error: $e');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: Colors.transparent,
        height: height * 0.6,
        width: width * 0.8,
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(0),
        child: Column(
          children: [
            Container(
              height: (height * 0.6) * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: Colors.white,
              ),
              child: _mediaFileList != null
                  ? Container(
                      width: width * 0.8,
                      height: (height * 0.6) * 0.8,
                      child: Image.file(
                        repeat: ImageRepeat.noRepeat,
                        scale: BorderSide.strokeAlignCenter,
                        fit: BoxFit.cover,
                        File(_mediaFileList![0].path),
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return const Center(
                              child: Text('This image type is not supported'));
                        },
                      ),
                    )
                  : const Center(
                      child: Text(
                        'You have not yet picked an image.',
                        style: TextStyle(
                          fontFamily: 'Archive',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
            ),
            Container(
              height: (height * 0.6) * 0.20,
              width: (width * 0.8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
                color: Colors.blueAccent,
              ),
              child: Column(
                children: [
                  Container(
                    height: (height * 0.6) * 0.20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: ((height * 0.65) * 0.20) * 0.40,
                          height: ((height * 0.65) * 0.20) * 0.40,
                          child: FloatingActionButton(
                            backgroundColor: ColorConstants.TextGrayF,
                            onPressed: () {
                              _onImageButtonPressed(
                                ImageSource.gallery,
                                context,
                              );
                            },
                            heroTag: 'image0',
                            tooltip: 'Pick Image from gallery',
                            child: const Icon(Icons.photo),
                          ),
                        ),
                        if (_picker.supportsImageSource(ImageSource.camera))
                          Container(
                            width: ((height * 0.6) * 0.20) * 0.40,
                            height: ((height * 0.6) * 0.20) * 0.40,
                            child: FloatingActionButton(
                              backgroundColor: ColorConstants.TextGrayF,
                              onPressed: () {
                                _onImageButtonPressed(
                                  ImageSource.camera,
                                  context,
                                );
                              },
                              heroTag: 'image2',
                              tooltip: 'Take a Photo',
                              child: const Icon(Icons.camera_alt),
                            ),
                          ),
                        Container(
                          width: ((height * 0.6) * 0.20) * 0.70,
                          height: ((height * 0.6) * 0.20) * 0.40,
                          child: FloatingActionButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            backgroundColor: Colors.green,
                            onPressed: () {
                              Navigator.pop(context, _mediaFileList);
                            },
                            child: Text('Confirm'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
