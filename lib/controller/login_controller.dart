import 'dart:convert';
import 'package:get/get.dart';
import 'package:hck_app/pages/HomePage/home.dart';
import 'package:hck_app/pages/OnboardingPages/changePasswordPage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var accessToken = ''.obs; // RxString
  var refreshToken = ''.obs; // RxString
  var group = ''.obs; // RxString
  var email = ''.obs; // RxString

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    isLoading.value = true;
    final prefs = await SharedPreferences.getInstance();
    final storedAccessToken = prefs.getString('accessToken');
    final storedGroup = prefs.getString('group');
    final storedEmail = prefs.getString('email');

    if (storedAccessToken != null && await isTokenValid(storedAccessToken)) {
      accessToken.value = storedAccessToken; // Update reactive value
      group.value = storedGroup ?? '';
      email.value = storedEmail ?? '';
      updateTokens(storedAccessToken, prefs.getString('refreshToken') ?? '',
          group.value, email.value);

      navigateToNextPage(group.value, email.value);
    } else {
      final storedRefreshToken = prefs.getString('refreshToken');
      if (storedRefreshToken != null) {
        await refreshAuthToken(storedRefreshToken);
      }
    }
    isLoading.value = false;
  }

  Future<void> refreshAuthToken(String refreshToken) async {
    isLoading.value = true;
    final url = Uri.parse('http://localhost:9999/api/v4/student/refresh-token');
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({'refreshToken': refreshToken});

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final newAccessToken = responseBody['accessToken'];
        final newRefreshToken = responseBody['refreshToken'];
        final newGroup = responseBody['group'];
        final newEmail = responseBody['email'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', newAccessToken);
        await prefs.setString('refreshToken', newRefreshToken);
        await prefs.setString('group', newGroup);
        await prefs.setString('email', newEmail);

        updateTokens(newAccessToken, newRefreshToken, newGroup, newEmail);

        navigateToNextPage(newGroup, newEmail);
      } else {
        Get.snackbar('Error', 'Failed to refresh token');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while refreshing token');
    }
    isLoading.value = false;
  }

  Future<void> loginUser(String userEmail, String password) async {
    isLoading.value = true;
    final url = Uri.parse('http://localhost:8000/api/v4/student/Login');
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({'uid': userEmail, 'password': password});

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final newAccessToken = responseBody['accessToken'];
        final newRefreshToken = responseBody['refreshToken'];
        final newGroup = responseBody['group'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', newAccessToken);
        await prefs.setString('refreshToken', newRefreshToken);
        await prefs.setString('group', newGroup);

        updateTokens(newAccessToken, newRefreshToken, newGroup, userEmail);

        if (password == "heraldcollege") {
          Get.to(ChangePasswordPage());
        } else {
          navigateToNextPage(newGroup, userEmail);
        }
      } else {
        Get.snackbar('Error', 'Invalid email or password. Please try again.');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred during login.');
    }
    isLoading.value = false;
  }

  void updateTokens(String newAccessToken, String newRefreshToken,
      String newGroup, String newEmail) {
    accessToken.value = newAccessToken;
    refreshToken.value = newRefreshToken;
    group.value = newGroup;
    email.value = newEmail;
  }

  void navigateToNextPage(String group, String email) {
    Get.to(HomePage(group: group, email: email));
  }

  Future<bool> isTokenValid(String storedAccessToken) async {
    // Implement token validation logic and return true if valid and false if false.
    return true; // Placeholder
  }
}
