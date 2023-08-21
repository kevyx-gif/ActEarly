import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class MyVideoWidget extends StatefulWidget {
  ValueNotifier<VideoPlayerController?> controller;

  MyVideoWidget({required this.controller});
  @override
  _MyVideoWidgetState createState() => _MyVideoWidgetState();
}

class _MyVideoWidgetState extends State<MyVideoWidget> {
  @override
  void initState() {
    super.initState();

    // Inicializa el controlador de video y empieza a reproducir automáticamente
    widget.controller.value?.initialize();
    widget.controller.value?.setLooping(true);
    widget.controller.value?.play();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.controller.value!.value.aspectRatio,
      child: VideoPlayer(widget.controller.value!),
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    widget.controller.value = null; // Libera recursos al salir del widget
    super.dispose();
  }
}
