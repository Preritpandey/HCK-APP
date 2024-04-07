import 'package:flutter/material.dart';
import 'package:hck_app/pages/widgets/courses_card.dart';
import 'package:hck_app/resources/text_heading.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                  SizedBox(width: MediaQuery.of(context).size.width / 2.8),
                  const TextHeading(
                    text: 'Courses',
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const CoursesCard(
              courseCategory: 'Bsc (Hons) Computer Science',
              courseName: 'BACHELOR IN INFORMATION \nTECHNOLOGY',
            ),
            const CoursesCard(
              courseCategory: 'Bsc (Hons) International Business Management',
              courseName: 'BACHELOR IN INTERNATIONAL BUSINESS\nMANAGEMENT',
            ),
          ],
        ),
      ),
    );
  }
}
