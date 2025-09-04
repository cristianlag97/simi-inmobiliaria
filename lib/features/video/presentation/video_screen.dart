import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simi_inmobiliaria/core/config/routes/routes.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    controller.play(); // asegúrate de que empiece a reproducir
    controller.setVolume(0.0);

    // Cambiar después de 5 segundos
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        context.pushReplacement(PAGES.login.screenPath);
        controller.pause();
      }
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
      ),
    );
  }
}
