import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/services/schedule_service.dart';
import 'package:hck_app/pages/Routine/calander_page.dart';
import 'package:hck_app/resources/text_heading.dart';
import 'package:hck_app/widgets/custom_tabBar.dart';
import 'package:hck_app/widgets/routine_card.dart';

class NavTabBar extends StatelessWidget {
  final ClassController classController = Get.put(ClassController());

  NavTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> tabStrings = [
      "Yesterday",
      "Today",
      "Tomorrow",
      ...classController.getDaysAfterTomorrow()
    ];

    return DefaultTabController(
      initialIndex: 1,
      length: tabStrings
          .length, // Ensure the TabController length matches the number of tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const TextHeading(text: 'Routine'),
          actions: [
            IconButton(
              onPressed: () => Get.to(() => const CalanderPage()),
              icon: const ImageIcon(AssetImage('assets/icons/calendar.png')),
            )
          ],
        ),
        body: Column(
          children: [
            CustomTabBar(tabString: tabStrings),
            Expanded(
              child: Obx(() {
                if (classController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return TabBarView(
                    children: [
                      EventCard(day: classController.getYesterday()),
                      EventCard(day: classController.getToday()),
                      EventCard(day: classController.getTomorrow()),
                      ...classController
                          .getDaysAfterTomorrow()
                          .map((day) => EventCard(day: day))
                          .toList(),
                    ],
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
