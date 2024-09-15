import 'package:flutter/material.dart';
import 'package:hck_app/pages/HomePage/home_screen.dart';
import 'package:hck_app/pages/Notice/pages/notice.dart';
import 'package:hck_app/pages/ProfilePage/profile_page.dart';
import 'package:hck_app/pages/RoutinePage/routine_page.dart';
import 'package:hck_app/pages/lost_and_found/pages/lost_and_found.dart';
import 'package:hck_app/resources/constant.dart';

class HomePage extends StatefulWidget {
  final group;
  const HomePage({super.key, required this.group});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTab = 0;

  void changeTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List _pages = [
      HomeScreen(group: widget.group, ), // Pass the group without const
      const LostAndFound(),
      const EventPage(),
      const RoutinePage(),
      const ProfilePage(),
    ];

    return Scaffold(
      body: _pages[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: null,
          selectedItemColor: null,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedTab,
          onTap: (value) => changeTab(value),
          enableFeedback: false,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/home.png'),
                  color: iconColorBlack,
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/search.png'),
                  color: iconColorBlack,
                ),
                label: 'search'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/notes.png'),
                  color: iconColorBlack,
                ),
                label: 'notes'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/calander.png'),
                  color: iconColorBlack,
                ),
                label: 'calendar'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/profile.png'),
                  color: iconColorBlack,
                ),
                label: 'profile'),
          ]),
    );
  }
}
