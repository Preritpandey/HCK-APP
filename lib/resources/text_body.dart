import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';

class TextBody extends StatelessWidget {
  final double size;
  final String? text;
  final Color? color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  const TextBody(
      {Key? key,
      this.size = 13,
      required this.text,
      this.color,
      this.fontWeight = FontWeight.w600,
      this.overflow,
      this.textAlign = TextAlign.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        textAlign: textAlign,
        style: TextStyle(
            color: color,
            fontSize: size == 13 ? fontSize13 : size,
            fontFamily: 'Montserrat',
            fontWeight: fontWeight,
            overflow: overflow));
  }
}
