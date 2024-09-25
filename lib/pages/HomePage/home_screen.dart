import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hck_app/controller/login_controller.dart';
import 'package:hck_app/controller/routine_controller.dart';
import 'package:hck_app/pages/HomePage/upcomming_classes.dart';
import 'package:hck_app/pages/Notice/pages/event_body.dart';
import 'package:hck_app/pages/NotificationPage/notification_page.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_heading.dart';
import 'package:hck_app/resources/text_normal.dart';
import 'package:hck_app/resources/text_subheading.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final RoutineController routineController = Get.put(RoutineController());
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          SystemNavigator.pop();
        }
      },
      //  showMessage(
      //     '⚠️ Confirm Exit',
      //     'Are you sure you want to quit?',
      //     () => SystemNavigator.pop(),
      //     () => Get.back(),
      //     buttonText1: 'Yes',
      //     buttonText2: 'No',

      //     ),

      child: Container(
        color: backgroundWhite,
        child: Stack(
          children: [
            // Notifications and Menu Icons
            Positioned(
              top: MediaQuery.of(context).size.height * 0.01,
              right: MediaQuery.of(context).size.width * 0.01,
              child: Row(
                children: [
                  IconButton(
                    icon: Image.asset('assets/icons/notification.png'),
                    color: iconColorBlack,
                    iconSize: 35,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationPage(),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  IconButton(
                    icon: const Icon(Icons.menu_rounded),
                    color: iconColorBlack,
                    iconSize: 33,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EventBody(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Greeting and User Group
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: MediaQuery.of(context).size.height / 10,
              left: MediaQuery.of(context).size.width * 0.04,
              child: Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.02,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextNormal(
                          text: "Hello Student!",
                          fontWeight: FontWeight.bold,
                          size: 18,
                          color: darkBluishGreen,
                        ),
                        // SizedBox(height: 5),
                        TextNormal(text: "Here's What's Cooking For You"),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.05),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Column(
                          children: [
                            Image.asset('assets/images/student.png'),
                            Obx(() => TextSubHeading(
                                text: loginController.group.value)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Upcoming Class Card
            Positioned(
              top: MediaQuery.of(context).size.height / 5,
              child: Obx(() {
                if (routineController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (routineController.upcomingClass.value != null) {
                  var upcomingClass = routineController.upcomingClass.value!;

                  // Format startTime to HH:mm
                  String formattedStartTime = DateFormat('HH:mm').format(
                      DateFormat('HH:mm:ss').parse(upcomingClass.startTime));

                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 4.5,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Card(
                        color: heraldGreen,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.02,
                                      left: MediaQuery.of(context).size.width *
                                          0.02),
                                  child: TextHeading(
                                    text: "Upcoming Class",
                                    color: darkBluishGreen,
                                    size: 16,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.02,
                                      right: MediaQuery.of(context).size.width *
                                          0.02),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.watch_later_outlined,
                                        size: 22,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 3),
                                      TextHeading(
                                        text:
                                            formattedStartTime, // Use formatted time
                                        size: 16,
                                        color: white,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.03,
                                  right:
                                      MediaQuery.of(context).size.width * 0.03),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.02),
                                    child: TextNormal(
                                      text: upcomingClass.moduleName,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  ),
                                  const ImageIcon(
                                    size: 40,
                                    AssetImage('assets/icons/Vector.png'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Align(
                    alignment: Alignment.center,
                    child: TextNormal(
                      text: 'No upcoming classes',
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }
              }),
            ),

            // Classes Today Section Heading
            Positioned(
              top: MediaQuery.of(context).size.height / 2.3,
              child: const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextHeading(
                      text: "Classes Today",
                      color: darkBluishGreen,
                    ),
                    SizedBox(height: 3),
                    TextNormal(
                      text: "Your Class Insights, Please be on Schedule!",
                    ),
                  ],
                ),
              ),
            ),

            // List of Upcoming Classes
            Positioned(
                top: MediaQuery.of(context).size.height / 1.95,
                left: MediaQuery.of(context).size.width * 0.04,
                child: Obx(() {
                  return routineController.restClasses.isNotEmpty
                      ? UpcomingClasses(classes: routineController.restClasses)
                      : const TextNormal(
                          text: "No more classes today",
                          fontWeight: FontWeight.w500,
                        );
                })),
          ],
        ),
      ),
    );
  }
}
