import 'package:flutter/material.dart';
import 'package:hck_app/pages/widgets/pendingItems.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_heading.dart';

class PendingPage extends StatelessWidget {
  const PendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const TextHeading(
            text: 'Number of Unclaimed Items',
            color: textColor,
            size: 16,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          const PendingItemCard(
            icon: 'shoppingBag',
            itemName: 'Accessories',
            itemCount: 102,
          ),
          const PendingItemCard(
            icon: 'devices',
            itemName: 'Electronics',
            itemCount: 40,
          ),
          const PendingItemCard(
            icon: 'clothes',
            itemName: 'Clothing',
            itemCount: 18,
          ),
          const PendingItemCard(
            icon: 'glass',
            itemName: 'Eye Glasses',
            itemCount: 33,
          ),
        ],
      ),
    );
  }
}
