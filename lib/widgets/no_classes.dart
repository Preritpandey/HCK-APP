import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_normal.dart';

class NoClasses extends StatelessWidget {
  final double? height;
  const NoClasses({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'assets/images/celebration.png',
          height: height,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        const TextNormal(
          text: 'Yayy!\n No Class This Day',
          size: fontSize20,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      ]),
    );
  }
}
