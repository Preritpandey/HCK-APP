import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';

class NotificationCard extends StatelessWidget {
  NotificationCard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(10), // Adjust the radius as needed
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Border color
                  borderRadius:
                      BorderRadius.circular(10), // Same as ClipRRect radius
                ),
                child: ExpansionTile(
                  childrenPadding: EdgeInsets.zero,
                  iconColor: Colors.grey,
                  title: Text(
                    'Fee Payment Reminder',
                    style: TextStyle(color: heraldGreen),
                  ),
                  children: const <Widget>[
                    Text(
                      'Dear Student, for your reminder your new semester college\nfee payment is deadline up to 17th November 2022.\nThank You! ',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
