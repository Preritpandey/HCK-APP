import 'package:flutter/material.dart';
import 'package:hck_app/services/login_service.dart';
import 'package:hck_app/pages/CoursesPage/courses_page.dart';
import 'package:get/get.dart';
import 'package:hck_app/pages/Profile/logout.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_heading.dart';
import 'package:hck_app/resources/text_subheading.dart';
import 'package:hck_app/services/reminder_service.dart';
import 'package:hck_app/widgets/button_style.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final ReminderController reminderController = Get.put(ReminderController());

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed('/HomePage');
        return false; // Prevent default back navigation
      },
      child: Scaffold(
        backgroundColor: backgroundWhite,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.025,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextHeading(text: 'Profile'),
                      GestureDetector(
                        child: const Row(
                          children: [
                            TextSubHeading(
                                text: 'Logout', size: 16, color: Colors.red),
                            SizedBox(width: 3),
                            Icon(
                              Icons.logout_rounded,
                              color: Colors.red,
                              size: 19,
                            )
                          ],
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return Dialog(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Are you sure?',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 8),
                                      const Text('You will be logged out',
                                          style: TextStyle(fontSize: 16)),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              logout(context);
                                            },
                                            child: const Text('Logout'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 7,
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            heraldGreen,
                            green,
                          ]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 14,
                          bottom: 10,
                          left: 10,
                          right: 10),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                heraldGreen,
                                green,
                              ],
                              transform: GradientRotation(2),
                              tileMode: TileMode.repeated),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(
                                  () => TextSubHeading(
                                    text: loginController.name.value,
                                    color: white,
                                    size: 16,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                const TextSubHeading(
                                  text: '|',
                                  size: 18,
                                  color: white,
                                ),
                                const SizedBox(width: 20),
                                Obx(() => TextSubHeading(
                                    text: loginController.group.value,
                                    color: white,
                                    size: 16)),
                              ],
                            ),
                            Obx(() => TextSubHeading(
                                text: loginController.email.value,
                                color: white,
                                size: 15)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height / 10,
                  left: MediaQuery.of(context).size.width / 2.65,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height / 8.5,
                    width: MediaQuery.of(context).size.height / 8.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: backgroundWhite),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CircleAvatar(
                        child: Image.asset('assets/images/student.png'),
                      ),
                    ),
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height / 2.6,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 23),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextHeading(text: 'Others'),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          children: [
                            const CircleAvatar(
                                backgroundColor: heraldGreen,
                                child: Icon(
                                  Icons.menu_book_outlined,
                                  size: 20,
                                  color: white,
                                )),
                            const SizedBox(width: 10),
                            GestureDetector(
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextSubHeading(
                                    text: 'Courses',
                                    size: 15,
                                  ),
                                  TextSubHeading(
                                      text:
                                          'See all the courses at Herald College Kathmandu'),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CoursesPage()));
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        //     ElevatedButton(
                        //       onPressed: () {

                        //         NotificationService.showInstantNotification(
                        // "Instant Notification", "This shows an instant notifications");
                        //       },
                        //       style: heraldButtonStyle(),
                        //       child: const Text('Set Reminder'),
                        //     ),
                      ],
                    ),
                  ))
            ],
          ),
          
        ),
      ),
    );
  }
}
