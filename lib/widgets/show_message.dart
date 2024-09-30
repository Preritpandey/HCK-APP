import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_normal.dart';

Future showMessage(String title, String message, void Function() onPressed1,
    void Function() onPressed2,
    {String buttonText1 = "Try Again",
    String buttonText2 = "Cancel",
    bool singleButton = false,
    bool isDismissible = true}) {
  return Get.defaultDialog(
    onWillPop: () => Future.value(isDismissible),
    barrierDismissible: isDismissible,
    title: title,
    titlePadding: EdgeInsets.all(MediaQuery.of(Get.context!).size.width * 0.05),
    titleStyle: const TextStyle(fontSize: fontSize16),
    middleText: message,
    middleTextStyle: const TextStyle(fontSize: fontSize14),
    radius: 10,
    actions: <Widget>[
      SizedBox(height: MediaQuery.of(Get.context!).size.height * 0.02),
      Divider(
        color: black3,
        height: 0,
        indent: MediaQuery.of(Get.context!).size.width * 0.05,
        endIndent: MediaQuery.of(Get.context!).size.width * 0.05,
      ),
      SizedBox(
        height: MediaQuery.of(Get.context!).size.height * 0.05,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: onPressed1,
                child: TextNormal(
                  text: buttonText1,
                  size: fontSize14,
                  color: heraldGreen,
                  fontWeight: FontWeight.bold,
                )),
            if (!singleButton)
              VerticalDivider(
                color: black3,
                width: MediaQuery.of(Get.context!).size.width * 0.05,
              ),
            if (!singleButton)
              TextButton(
                  onPressed: onPressed2,
                  child: TextNormal(
                    text: buttonText2,
                    size: fontSize14,
                    color: heraldGreen,
                    fontWeight: FontWeight.bold,
                  )),
          ],
        ),
      )
    ],
  );
}
