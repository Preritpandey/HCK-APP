import 'package:flutter/material.dart';
import 'package:hck_app/pages/widgets/routine_card.dart';
import 'package:hck_app/pages/widgets/tab_item.dart';
import 'package:hck_app/resources/constant.dart';

class NavTabBar extends StatelessWidget {
  const NavTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Routine',
            style: TextStyle(fontSize: 16),
          ),
          bottom: const TabBar(
            physics: ClampingScrollPhysics(),
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            padding: EdgeInsets.only(bottom: 10),
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              color: heraldGreen,
              borderRadius: BorderRadius.all(Radius.circular(10)),
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
