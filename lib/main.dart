import 'package:flutter/material.dart';
import 'package:newst_app/splash_screen.dart';

void main() {
  runApp(const NewstApp());
}

class NewstApp extends StatelessWidget {
  const NewstApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const SplashScreen());
  }
}
