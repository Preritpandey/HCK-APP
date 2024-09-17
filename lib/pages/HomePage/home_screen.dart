import 'package:flutter/material.dart';
import 'package:hck_app/controller/routine_controller.dart'; // Import your API fetcher
import 'package:hck_app/models/routine_model.dart'; // Import your data model
import 'package:hck_app/pages/HomePage/upcomming_classes.dart';
import 'package:hck_app/pages/Notice/pages/event_body.dart';
import 'package:hck_app/pages/NotificationPage/notification_page.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_body.dart';
import 'package:hck_app/resources/text_heading.dart';
import 'package:hck_app/resources/text_normal.dart';
import 'package:hck_app/resources/text_subheading.dart';

class HomeScreen extends StatefulWidget {
  final String group; // Specify the group type
  HomeScreen({super.key, required this.group});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<OngoingClassGroup>> futureClasses;
  OngoingClassGroup? upcomingClass; // Store the first class here
  List<OngoingClassGroup> restClasses = []; // Store the rest of the classes

  @override
  void initState() {
    super.initState();
    fetchClasses();
  }

  void fetchClasses() async {
    try {
      List<OngoingClassGroup> classes =
          await fetchOngoingClasses(); // Fetch from your API
      setState(() {
        if (classes.isNotEmpty) {
          upcomingClass =
              classes.first; // Assign the first class as the upcoming class
          restClasses =
              classes.skip(1).toList(); // Skip the first and assign the rest
        } else {
          // No classes found
          upcomingClass = null;
          restClasses = [];
        }
      });
    } catch (error) {
      // Handle errors here
      print('Error fetching classes: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 5,
            right: 10,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_none_outlined),
                  color: iconColorBlack,
                  iconSize: 33,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: Icon(Icons.menu_rounded),
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
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.height / 10,
            left: 10,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextHeading(
                      text: "Hello Student!",
                      color: darkBluishGreen,
                    ),
                    SizedBox(height: 5),
                    TextNormal(text: "Here's Whats Cooking For You"),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    width: 50,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Column(
                      children: [
                        Image.asset('assets/images/student.png'),
                        const SizedBox(height: 3),
                        TextSubHeading(text: widget.group),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // Upcoming Class Card
// Upcoming Class Card
          Positioned(
            top: MediaQuery.of(context).size.height / 5,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 4.5,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: upcomingClass != null
                    ? Card(
                        color: heraldGreen,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 20, left: 25),
                                      child: TextHeading(
                                        text: "Upcoming Class",
                                        color: darkBluishGreen,
                                        size: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, right: 30),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.watch_later_outlined,
                                            size: 22,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(width: 3),
                                          TextHeading(
                                            text: "${upcomingClass!.startTime}",
                                            size: 16,
                                            color: white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 15, right: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 25.0),
                                        child: TextBody(
                                          text: "${upcomingClass!.moduleName}",
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                      RotationTransition(
                                        turns: const AlwaysStoppedAnimation(
                                            275 / 360),
                                        child: const ImageIcon(
                                          size: 65,
                                          AssetImage('assets/icons/send.png'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : const Center(
                        child: Text(
                          "No classes today",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ),
              ),
            ),
          ),
          // Classes Today Section
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
          // List of upcoming classes
          Positioned(
            top: MediaQuery.of(context).size.height / 1.9,
            left: 25,
            child: restClasses.isNotEmpty
                ? UpcomingClasses(classes: restClasses)
                : const Text("No more classes today"),
          ),
        ],
      ),
    );
  }
}
