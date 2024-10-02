// ------------old---------
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:hck_app/pages/Home/home.dart';
import 'package:hck_app/pages/Auth/change_password_page.dart';
import 'package:hck_app/resources/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var accessToken = ''.obs;
  var refreshToken = ''.obs;
  var group = ''.obs;
  var email = ''.obs;
  var name = ''.obs;
  var isUserLoggedIn = false.obs;
  RxBool isConnectionActive = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
    checkUserConnection();
  }

  Future<void> checkLoginStatus() async {
    isLoading.value = true;
    final prefs = await SharedPreferences.getInstance();
    final storedAccessToken = prefs.getString('accessToken');
    final storedGroup = prefs.getString('group');
    final storedEmail = prefs.getString('email');
    final storedName = prefs.getString('name');
    if (storedAccessToken != null && await isTokenValid(storedAccessToken)) {
      accessToken.value = storedAccessToken;
      group.value = storedGroup ?? '';
      email.value = storedEmail ?? '';
      name.value = storedName ?? '';

      updateTokens(
        storedAccessToken,
        prefs.getString('refreshToken') ?? '',
        group.value,
        email.value,
        name.value,
      );
      isUserLoggedIn.value = true;
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
    if (isConnectionActive.value == true) {
      isLoading.value = true;
      final url = Uri.parse(
          refreshTokenUrl); // Use your actual refresh token API endpoint

      final headers = {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      };
      final body = jsonEncode({
        'refreshToken': refreshToken
      }); // Send the refresh token to refresh the access token

      try {
        final response = await http.post(url, headers: headers, body: body);
        if (response.statusCode == 200) {
          final responseBody = jsonDecode(response.body);

          final newAccessToken = responseBody['accessToken'];
          final newRefreshToken = responseBody[
              'refreshToken']; // Update with new refresh token if provided
          final newGroup = responseBody['group'];
          final newEmail = responseBody['email'];
          final newName = responseBody['name'];
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('accessToken', newAccessToken);
          await prefs.setString('refreshToken',
              newRefreshToken); // Store the updated refresh token
          await prefs.setString('group', newGroup);
          await prefs.setString('email', newEmail);
          await prefs.setString('name', newName);
          updateTokens(
              newAccessToken, newRefreshToken, newGroup, newEmail, newName);

          navigateToNextPage(newGroup, newEmail);
          isUserLoggedIn.value = true;
        } else {
          Get.snackbar('Error', 'Failed to refresh token');
        }
      } catch (e) {
        Get.snackbar('Error', 'An error occurred while refreshing token');
      }
    } else {
      Get.snackbar('Error', 'Check Your connection and login again');
    }

    isLoading.value = false;
  }

  Future<void> loginUser(String userEmail, String password) async {
    isLoading.value = true;
    final url = Uri.parse(loginUrl); // Use your actual login API endpoint

    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({'uid': userEmail, 'password': password});

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody['requirePasswordChange'] == true) {
          Get.to(() => const ChangePasswordPage());
        } else {
          final newAccessToken = responseBody['accessToken'];
          final newRefreshToken =
              responseBody['refreshToken']; // Extract the refresh token
          final newGroup = responseBody['group'];
          final email = responseBody['email'];
          final name = responseBody['name'];
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('accessToken', newAccessToken);
          await prefs.setString(
              'refreshToken', newRefreshToken); // Store the refresh token
          await prefs.setString('group', newGroup);
          await prefs.setString('email', email);
          await prefs.setString('name', name);

          updateTokens(newAccessToken, newRefreshToken, newGroup, email, name);
          navigateToNextPage(newGroup, email);
          isUserLoggedIn.value = true;
        }
      } else {
        Get.snackbar('Error', 'Invalid email or password. Please try again.');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred during login.');
    }
    isLoading.value = false;

    // }
  }

  void updateTokens(String newAccessToken, String newRefreshToken,
      String newGroup, String newEmail, String newName) {
    accessToken.value = newAccessToken;
    refreshToken.value = newRefreshToken;
    group.value = newGroup;
    email.value = newEmail;
    name.value = newName;
  }

  void navigateToNextPage(String group, String email) {
    Get.to(() => const HomePage());
  }

  Future<bool> isTokenValid(String storedAccessToken) async {
    try {
      return !JwtDecoder.isExpired(storedAccessToken);
    } catch (e) {
      return false;
    }
  }

  Future checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnectionActive.value = true;
      }
    } on SocketException catch (_) {
      isConnectionActive.value = false;
    }
  }
}
