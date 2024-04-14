import 'package:flutter/material.dart';
import 'package:hck_app/resources/text_heading.dart';
import 'package:hck_app/resources/text_subheading.dart';

class NoItemsFound extends StatelessWidget {
  final String title;
  final String subtitle;
  const NoItemsFound({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Image.asset('assets/images/no_items_found.json',
              height: MediaQuery.of(context).size.width * 0.29),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        TextHeading(text: title),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        TextSubHeading(
          text: subtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
