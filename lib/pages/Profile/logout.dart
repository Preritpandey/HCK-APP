import 'package:flutter/material.dart';
import 'package:hck_app/pages/Auth/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> logout(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();

  // Remove access and refresh tokens from SharedPreferences
  await prefs.remove('accessToken');
  await prefs.remove('refreshToken');

  // Navigate the user back to the login page and clear navigation history
  Navigator.pushAndRemoveUntil(
    // ignore: use_build_context_synchronously
    context,
    MaterialPageRoute(builder: (context) => const LoginPage()),
    (Route<dynamic> route) => false,
  );
}
