import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:simi_inmobiliaria/core/config/constans/constants.dart';
import 'package:simi_inmobiliaria/core/config/routes/routes.dart';
import 'package:video_player/video_player.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        backgroundColor: SimiColors.white,
        childWidget: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset("assets/images/logo.png"),
        ),
        onAnimationEnd: () => _goToVideoScreen(context),
        // nextScreen: const LoginScreen(),
      ),
    );
  }

  void _goToVideoScreen(BuildContext context) async {
    final controller = VideoPlayerController.asset('assets/images/video.mp4');
    // VideoPlayerController.networkUrl(
    //   Uri.parse(
    //     'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    //   ),
    // );

    await controller.initialize();

    if (context.mounted) {
      context.pushReplacement(PAGES.videoPlayer.screenPath, extra: controller);
    }
  }
}
