import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hck_app/controller/lost_and_found_controller.dart';
import 'package:hck_app/controller/lost_and_found_model.dart';
import 'package:hck_app/widgets/no_items_found.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_normal.dart';

class IndividualUnclaimedItem extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final LostAndFoundController controller;
  const IndividualUnclaimedItem({
    Key? key,
    required this.data,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<LostAndFoundDetails> requestHistory = controller.requestHistory
        .where((element) =>
            element.itemCategory == controller.selectedFilterCategory.value &&
            element.status == 'Open')
        .toList();

    return Expanded(
      child: requestHistory.isEmpty
          ? Center(
              child: NoItemsFound(
                  title: 'No Items Found',
                  subtitle:
                      'There are no unclaimed ${controller.selectedFilterCategory.value.toLowerCase()}'),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  child: TextNormal(
                    text: 'Unclaimed Items',
                    size: fontSize16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Expanded(
                  child: ListView.builder(
                    itemCount: requestHistory.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () => Get.toNamed('/request_details',
                                arguments: requestHistory[index]),
                            contentPadding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.03),
                            leading: Icon(
                              data.firstWhere((element) =>
                                  element['title'] ==
                                  controller
                                      .selectedFilterCategory.value)['icon'],
                              size: fontSize24,
                            ),
                            title: TextNormal(
                                text: requestHistory[index].itemTitle,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2),
                            trailing: InkWell(
                              onTap: () => debugPrint('TO:DO: Mark as found'),
                              child: Container(
                                constraints: BoxConstraints(
                                    minWidth:
                                        MediaQuery.of(context).size.width *
                                            0.15),
                                decoration: BoxDecoration(
                                    color: heraldGreen,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.015,
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                  child: TextNormal(
                                      text: 'Mark as Found',
                                      color: Colors.white,
                                      size: fontSize14,
                                      textAlign: TextAlign.center,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 0.5,
                          ),
                          if (index == requestHistory.length - 1)
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextButton(
                                  onPressed: () =>
                                      controller.setFilterCategoryItem('All'),
                                  child: const TextNormal(
                                    text: 'Back to All Categories',
                                    color: heraldGreen,
                                  )),
                            )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
