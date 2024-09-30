import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/services/lost_and_found_service.dart';
import 'package:hck_app/pages/lost_and_found/pages/lost_and_found_body.dart';
import 'package:hck_app/pages/lost_and_found/pages/request_lost_item_body.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_heading.dart';
import 'package:iconsax/iconsax.dart';

class LostAndFound extends StatelessWidget {
  const LostAndFound({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LostAndFoundController());
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed('/HomePage'); 
        return false; // Prevent default back navigation
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const TextHeading(text: 'Lost and Found'),
          actions: [
            IconButton(
              icon: const Icon(Iconsax.edit4, size: fontSize24),
              onPressed: () => Get.to(const RequestLostItem()),
            ),
          ],
        ),
        body: const LostAndFoundBody(),
      ),
    );
  }
}
