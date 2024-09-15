import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/controller/lost_and_found_controller.dart';
import 'package:hck_app/widgets/button_style.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_heading.dart';

import '../widgets/widgets.dart';

class RequestLostItem extends StatelessWidget {
  const RequestLostItem({
    Key? key,
  }) : super(key: key);

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LostAndFoundController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Request a Lost Item'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const StudentDetails(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    const ItemDetails(),
                    AdditionalDetails(
                      title: 'Item Description',
                      hintText:
                          "Give further information about your lost item.",
                      textController: controller.itemDescriptionController,
                    ),
                    AdditionalDetails(
                      title: 'Additional Location Description (if any)',
                      hintText:
                          "Give further information where you lost your item.",
                      isRequired: false,
                      textController:
                          controller.additionalDescriptionController,
                    ),
                    Obx(
                      () => Center(
                        child: ElevatedButton(
                          onPressed: () => controller.isLoading.value
                              ? null
                              : controller.submitForm(formKey),
                          style: controller.isLoading.value
                              ? heraldButtonStyle(color: Colors.grey)
                              : heraldButtonStyle(),
                          child: TextHeading(
                              text: controller.isLoading.value
                                  ? "Processing your request"
                                  : "Submit Request",
                              size: fontSize18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
