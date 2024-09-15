import 'package:flutter/material.dart';
import 'package:hck_app/widgets/tab_bar.dart';

class RoutinePage extends StatelessWidget {
  const RoutinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Column(
          children: [
            Expanded(child: NavTabBar()),
          ],
        ),
      ),
    );
  }
}
