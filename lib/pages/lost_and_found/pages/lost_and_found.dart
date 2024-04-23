import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/controller/lost_and_found_controller.dart';
import 'package:hck_app/pages/lost_and_found/pages/lost_and_found_body.dart';
import 'package:hck_app/pages/lost_and_found/pages/request_lost_item_body.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:iconsax/iconsax.dart';

class LostAndFound extends StatelessWidget {
  const LostAndFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LostAndFoundController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: false,
      appBar: AppBar(title: Text('Lost and Found'), actions: [
        IconButton(
            icon: Icon(Iconsax.edit4, size: fontSize24),
            onPressed: () => Get.to(RequestLostItem()))
      ]),
      body: const LostAndFoundBody(),
    );
  }
}
