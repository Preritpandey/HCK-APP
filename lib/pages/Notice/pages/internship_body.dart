import 'package:flutter/material.dart';
import 'package:hck_app/pages/Notice/utils/internship_container.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_normal.dart';

class InternshipBody extends StatelessWidget {
  const InternshipBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          TextNormal(
              text: "Available Now",
              fontWeight: FontWeight.w600,
              size: fontSize16),
          Expanded(
              child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return const InternShipContainer();
            },
          ))
        ],
      ),
    );
  }
}
