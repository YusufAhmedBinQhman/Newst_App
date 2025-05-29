import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  String myImage;
  String myTitle;
  String mySubtitle;
  WelcomeWidget({
    super.key,
    required this.myImage,
    required this.myTitle,
    required this.mySubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(myImage),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                myTitle,
                style: TextStyle(
                  fontFamily: "D-DIN",
                  color: Color(0xff4E4B66),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 326,
              child: Text(
                mySubtitle,
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontFamily: "D-DIN",
                  color: Color(0xff6E7191),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
