import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/resources/constant.dart';

ButtonStyle heraldButtonStyle(
    { Color color =  heraldGreen,
    double radius = 15,
    double fixedSizeWidth = 0.9,
    double fixedSizeHeight = 0.06}) {
  return ElevatedButton.styleFrom(
    fixedSize: Size(MediaQuery.of(Get.context!).size.width * fixedSizeWidth,
        MediaQuery.of(Get.context!).size.height * fixedSizeHeight),
    backgroundColor: color,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
  );
}
