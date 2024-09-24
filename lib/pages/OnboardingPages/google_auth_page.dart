import 'package:flutter/material.dart';
import 'package:hck_app/pages/OnboardingPages/OnboardingMianPage.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_heading.dart';
import 'package:hck_app/resources/text_subheading.dart';

class GoogleAuthPage extends StatelessWidget {
  const GoogleAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundWhite,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      child:
                          Image.asset('assets/images/hck_ing_group_logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.asset('assets/images/illustration.png'),
                ),
                TextHeading(
                  text: "Ready to Login?",
                  color: textColor,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: heraldGreen,
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(2))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckSchedulePage(
                                        title: 'jkasd',
                                      )));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/google.png'),
                            const Text(
                              "  Continue With Google",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.04),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Divider(
                      color: elementColor1,
                    ),
                  ),
                ),
                TextSubHeading(
                  text: "Copyright © 2022 . All Rights Reserved To HCK",
                  color: elementColor1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
