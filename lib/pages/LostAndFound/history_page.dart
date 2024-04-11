import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_body.dart';
import 'package:hck_app/resources/text_heading.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: Column(
          children: [
            const TextHeading(
              text: 'Sun, 31st July 2023',
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: cardBackground,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.020),
                      child: const Column(
                        children: [
                          TextHeading(text: 'Electronics'),
                          TextBody(
                            text: 'Date:22/07/2022',
                            color: black2,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.03),
                      child: Row(
                        children: [
                          const TextHeading(
                            text: 'Open',
                            color: heraldGreen,
                          ),
                          GestureDetector(
                            child: const Icon(Icons.arrow_forward_ios,
                                color: heraldGreen),
                            onTap: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
