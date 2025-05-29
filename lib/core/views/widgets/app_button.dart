import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String? text;
  VoidCallback myOnTap;
  AppButton({super.key, required this.text, required this.myOnTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(330, 48),
        backgroundColor: Color(0xffC53030),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      ),
      onPressed: myOnTap,
      child: Text(
        "${text}",
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontFamily: "D-DIN",
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
