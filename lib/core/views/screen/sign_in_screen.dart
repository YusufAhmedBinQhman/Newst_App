import 'package:flutter/material.dart';
import 'package:newst_app/core/constants/app_image.dart';
import 'package:newst_app/core/constants/color.dart';
import 'package:newst_app/core/views/screen/sign_up_screen.dart';
import 'package:newst_app/core/views/widgets/app_button.dart';
import 'package:newst_app/core/views/widgets/custom_TextFormField.dart';
import 'package:newst_app/services/firebase_services.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isObscure = true;
  String? myEmail;
  String? myPass;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImageAsset.background),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset(AppImageAsset.logo)),
                    // SizedBox(height: 20),
                    Text("Welcome To Newst"),
                    // SizedBox(height: 10),
                    Text("Email"),
                    CustomTextformfield(
                      myOnChanged: (value) {
                        setState(() {
                          myEmail = value;
                        });
                      },
                      hinitTxt: "example@gmail.com",
                    ),
                    // SizedBox(height: 10),
                    Text("Password"),
                    CustomTextformfield(
                      myOnChanged: (value) {
                        setState(() {
                          myPass = value;
                        });
                      },
                      hinitTxt: "**********",
                      suffix: IconButton(
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
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                          fontFamily: "D-DIN",
                          color: AppColor.primarycolor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.primarycolor,
                        ),
                      ),
                    ),
                    AppButton(
                      text: "Sign In",
                      myOnTap: () async {
                        if (myEmail!.isNotEmpty && myPass!.isNotEmpty) {
                          await FireaseServices().signInWithEmailAndPass(
                            myEmail!,
                            myPass!,
                            context,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please enter email and password"),
                            ),
                          );
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Do not have an account?  "),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: Text("Sign Up"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:newst_app/core/constants/app_image.dart';
// import 'package:newst_app/core/constants/color.dart';
// import 'package:newst_app/core/views/screen/sign_up_screen.dart';
// import 'package:newst_app/core/views/widgets/app_button.dart';

// class SignInScreen extends StatefulWidget {
//   SignInScreen({super.key});

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   bool isObscure = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(AppImageAsset.background),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           spacing: 25,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(AppImageAsset.logo),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 spacing: 10,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Welcome To Newst"),
//                   Text("Email"),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: AppColor.whigtColor,
//                       border: OutlineInputBorder(borderSide: BorderSide.none),
//                       hintText: "example@gmail.com",
//                     ),
//                   ),
//                   Text(
//                     "Password",
//                     style: TextStyle(
//                       fontFamily: "D-DIN",
//                       color: AppColor.black,
//                     ),
//                   ),
//                   TextFormField(
//                     obscureText: isObscure,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: AppColor.whigtColor,
//                       border: OutlineInputBorder(borderSide: BorderSide.none),
//                       hintText: "********",

//                       suffixIcon: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             isObscure = !isObscure;
//                           });
//                         },
//                         icon: Icon(
//                           isObscure ? Icons.visibility_off : Icons.visibility,
//                           color: AppColor.lightblack,
//                         ),
//                       ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     style: TextButton.styleFrom(padding: EdgeInsets.zero),
//                     child: Text(
//                       "Forget Password?",
//                       style: TextStyle(
//                         fontFamily: "D-DIN",
//                         color: AppColor.primarycolor,
//                         decoration: TextDecoration.underline,
//                         decorationColor: AppColor.primarycolor,
//                       ),
//                     ),
//                   ),
//                   AppButton(text: "Sign In", myOnTap: () {}),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Do not have an account?  "),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return const SignUpScreen();
//                         },
//                       ),
//                     );
//                   },
//                   child: Text("Sign Up"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
