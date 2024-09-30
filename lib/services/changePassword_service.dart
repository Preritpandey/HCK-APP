import 'dart:convert';
import 'package:get/get.dart';
import 'package:hck_app/pages/Auth/login_page.dart';
import 'package:hck_app/resources/api_constants.dart';
import 'package:http/http.dart' as http;

class ChangePasswordController extends GetxController {
  var isLoading = false.obs;

  Future<void> changePassword(String email, String newPassword) async {
    
    isLoading.value = true;
    const String url = changePasswordUrl;

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'uid': email,
          'newPassword': newPassword,
        }),
      );
    
      if (response.statusCode == 200) {
        // Success: password changed
        var data = jsonDecode(response.body);
        Get.snackbar(
            'Success', data['message'] ?? 'Password changed successfully!');
        Get.to(() => const LoginPage());
      } else if (response.statusCode == 400 || response.statusCode == 422) {
        // Bad request, the API expects something different
        var errorData = jsonDecode(response.body);

        // Show the exact message from the API (e.g., "enter new password")
        Get.snackbar('Error', errorData['message'] ?? 'Validation failed');
      } else {
        // Other errors
        var errorData = jsonDecode(response.body);
        Get.snackbar(
            'Error', errorData['error'] ?? 'Failed to change password');
      }
    } catch (e) {
      // Handle any other errors (network issues, etc.)
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isLoading.value = false;
    }
  }
}
