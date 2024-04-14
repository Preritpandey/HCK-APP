import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_normal.dart';

SnackBar customSnackBar(context, message) => SnackBar(
    behavior: SnackBarBehavior.floating,
    elevation: 2,
    content: SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: SingleChildScrollView(
        child: Column(children: [
          TextNormal(
            text: message,
            size: fontSize16,
            color: heraldGreen,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w700,
          ),
          Image.asset(
            'assets/images/feedback_success.json',
            height: MediaQuery.of(context).size.width * 0.3,
          ),
        ]),
      ),
    ),
    shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: heraldGreen,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20.0)),
    duration: const Duration(seconds: 2),
    backgroundColor: white);

void showSnackBar(String message) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    customSnackBar(Get.context, message),
  );
}
