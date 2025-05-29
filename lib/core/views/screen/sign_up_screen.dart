import 'package:flutter/material.dart';
import 'package:newst_app/core/constants/app_image.dart';
import 'package:newst_app/core/constants/app_text.dart';
import 'package:newst_app/core/constants/color.dart';
import 'package:newst_app/core/views/screen/sign_in_screen.dart';
import 'package:newst_app/core/views/widgets/app_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImageAsset.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImageAsset.logo),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome To Newst"),
                  Text("Email"),
                  Form(
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColor.whigtColor,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "example@gmail.com",
                      ),
                    ),
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                      fontFamily: "D-DIN",
                      color: AppColor.black,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor.whigtColor,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "********",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                          color: AppColor.lightblack,
                        ),
                      ),
                    ),
                  ),
                  AppButton(text: AppText.signUp, myOnTap: () {}),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Have an account?  "),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignInScreen();
                        },
                      ),
                    );
                  },
                  child: Text("Sign In"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
