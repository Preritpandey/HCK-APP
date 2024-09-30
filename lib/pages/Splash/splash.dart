import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/services/splashScreen_service.dart';
import 'package:hck_app/pages/Splash/widgets/body.dart';
import 'package:hck_app/resources/constant.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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