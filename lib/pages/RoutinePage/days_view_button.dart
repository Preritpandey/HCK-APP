import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DaysButton extends StatelessWidget {
  final String buttonText;
  // final int tappedButtonIndex;
  const DaysButton({
    super.key,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(border: Border.all()),
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 22,
          child: Center(child: Text(buttonText))),
    );
  }
}
