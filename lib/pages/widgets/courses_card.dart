import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_body.dart';
import 'package:hck_app/resources/text_heading.dart';

class CoursesCard extends StatelessWidget {
  final String courseName;
  final String courseCategory;

  const CoursesCard(
      {super.key, required this.courseName, required this.courseCategory});

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height / 4;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
          horizontal: MediaQuery.of(context).size.width * 0.03),
      child: Container(
        height: containerHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: heraldGreen,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
            padding: const EdgeInsets.only(top: 17, left: 17),
            child: Stack(
              children: [
                TextHeading(
                  text: courseName,
                  color: white,
                ),
                Positioned(
                  top: containerHeight / 3.5,
                  child: TextBody(
                    text: courseCategory,
                    size: 14,
                  ),
                ),
                Positioned(
                    top: containerHeight / 1.6,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3))),
                      onPressed: () {},
                      child: const Center(
                        child: Text(
                          'View Course',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )),
                Positioned(
                    bottom: 0,
                    right: 20,
                    child: Image.asset('assets/images/herald_white_bars.png')),
              ],
            )),
      ),
    );
  }
}
