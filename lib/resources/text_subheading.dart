import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';

class TextSubHeading extends StatelessWidget {
  final double size;
  final String text;
  final Color? color;
  final TextAlign textAlign;
  final int maxLines;
  const TextSubHeading(
      {Key? key,
      this.size = 14,
      required this.text,
      this.color,
      this.maxLines = 3,
      this.textAlign = TextAlign.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontFamily: fontFamily,
          color: color,
          fontSize: size == 14 ? fontSize14 : size,
          fontWeight: FontWeight.w400,
        ));
  }
}
