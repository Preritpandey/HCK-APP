import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_body.dart';
import 'package:hck_app/resources/text_heading.dart';
import 'package:hck_app/resources/text_subheading.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      decoration: BoxDecoration(border: Border.all(), color: backgroundWhite),
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextHeading(
                  text: 'Embeded System Programming',
                  size: 14,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: Colors.transparent),
                    color: heraldGreen,
                  ),
                  child: const Center(
                    child: Text(
                      'Workshop',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            const TextSubHeading(text: 'Mr. Sanjay Lama'),
            SizedBox(height: MediaQuery.of(context).size.height / 60),
            Row(
              children: [
                const TextHeading(text: "7:00"),
                SizedBox(width: 3),
                const TextBody(text: 'AM'),
                SizedBox(width: MediaQuery.of(context).size.width / 3.5),
                const Icon(
                  Icons.location_on,
                  color: heraldGreen,
                  size: 15,
                ),
                const TextSubHeading(text: "SR-03 Wolves, WLV"),
                SizedBox(width: MediaQuery.of(context).size.width / 20),
                const Icon(
                  Icons.access_time_filled_sharp,
                  color: heraldGreen,
                  size: 15,
                ),
                const TextSubHeading(text: "2.5hrs"),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
