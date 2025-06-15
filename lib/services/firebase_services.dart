import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newst_app/core/views/screen/home_screen.dart';

class FireaseServices {
  Future<void> signUpWithEmailAndPass(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User registered successfully');
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
    }
  }

  /////////////
  Future<void> signInWithEmailAndPass(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Login successful');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      // يمكنك توجيه المستخدم إلى الصفحة الرئيسية هنا
    } on FirebaseAuthException catch (e) {
      print('Login error: ${e.message}');
    }
  }
}
