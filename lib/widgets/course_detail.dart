import 'package:flutter/material.dart';

class CourseInfo extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final String subTitle;

  const CourseInfo(
      {super.key,
      this.backgroundColor = Colors.transparent,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Container(
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(subTitle),
          ],
        ),
      ),
    );
  }
}
