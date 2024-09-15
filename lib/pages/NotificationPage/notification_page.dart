import 'package:flutter/material.dart';
import 'package:hck_app/widgets/notification_card.dart';
import 'package:hck_app/resources/text_heading.dart';
import 'package:hck_app/resources/text_subheading.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                SizedBox(width: MediaQuery.of(context).size.width / 3.5),
                const TextHeading(text: "Notifications"),
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: const TextSubHeading(
                      text: "All",
                      color: Colors.black,
                      size: 15,
                    )),
                TextButton(
                    onPressed: () {},
                    child: const TextSubHeading(
                      text: "New Unread",
                      size: 15,
                    )),
                Container(
                  height: 17,
                  width: 17,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red,
                  ),
                  child: const Center(
                    child: Text(
                      "2",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
            NotificationCard(),
          ],
        ),
      ),
    );
  }
}
