import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_normal.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
      ),
      padding: EdgeInsets.only(
          bottom:
              Platform.isIOS ? 0 : MediaQuery.of(context).size.height * 0.03),
      child: TextNormal(
          text: "Copyright © 2022. All rights reserved to HCK",
          size: fontSize14),
    );
  }
}
