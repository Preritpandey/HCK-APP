import 'package:flutter/material.dart';
import 'package:hck_app/pages/HomePage/upcomming_classes.dart';
import 'package:hck_app/pages/NotificationPage/notification_page.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_body.dart';
import 'package:hck_app/resources/text_heading.dart';
import 'package:hck_app/resources/text_normal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                            builder: (context) => const NotificationPage()));
                  },
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.menu,
                  color: iconColorBlack,
                  size: 33,
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
                          borderRadius: BorderRadius.circular(100)),
                      child: Column(
                        children: [
                          Image.asset('assets/images/student.png'),
                          const SizedBox(height: 3),
                          const TextBody(text: "LC4G2")
                        ],
                      ),
                    ),
                  )
                ],
              )),
          Positioned(
            top: MediaQuery.of(context).size.height / 5,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 4.5,
              width: MediaQuery.of(context).size.width,
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Card(
                  color: heraldGreen,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20, left: 25),
                                child: TextHeading(
                                  text: "Upcoming Class",
                                  color: darkBluishGreen,
                                  size: 16,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20, right: 30),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.watch_later_outlined,
                                      size: 22,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 3),
                                    TextHeading(
                                      text: "12 PM",
                                      size: 16,
                                      color: white,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15, right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 25.0),
                                  child: TextBody(
                                    text: "Internet Software\nArthitecture",
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                                RotationTransition(
                                  turns: AlwaysStoppedAnimation(275 / 360),
                                  child: ImageIcon(
                                      size: 65,
                                      AssetImage('assets/icons/send.png')),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
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
                    )
                  ],
                ),
              )),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.9,
            left: 25,
            child: const UpcomingClasses(),
          )
        ],
      ),
    );
  }
}
