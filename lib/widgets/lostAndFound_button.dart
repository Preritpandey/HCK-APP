import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_heading.dart';

class LostAndFoundButton extends StatelessWidget {
  final String buttonText;
  final bool isButtonTapped;

  const LostAndFoundButton(
      {super.key, required this.buttonText, required this.isButtonTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width / 3.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isButtonTapped ? heraldGreen : Colors.transparent,
        border: Border.all(
            color: isButtonTapped ? Colors.transparent : Colors.black),
      ),
      child: Center(
        child: Text(buttonText,
            style: TextStyle(
              color: isButtonTapped ? white : black1,
              fontSize: 15,
            )),
      ),
    );
  }
}

class ItemCountCard extends StatelessWidget {
  final int count;
  const ItemCountCard({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      width: 43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: heraldGreen,
      ),
      child: Center(
        child: TextHeading(
          text: count.toString(),
          size: 20,
          color: white,
        ),
      ),
    );
  }
}
