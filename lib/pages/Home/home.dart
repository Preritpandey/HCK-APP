import 'package:flutter/material.dart';
import 'package:hck_app/pages/Home/home_screen.dart';
import 'package:hck_app/pages/Notice/pages/notice.dart';
import 'package:hck_app/pages/Profile/profile_page.dart';
import 'package:hck_app/pages/Routine/routine_page.dart';
import 'package:hck_app/pages/lost_and_found/pages/lost_and_found.dart';
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

  @override
  Widget build(BuildContext context) {
    final List pages = [
      HomeScreen(),
      const LostAndFound(),
      const EventPage(),
      const RoutinePage(),
      ProfilePage(),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height * 0,
        backgroundColor: backgroundWhite,
        elevation: 0,
      ),
      body: pages[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: iconColorBlack,
          selectedItemColor: heraldGreen,
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
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/search.png'),
                ),
                label: 'search'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/notes.png'),
                ),
                label: 'notes'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/calendar.png'),
                ),
                label: 'calendar'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/profile.png'),
                ),
                label: 'profile'),
          ]),
    );
  }
}
