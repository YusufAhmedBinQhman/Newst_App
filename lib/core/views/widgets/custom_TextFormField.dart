import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:newst_app/core/constants/color.dart';

class CustomTextformfield extends StatelessWidget {
  Function(String?) myOnChanged;
  String? hinitTxt;
  Widget? suffix;
  CustomTextformfield({
    super.key,
    required this.myOnChanged,
    this.hinitTxt,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: myOnChanged,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.whigtColor,
        border: OutlineInputBorder(borderSide: BorderSide.none),
        hintText: hinitTxt,
        suffixIcon: suffix,
      ),
    );
  }
}
