import 'package:flutter/material.dart';
import 'package:hck_app/pages/HomePage/home_screen.dart';
import 'package:hck_app/pages/Notice/pages/notice.dart';
import 'package:hck_app/pages/ProfilePage/profile_page.dart';
import 'package:hck_app/pages/RoutinePage/routine_page.dart';
import 'package:hck_app/pages/lost_and_found/pages/lost_and_found.dart';
import 'package:hck_app/resources/constant.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

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
      HomeScreen(),
      const LostAndFound(),
      const EventPage(),
      RoutinePage(),
      ProfilePage(),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height * 0,
      
        backgroundColor: backgroundWhite,
        elevation: 0,
      ),
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
                  AssetImage('assets/icons/calendar.png'),
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
