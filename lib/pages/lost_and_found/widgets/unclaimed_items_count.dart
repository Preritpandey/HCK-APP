import 'package:flutter/material.dart';
import 'package:hck_app/controller/lost_and_found_controller.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_normal.dart';

class UnclaimedItemsCount extends StatelessWidget {
  final LostAndFoundController controller;
  final List<Map<String, dynamic>> data;
  const UnclaimedItemsCount({
    Key? key,
    required this.data,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.01),
          child: TextNormal(
              text: 'No. of Unclaimed Items',
              size: fontSize16,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Expanded(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      if (data[index]['noOfItems'] != 0) ...[
                        ListTile(
                            onTap: () => controller
                                .setFilterCategoryItem(data[index]['title']),
                            contentPadding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.03),
                            leading: Icon(
                              data[index]['icon'],
                            ),
                            title: TextNormal(text: data[index]['title']),
                            trailing: Container(
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
                                              0.018,
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                  child: TextNormal(
                                      text: data[index]['noOfItems'].toString(),
                                      color: Colors.white,
                                      size: fontSize18,
                                      textAlign: TextAlign.center,
                                      fontWeight: FontWeight.w500),
                                ))),
                        const Divider(thickness: 0.5)
                      ]
                    ],
                  );
                }))
      ],
    ));
  }
}
