import 'package:flutter/material.dart';

class OnBoardingWidget extends StatefulWidget {
  final String descriptionText;
  final String coverImageLink;

  const OnBoardingWidget(
      {super.key, required this.descriptionText, required this.coverImageLink});

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(widget.coverImageLink),
          Text(widget.descriptionText),
        ],
      ),
    );
  }
}
