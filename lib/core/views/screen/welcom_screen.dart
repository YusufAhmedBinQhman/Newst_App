import 'package:flutter/material.dart';
import 'package:newst_app/core/constants/app_image.dart';
import 'package:newst_app/core/constants/app_text.dart';
import 'package:newst_app/core/views/screen/sign_in_screen.dart';
import 'package:newst_app/core/views/widgets/app_button.dart';
import 'package:newst_app/core/views/widgets/welcome_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController welcomeController = PageController();
  int currentIndex = 0;

  List<Widget> welcomeScreenWidget = [
    WelcomeWidget(
      myImage: AppImageAsset.onBoardingImageOne,
      myTitle: AppText.titleOnBord1,
      mySubtitle: AppText.titleOnBord2,
    ),
    WelcomeWidget(
      myImage: AppImageAsset.onBoardingImageOne,
      myTitle: AppText.titleOnBord1,
      mySubtitle: AppText.titleOnBord2,
    ),
    WelcomeWidget(
      myImage: AppImageAsset.onBoardingImageOne,
      myTitle: AppText.titleOnBord1,
      mySubtitle: AppText.titleOnBord2,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 20),
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Color(0xffC53030),
                  fontSize: 16,
                  fontFamily: "D-DIN",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: welcomeController,
              children: welcomeScreenWidget,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: const EdgeInsets.only(right: 5),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      currentIndex == index
                          ? Color(0xffC53030)
                          : Color(0xffD3D3D3),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 5),
            child: AppButton(
              text: currentIndex == 2 ? "Get Started" : "Next",
              myOnTap:
                  currentIndex == 2
                      ? () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignInScreen();
                            },
                          ),
                        );
                      }
                      : () {
                        welcomeController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
            ),
          ),
        ],
      ),
    );
  }
}
