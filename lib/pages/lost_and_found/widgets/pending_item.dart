import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hck_app/controller/lost_and_found_controller.dart';
import 'package:hck_app/pages/lost_and_found/widgets/individual_unclaimed_item.dart';
import 'package:hck_app/widgets/input_decoration.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_normal.dart';
import 'unclaimed_items_count.dart';

class PendingItems extends StatelessWidget {
  const PendingItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LostAndFoundController>();

    final List<Map<String, dynamic>> data = [
      {
        'title': 'Accessories',
        'icon': FontAwesomeIcons.bagShopping,
        'noOfItems': controller.requestHistory
            .where((element) =>
                element.itemCategory == 'Accessories' &&
                element.status == 'Open')
            .length,
      },
      {
        'title': 'Clothing',
        'icon': FontAwesomeIcons.shirt,
        'noOfItems': controller.requestHistory
            .where((element) =>
                element.itemCategory == 'Clothing' && element.status == 'Open')
            .length,
      },
      {
        'title': 'Electronics',
        'icon': FontAwesomeIcons.mobile,
        'noOfItems': controller.requestHistory
            .where((element) =>
                element.itemCategory == 'Electronics' &&
                element.status == 'Open')
            .length,
      },
      {
        'title': 'Eyeglasses',
        'icon': FontAwesomeIcons.glasses,
        'noOfItems': controller.requestHistory
            .where((element) =>
                element.itemCategory == 'Eyeglasses' &&
                element.status == 'Open')
            .length,
      },
      {
        'title': 'Water Bottles',
        'icon': FontAwesomeIcons.bottleWater,
        'noOfItems': controller.requestHistory
            .where((element) =>
                element.itemCategory == 'Water Bottles' &&
                element.status == 'Open')
            .length,
      },
      {
        'title': 'Miscellaneous',
        'icon': FontAwesomeIcons.box,
        'noOfItems': controller.requestHistory
            .where((element) => element.itemCategory == 'Miscellaneous')
            .length,
      }
    ];

    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() =>
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01),
                child: TextNormal(
                  text: 'Choose a Category',
                  size: fontSize16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              DropdownButtonFormField<String>(
                borderRadius: BorderRadius.circular(10),
                iconSize: MediaQuery.of(context).size.height * 0.03,
                items: controller.createFilterCategory,
                decoration: inputDecoration(context, "", false,
                    bottomPadding: MediaQuery.of(context).size.height * 0.004),
                onChanged: (item) => controller.setFilterCategoryItem(item!),
                value: controller.selectedFilterCategory.value,
                hint: TextNormal(
                    text: 'All', size: fontSize16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              if (controller.selectedFilterCategory.value == 'All') ...[
                UnclaimedItemsCount(data: data, controller: controller),
              ] else ...[
                IndividualUnclaimedItem(data: data, controller: controller)
              ]
            ])));
  }
}
