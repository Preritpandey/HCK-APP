import 'dart:convert';
import 'package:get/get.dart';
import 'package:hck_app/pages/OnboardingPages/LoginPage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordController extends GetxController {
  var isLoading = false.obs;

  Future<void> changePassword(String email, String newPassword) async {
    print('New password received: $newPassword');
    isLoading.value = true;
    final String url = 'http://localhost:8000/api/v4/student/change-password';

    // Get the access token from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final storedAccessToken = prefs.getString('accessToken');

    // Debugging: Check if the token is correctly retrieved
    print('Access Token: $storedAccessToken');

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $storedAccessToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'uid': email,
          'newPassword': newPassword,
        }),
      );

      // Debugging: Print the response details
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Success: password changed
        var data = jsonDecode(response.body);
        Get.snackbar(
            'Success', data['message'] ?? 'Password changed successfully');
        Get.to(() => LoginPage());
      } else if (response.statusCode == 400 || response.statusCode == 422) {
        // Bad request, the API expects something different
        var errorData = jsonDecode(response.body);
        print('Validation Error: $errorData');

        // Show the exact message from the API (e.g., "enter new password")
        Get.snackbar('Error', errorData['message'] ?? 'Validation failed');
      } else {
        // Other errors
        var errorData = jsonDecode(response.body);
        print('Error response: $errorData');
        Get.snackbar(
            'Error', errorData['error'] ?? 'Failed to change password');
      }
    } catch (e) {
      // Handle any other errors (network issues, etc.)
      print('Exception: $e');
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isLoading.value = false;
    }
  }
}
