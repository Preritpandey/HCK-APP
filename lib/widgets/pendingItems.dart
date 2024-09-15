import 'package:flutter/material.dart';
import 'package:hck_app/widgets/lostAndFound_button.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_subheading.dart';

class PendingItemCard extends StatelessWidget {
  final String icon;
  final String itemName;
  final int itemCount;
  const PendingItemCard(
      {super.key,
      required this.icon,
      required this.itemName,
      required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.4,
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/icons/$icon.png'),
                      ),
                    ),
                    TextSubHeading(
                      text: itemName,
                      size: 16,
                      color: textColor,
                    ),
                  ],
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 2.7),
              ItemCountCard(count: itemCount),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
