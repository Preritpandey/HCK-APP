import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:hck_app/pages/Home/home.dart';
import 'package:hck_app/resources/constant.dart';

class CheckSchedulePage extends StatefulWidget {
  const CheckSchedulePage({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _CheckSchedulePageState createState() => _CheckSchedulePageState();
}

class _CheckSchedulePageState extends State<CheckSchedulePage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        allowScroll: true,
        pages: pages,
        showBullets: true,
        inactiveBulletColor: Colors.green,
        buttonColor: heraldGreen,
        skipCallback: () {
          // Show a Snackbar when "Skip" is clicked
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content:  Text("Skip clicked"),
          ));
        },
        finishCallback: () {
          // Navigate to a new screen when onboarding is finished
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const HomeScreen(), // Replace HomeScreen with your desired screen
            ),
          );
        },
      ),
    );
  }

  // List of onboarding Screen
  final pages = [
    PageModel(
        color: white,
        imageAssetPath: 'assets/images/onboard_ill1.png',
        title: 'Check Schedule',
        body:
            'You can check your college shedule directly through this app.No need to check your emial everytime you attend your calss.',
        titleColor: textColor,
        bodyColor: textColor,
        doAnimateImage: true),
    PageModel(
        color: white,
        imageAssetPath: 'assets/images/onboard_ill2.png',
        title: 'Classes Alert',
        body:
            "Get quick notifications about your upcomming classes.This app help's to keep your attendence at 100%.",
        titleColor: textColor,
        bodyColor: textColor,
        doAnimateImage: true),
    PageModel(
        color: white,
        imageAssetPath: 'assets/images/onboard_ill3.png',
        title: 'Give Rating',
        body:
            "Give feedback and ratings to your tutors and college management at anytime.Don't worry you are anonymous",
        titleColor: textColor,
        bodyColor: textColor,
        doAnimateImage: true),
  ];
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePage(),
    );
  }
}
