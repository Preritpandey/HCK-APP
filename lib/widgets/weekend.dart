import 'package:flutter/material.dart';
import 'package:hck_app/resources/text_heading.dart';

class WeekendContainer extends StatelessWidget {
  const WeekendContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/icons/weekend.png'),
        const SizedBox(height: 20),
        const TextHeading(text: "It’s a weekend!")
      ],
    );
  }
}
