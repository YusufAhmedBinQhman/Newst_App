import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:newst_app/core/constants/app_image.dart';
import 'package:newst_app/core/views/screen/welcom_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      animationCurve: Curves.bounceOut,
      duration: Duration(seconds: 3),
      backgroundImage: Image.asset(AppImageAsset.background),
      childWidget: Image.asset(AppImageAsset.logo),

      nextScreen: WelcomeScreen(),
    );
  }
}
