// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newst_app/splash_screen.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const NewstApp());
}

class NewstApp extends StatelessWidget {
  const NewstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
