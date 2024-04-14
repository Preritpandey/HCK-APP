import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/controller/lost_and_found_controller.dart';
import 'package:hck_app/pages/widgets/input_decoration.dart';
import 'package:hck_app/pages/widgets/text_box.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_heading.dart';
import 'package:hck_app/resources/text_subheading.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LostAndFoundController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextHeading(text: "Item Details", size: fontSize20),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.02),
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextBox(
            label: "Item Name",
            isRequired: true,
            controller: controller.itemNameController,
          ),
        ),
        DropdownButtonFormField<String>(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) =>
              value == null ? "Please select an item category!" : null,
          iconSize: MediaQuery.of(context).size.height * 0.03,
          items: controller.createCategoryList,
          decoration: inputDecoration(context, "Item Category", true,
              bottomPadding: 10),
          onChanged: (item) => controller.setCategoryItem(item!),
          hint: TextSubHeading(
            text: "Choose Category...",
            size: fontSize12,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Obx(() => DateTimeFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        controller.selectedDate.value.isAfter(DateTime.now())
                            ? 'Please enter a valid date'
                            : null,
                    initialValue: controller.selectedDate.value,
                    dateTextStyle: TextStyle(
                      fontSize: fontSize14,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: inputDecoration(context, "Lost Date", true,
                        bottomPadding: 10),
                    mode: DateTimeFieldPickerMode.date,
                    onDateSelected: (DateTime value) =>
                        controller.selectedDate.value = value)),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.014),
              Expanded(
                child: DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(10),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      value == null ? "Please select a block!" : null,
                  iconSize: MediaQuery.of(context).size.height * 0.03,
                  items: controller.createBlockList,
                  decoration: inputDecoration(context, "Block", true,
                      bottomPadding:
                          MediaQuery.of(context).size.height * 0.004),
                  onChanged: (item) => controller.setBlockItem(item!),
                  hint: TextSubHeading(
                    text: "Select Block...",
                    size: fontSize12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
