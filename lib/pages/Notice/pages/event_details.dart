import 'package:flutter/material.dart';
import 'package:hck_app/pages/Notice/utils/events_details_info.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_normal.dart';
import 'package:iconsax/iconsax.dart';

import '../../../data/events_model.dart';

class EventsDetails extends StatelessWidget {
  const EventsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Events data = ModalRoute.of(context)!.settings.arguments as Events;
    return Scaffold(
      appBar: AppBar(title: const Text("Event Details")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/HCK.png'),
                      fit: BoxFit.cover)),
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.maxFinite,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextNormal(
              text: data.title,
              fontWeight: FontWeight.w600,
              size: fontSize16,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const EventsInfo(
                title: "Venue",
                description: "LT03-Walshall,WLV Block",
                icon: Icons.location_on),
            const EventsInfo(
                title: "Time", description: "1:00 PM", icon: Icons.timer),
            EventsInfo(
                title: "Date",
                description: data.dateTime,
                icon: Icons.calendar_month),
            EventsInfo(
                title: "Organizers",
                description: data.organizer,
                icon: Iconsax.people5),
            const EventsInfo(
                isLink: true,
                title: "Form Link",
                description: "https://forms.gle/aWeo30jPLk",
                icon: Icons.file_copy),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const TextNormal(
              text: "Event Description",
              fontWeight: FontWeight.w600,
              size: fontSize14,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? grey
                        : black1,
                    borderRadius: BorderRadius.circular(8)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: const TextNormal(
                  text:
                      "Lorem ipsum dolor sit amet consectetur. Sapien diam ornare eget hendrerit ullamcorper egestas consectetur eget. Leo quis ipsum eu aliquam. Ipsum enim feugiat rutrum a ultricies gravida vulputate pellentesque.\n\nLorem ipsum dolor sit amet consectetur. Sapien diam ornare eget hendrerit ullamcorper egestas consectetur eget. Leo quis ipsum eu aliquam. Ipsum enim feugiat rutrum a ultricies gravida vulputate pellentesque.",
                  size: fontSize10,
                )),
          ]),
        ),
      ),
      bottomSheet: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextNormal(
              text: "Form expires in: ",
              size: fontSize10,
              fontWeight: FontWeight.w400),
          TextNormal(
            text: "3d 10h",
            size: fontSize10,
            fontWeight: FontWeight.w600,
            color: heraldGreen,
          )
        ],
      ),
    );
  }
}
