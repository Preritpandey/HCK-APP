import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';

class TabItem extends StatelessWidget {
  final String title;

  const TabItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 25,
      width: MediaQuery.of(context).size.width / 5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: grey)),
      child: Tab(
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
