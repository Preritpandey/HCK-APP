import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/pages/Notice/pages/event_body.dart';
import 'package:hck_app/pages/Notice/pages/internship_body.dart';
import 'package:hck_app/widgets/custom_tabBar.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_normal.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> tabStrings = ["Events", "Internship"];
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed('/HomePage');
        return false; // Prevent default back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: const TextNormal(
            text: "Notice Board",
            fontWeight: FontWeight.w700,
            size: fontSize18,
          ),
          elevation: 0,
        ),
        body: SafeArea(
          child: DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTabBar(tabString: tabStrings),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  const Expanded(
                      child: TabBarView(
                    children: [EventBody(), InternshipBody()],
                  )),
                ],
              )),
        ),
      ),
    );
  }
}
