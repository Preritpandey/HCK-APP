import 'package:flutter/material.dart';
import 'package:hck_app/pages/HomePage/home_screen.dart';
import 'package:hck_app/pages/LostAndFound/lost_found_page.dart';
import 'package:hck_app/pages/ProfilePage/profile_page.dart';
import 'package:hck_app/pages/RoutinePage/calander_page.dart';
import 'package:hck_app/pages/RoutinePage/routine_page.dart';
import 'package:hck_app/resources/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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

  final List _pages = [
    const HomeScreen(),
    const LostAndFoundPage(),
    const RoutinePage(),
    const CalanderPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
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
                label: 'home'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/notes.png'),
                  color: iconColorBlack,
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/calander.png'),
                  color: iconColorBlack,
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/profile.png'),
                  color: iconColorBlack,
                ),
                label: 'home'),
          ]),
    );
  }
}
