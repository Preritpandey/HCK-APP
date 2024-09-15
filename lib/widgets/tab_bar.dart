import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/pages/RoutinePage/calander_page.dart';
import 'package:hck_app/widgets/routine_card.dart';
import 'package:hck_app/widgets/tab_item.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_heading.dart';

class NavTabBar extends StatelessWidget {
  const NavTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const TextHeading(
            text: 'Routine',
            size: 16,
          ),
          actions: [
            IconButton(
                onPressed: () => Get.to(CalanderPage()),
                icon: Image.asset(
                  'assets/icons/calander.png',
                  height: 28,
                  width: 28,
                ))
          ],
          bottom: const TabBar(
            physics: AlwaysScrollableScrollPhysics(),
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            padding: EdgeInsets.only(bottom: 10),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: BorderSide.strokeAlignCenter,
            indicatorPadding: EdgeInsets.zero,
            indicator: BoxDecoration(
              color: heraldGreen,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black54,
            tabs: [
              TabItem(title: 'Yesterday'),
              TabItem(title: 'Today'),
              TabItem(title: 'Tomorrow'),
              TabItem(title: '26 sep'),
              TabItem(title: '27 sep'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            EventCard(),
            EventCard(),
            EventCard(),
            EventCard(),
            EventCard(),
          ],
        ),
      ),
    );
  }
}
