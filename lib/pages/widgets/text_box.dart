import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/pages/widgets/input_decoration.dart';
import 'package:hck_app/resources/constant.dart';

class TextBox extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isRequired;
  final double widthFactor;
  const TextBox(
      {Key? key,
      required this.controller,
      required this.label,
      required this.isRequired,
      this.widthFactor = 0.43})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.008),
        width: MediaQuery.of(context).size.width * widthFactor,
        child: TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => value!.isEmpty && isRequired
              ? '${label.capitalizeFirst} is required'
              : null,
          enableSuggestions: false,
          cursorColor: heraldGreen,
          decoration:
              inputDecoration(context, label, isRequired, textScaleFactor: 1),
        ));
  }
}
