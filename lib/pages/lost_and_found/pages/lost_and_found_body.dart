import 'package:flutter/material.dart';
import 'package:hck_app/pages/lost_and_found/widgets/pending_item.dart';
import 'package:hck_app/widgets/custom_tabBar.dart';
import '../widgets/widgets.dart';

class LostAndFoundBody extends StatelessWidget {
  const LostAndFoundBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> tabString = ['Request History', 'Pending Items'];

    return DefaultTabController(
        length: tabString.length,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTabBar(tabString: tabString),
            const Expanded(
              child: TabBarView(
                children: [
                  RequestHistory(),
                  PendingItems(),
                ],
              ),
            ),
          ],
        ));
  }
}
