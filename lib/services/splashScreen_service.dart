import 'dart:async';
import 'package:get/get.dart';
import 'package:hck_app/services/login_service.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class SplashScreenController extends GetxController {
  LoginController loginController = Get.put(LoginController());
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 1), () {
      if (loginController.isUserLoggedIn.value == false) {
        Get.offNamed('/loginScreen');
      } else {
        Get.offNamed('/HomePage');
      }
    });
  }

  // Future<void> check() async {
  //   Box settingsBox = Hive.box('settings');
  //   Box localDataBox = Hive.box('localData');

  //   final bool showHome = settingsBox.get('showHome') ?? false;
  //   final bool showGuest = settingsBox.get('guestView') ?? false;
  //   final showDashboard = localDataBox.get('accessToken');

  //   if (showDashboard != null) {
  //     Get.offNamed('/navpage');
  //   } else if (showGuest) {
  //     Get.offNamed('/guestview');
  //   } else if (showHome) {
  //     Get.offNamed('/login');
  //   } else {
  //     Get.offNamed('/boarding');
  //   }
  // }
}
