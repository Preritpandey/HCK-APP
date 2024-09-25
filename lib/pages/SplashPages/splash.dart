import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/controller/splashScreen_controller.dart';
import 'package:hck_app/pages/SplashPages/widgets/body.dart';
import 'package:hck_app/resources/constant.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      backgroundColor:
          Theme.of(context).brightness == Brightness.light ? heraldGreen : dark,
      body: const SplashScreenBody(),
    );
  }
}