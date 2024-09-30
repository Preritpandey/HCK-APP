import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/services/login_service.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_subheading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = Get.put(LoginController());
  // Initialize the controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController =
      TextEditingController(); // Added controller for password
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        if (loginController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: Image.asset('assets/images/hck_ing_group_logo.png'),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.13),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const Divider(
                    thickness: 1, color: Color.fromARGB(255, 214, 213, 213)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.15),
                  child: const Text(
                    'Email',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: emailController,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    suffixIcon:
                        const Icon(Icons.person_rounded, color: darkGrey),
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: grey),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.15),
                  child:const Text(
                    'Password',
                    style:  TextStyle(fontSize: 15),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: passwordController, // Added password controller
                  obscureText: _isObscure,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        color: darkGrey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure; // Toggles visibility
                        });
                      },
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: grey),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
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
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  onPressed: () {
                    loginController.loginUser(emailController.text,
                        passwordController.text); // Pass the password as well
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.13),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child:const Divider(
                    thickness: 1, color: Color.fromARGB(255, 214, 213, 213)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const TextSubHeading(
                text: 'Copyright © 2022 . All Rights Reserved To HCK ',
                color: Colors.grey,
                size: 12,
              ),
            ],
          ),
        );
      }),
    );
  }
}
