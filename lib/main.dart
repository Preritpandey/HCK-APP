import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:hck_app/pages/HomePage/home.dart';
import 'package:hck_app/pages/OnboardingPages/LoginPage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(
      'jobBox'); // for sroring internship data fetched form Recruitment portal API.
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: GoogleAuthPage(),
      home: LoginPage(),
      getPages: [
        GetPage(
            name: '/HomePage',
            page: () => HomePage(
                  group: '',     // fields are empty and it will not effect the app functionallity.will update this later.
                  email: '',
                )), //    
      ],
    );
  }
}
