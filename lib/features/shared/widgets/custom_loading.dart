import 'package:flutter/material.dart';

class CustomLoadingLogo extends StatefulWidget {
  const CustomLoadingLogo({super.key});

  @override
  State<CustomLoadingLogo> createState() => _CustomLoadingLogoState();
}

class _CustomLoadingLogoState extends State<CustomLoadingLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // gira indefinidamente
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Center(
      child: RotationTransition(
        turns: _controller,
        child: Image.asset(
          'assets/images/logo.png',
          width: size.height * 0.2,
          height: size.height * 0.2,
        ),
      ),
    );
  }
}
