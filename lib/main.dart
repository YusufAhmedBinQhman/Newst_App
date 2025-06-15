import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newst_app/core/views/screen/home_screen.dart';
import 'package:newst_app/firebase_options.dart';
import 'package:newst_app/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const NewstApp());
}

class NewstApp extends StatelessWidget {
  const NewstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
