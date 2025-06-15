import 'package:flutter/material.dart';
import 'package:newst_app/core/constants/app_image.dart';
import 'package:newst_app/core/constants/app_text.dart';
import 'package:newst_app/core/constants/color.dart';
import 'package:newst_app/core/views/screen/sign_in_screen.dart';
import 'package:newst_app/core/views/widgets/app_button.dart';
import 'package:newst_app/core/views/widgets/custom_TextFormField.dart';
import 'package:newst_app/services/firebase_services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscure = true;
  String? myEmail;
  String? myPass;
  String? myConfirmPass;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImageAsset.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset(AppImageAsset.logo)),
                    Text("Welcome To Newst"),
                    Text("Email"),
                    CustomTextformfield(
                      myOnChanged: (value) {
                        setState(() {
                          myEmail = value;
                        });
                      },
                      hinitTxt: "example@gmail.com",
                    ),

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
                    /////////////
                    Text("Confirm Password"),
                    CustomTextformfield(
                      myOnChanged: (value) {
                        setState(() {
                          myConfirmPass = value;
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
                    AppButton(
                      text: AppText.signUp,
                      myOnTap: () async {
                        if (myEmail!.isNotEmpty &&
                            myPass!.isNotEmpty &&
                            myConfirmPass!.isNotEmpty) {
                          if (myPass == myConfirmPass) {
                            print("================${myEmail}===${myPass}");
                            await FireaseServices().signUpWithEmailAndPass(
                              myEmail!,
                              myPass!,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Password and Confirm Password are not same!!",
                                ),
                              ),
                            );
                          }
                        } else {
                          print("================${myEmail}=3333==${myPass}");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please fill in all fields"),
                            ),
                          );
                        }
                      },
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
                                builder: (context) => SignInScreen(),
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
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:newst_app/core/constants/app_image.dart';
// import 'package:newst_app/core/constants/app_text.dart';
// import 'package:newst_app/core/constants/color.dart';
// import 'package:newst_app/core/views/screen/sign_in_screen.dart';
// import 'package:newst_app/core/views/widgets/app_button.dart';
// import 'package:newst_app/services/firebase_services.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   bool isObscure = true;
//   String myEmail = "";
//   String myPass = "";
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
//                     onFieldSubmitted: (value) {
//                       setState(() {
//                         myEmail = value;
//                       });
//                     },
//                     onChanged: (value) {
//                       print(value);
//                     },
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
//                     onFieldSubmitted: (value) {
//                       setState(() {
//                         myPass = value;
//                         print(myPass);
//                       });
//                     },
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
//                   AppButton(
//                     text: AppText.signUp,
//                     myOnTap: () {
//                       setState(() async {
//                         await FireaseServices().signUpWithEmailAndPassword(
//                           myEmail!,
//                           myPass!,
//                         );
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Have an account?  "),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return SignInScreen();
//                         },
//                       ),
//                     );
//                   },
//                   child: Text("Sign In"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
