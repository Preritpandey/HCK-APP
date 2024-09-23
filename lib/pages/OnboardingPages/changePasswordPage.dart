import 'package:flutter/material.dart';
import 'package:hck_app/controller/changePassword_controller.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_subheading.dart';
import 'package:get/get.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final ChangePasswordController changePasswordController =
      Get.put(ChangePasswordController());
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  bool _isObscure = true;
  bool _isObsecurePasswordConfirm = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: Image.asset('assets/images/hck_ing_group_logo.png'),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Divider(
                    thickness: 1, color: Color.fromARGB(255, 214, 213, 213)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.15),
                  child: Text(
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
                  controller: userEmailController,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    suffixIcon:
                        const Icon(Icons.person_rounded, color: darkGrey),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: grey),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.15),
                  child: Text(
                    'Enter New Password',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: newPasswordController,
                  obscureText: _isObscure,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'New Password',
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
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: grey),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.15),
                  child: Text(
                    'Confirm Password',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: confirmPasswordController,
                  obscureText: _isObsecurePasswordConfirm,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObsecurePasswordConfirm
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: darkGrey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObsecurePasswordConfirm =
                              !_isObsecurePasswordConfirm; // Toggles visibility
                        });
                      },
                    ),
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: grey),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: heraldGreen,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  onPressed: () {
                    if (newPasswordController.text ==
                        confirmPasswordController.text) {
                      print(newPasswordController);
                      print(confirmPasswordController);
                      changePasswordController.changePassword(
                          userEmailController.text, newPasswordController.text);
                    } else {
                      Get.snackbar("Error", "Passwords don't match");
                    }
                  },
                  child: const Text(
                    "Change",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.13),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Divider(
                    thickness: 1, color: Color.fromARGB(255, 214, 213, 213)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.09),
              const TextSubHeading(
                text: 'Copyright © 2022 . All Rights Reserved To HCK ',
                color: Colors.grey,
                size: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
