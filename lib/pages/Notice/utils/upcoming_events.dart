import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/pages/Notice/pages/event_details.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_normal.dart';

import '../../../data/events_model.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.date,
      required this.events});
  final String title;
  final String subTitle;
  final String date;
  final Events events;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? black1
              : const Color(0xFF000000).withOpacity(0.04),
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextNormal(
                  text: title, size: fontSize12, fontWeight: FontWeight.w600),
              TextNormal(
                text: subTitle,
                size: fontSize10,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              TextNormal(
                  text: date, size: fontSize10, fontWeight: FontWeight.w500),
            ],
          ),
          InkWell(
            onTap: () => Get.to(const EventsDetails(), arguments: events),
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: heraldGreen,
                    borderRadius: BorderRadius.circular(24)),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 15,
                )),
          )
        ],
      ),
    );
  }
}
