import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/controller/lost_and_found_controller.dart';
import 'package:hck_app/pages/widgets/text_box.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_heading.dart';

class StudentDetails extends StatelessWidget {
  const StudentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LostAndFoundController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextHeading(text: "Student Details", size: fontSize20),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextBox(
                label: "First Name",
                isRequired: true,
                controller: controller.firstNameController),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            TextBox(
                label: "Last Name",
                isRequired: true,
                controller: controller.lastNameController),
          ],
        ),
        TextBox(
            label: "Phone Number",
            widthFactor: 0.7,
            isRequired: true,
            controller: controller.phoneNumberController),
      ],
    );
  }
}
