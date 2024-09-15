import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hck_app/pages/HomePage/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_heading.dart';
import 'package:hck_app/resources/text_subheading.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController =
        TextEditingController(); // Initialize the controller here
    _checkLoginStatus();
  }

  @override
  void dispose() {
    _emailController
        .dispose(); // Dispose of the controller to avoid memory leaks
    super.dispose();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final group = prefs.getString('group');

    if (accessToken != null && await _isTokenValid(accessToken)) {
      navigateToNextPage(group!);
    } else {
      final refreshToken = prefs.getString('refreshToken');
      if (refreshToken != null) {
        _refreshToken(refreshToken);
      }
    }
  }

  Future<bool> _isTokenValid(String token) async {
    // add code to check if the token is valid by checking expiration
    // or trying a request to your backend with it and if doesnot work use reftesh token.
    return true;
  }

  Future<void> _refreshToken(String refreshToken) async {
    final url = Uri.parse('http://localhost:9999/api/v4/student/refresh-token');
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      'refreshToken': refreshToken,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final accessToken = responseBody['accessToken'];
        final newRefreshToken = responseBody['refreshToken'];
        final group = responseBody['group'];

        final prefs = await SharedPreferences.getInstance();
        prefs.setString('accessToken', accessToken);
        prefs.setString('refreshToken', newRefreshToken);
        prefs.setString('group', group);

        navigateToNextPage(group);
      } else {
        setState(() {});
      }
    } catch (e) {
      setState(() {});
    }
  }

  Future<void> loginUser() async {
    final email = _emailController.text;

    // Replace with your localhost URL
    final url = Uri.parse('http://localhost:9999/api/v4/student/Login');
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    // Body of the request
    final body = jsonEncode({
      'uid': email,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final accessToken = responseBody['accessToken'];
        final refreshToken = responseBody['refreshToken'];
        final group = responseBody['group'];

        // Save tokens and group in SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('accessToken', accessToken);
        prefs.setString('refreshToken', refreshToken);
        prefs.setString('group', group);

        setState(() {});

        // Now pass the group to the next page
        navigateToNextPage(group);
      } else {
        setState(() {});
        _showErrorDialog('Invalid email. Please try again.');
      }
    } catch (e) {
      setState(() {});
    }
  }

  void navigateToNextPage(String group) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => HomePage(group: group)));
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              Center(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                    child: Image.asset('assets/images/hck_ing_group_logo.png')),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.13),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Divider(
                  thickness: 3,
                  color: grey,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              TextHeading(
                text: 'Enter your college mail to continue',
                size: 15,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  scrollPadding: EdgeInsets.all(0),
                  controller: _emailController,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.email),
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(color: grey),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: heraldGreen,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(2))),
                    onPressed: () {
                      loginUser();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.13),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Divider(
                  thickness: 3,
                  color: grey,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const TextSubHeading(
                text: 'Copyright © 2022 . All Rights Reserved To HCK ',
                color: Colors.grey,
                size: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
