import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:hck_app/models/routine_model.dart';
import 'package:hck_app/pages/HomePage/home.dart';
import 'package:hck_app/pages/HomePage/home_screen.dart';
import 'package:hck_app/pages/HomePage/newHomeScreen.dart';
import 'package:hck_app/pages/OnboardingPages/LoginPage.dart';
import 'package:hck_app/pages/SplashPages/splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initHive();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

Future<void> initHive() async {
  if (!kIsWeb) {
    // Only execute this on non-web platforms
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  } else {
    // Initialize Hive for web
    Hive.init(''); // Provide a placeholder path
  }

  Hive.registerAdapter(OngoingClassGroupAdapter());

  // Open all necessary boxes
  await Hive.openBox<OngoingClassGroup>('routineBox');
  await Hive.openBox('jobBox'); // Box for storing internship data
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      getPages: [
        GetPage(name: '/HomePage', page: () => HomePage()),
        GetPage(name: '/homeScreen', page: () => HomeScreen()),
        GetPage(name: '/loginScreen', page: () => LoginPage()),
      ],
    );
  }
}
