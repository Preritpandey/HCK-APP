import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/controller/lost_and_found_controller.dart';
import 'package:hck_app/controller/lost_and_found_model.dart';
import 'package:hck_app/pages/widgets/no_items_found.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_heading.dart';
import 'package:hck_app/resources/text_normal.dart';

import 'package:iconsax/iconsax.dart';

class RequestHistory extends StatelessWidget {
  const RequestHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LostAndFoundController>();
    List<LostAndFoundDetails> requestHistory = controller.requestHistory;
    List<String> date = [];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: requestHistory.isEmpty
          ? Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08),
              child: const NoItemsFound(
                title: 'No requests yet',
                subtitle: 'When you make a request, it will show up here',
              ),
            )
          : ListView.builder(
              itemCount: requestHistory.length,
              itemBuilder: (context, index) {
                final String status = requestHistory[index].status;
                final Color statusColor =
                    status == 'Open' ? Colors.green : Colors.red;

                // Group by date
                bool first = true;
                if (date.contains(requestHistory[index].date)) {
                  first = false;
                } else {
                  date.add(requestHistory[index].date);
                }

                return Column(
                  children: [
                    if (first)
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03,
                            bottom: 8),
                        child: TextNormal(
                          text: requestHistory[index].date,
                          size: fontSize16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    _Card(
                      requestHistory: requestHistory,
                      status: status,
                      statusColor: statusColor,
                      index: index,
                    ),
                  ],
                );
              }),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    Key? key,
    required this.requestHistory,
    required this.status,
    required this.statusColor,
    required this.index,
  }) : super(key: key);

  final List<LostAndFoundDetails> requestHistory;
  final String status;
  final Color statusColor;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: grey,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
          vertical: MediaQuery.of(context).size.height * 0.004,
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: TextHeading(
            text: requestHistory[index].itemTitle,
            size: fontSize16,
            maxLines: 1,
          ),
        ),
        subtitle: TextNormal(
            text: 'Lost Date: ${requestHistory[index].lostDate}',
            size: fontSize12),
        trailing: SizedBox(
          width: MediaQuery.of(context).size.width * 0.19,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextNormal(
                  text: status,
                  size: fontSize14,
                  color: statusColor,
                  fontWeight: FontWeight.w600),
              const SizedBox(width: 5),
              Icon(Iconsax.arrow_right_3, color: statusColor, size: fontSize16),
            ],
          ),
        ),
        onTap: () =>
            Get.toNamed('/request_details', arguments: requestHistory[index]),
      ),
    );
  }
}
