import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/pages/Routine/calander_page.dart';
import 'package:hck_app/resources/constant.dart';

import '../../../../resources/text_normal.dart';

class NoEvents extends StatelessWidget {
  const NoEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Image.asset("assets/images/not_events.png"),
        const TextNormal(
            text: "Oops!",
            size: fontSize16,
            fontWeight: FontWeight.w600,
            color: Colors.grey),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.003,
        ),
        TextNormal(
            text: "No events happening today.See",
            size: fontSize12,
            fontWeight: FontWeight.w500,
            color: Colors.grey[400]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextNormal(
                text: "upcomming events or ",
                size: fontSize12,
                fontWeight: FontWeight.w500,
                color: Colors.grey[400]),
            InkWell(
              onTap: () => Get.to(const CalanderPage()),
              child: const TextNormal(
                  text: "view calender",
                  size: fontSize12,
                  fontWeight: FontWeight.w500,
                  color: heraldGreen),
            )
          ],
        )
      ],
    ));
  }
}
