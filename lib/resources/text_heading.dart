import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';

class TextHeading extends StatelessWidget {
  final double size;
  final String? text;
  final Color? color;
  final int maxLines;
  const TextHeading(
      {Key? key,
      this.size = 24,
      required this.text,
      this.color,
      this.maxLines = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: color,
          fontSize: size == 24 ? fontSize24 : size,
          fontWeight: FontWeight.bold,
        ));
  }
}
