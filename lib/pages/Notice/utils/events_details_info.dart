import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_normal.dart';
import 'package:url_launcher/url_launcher.dart';

class EventsInfo extends StatelessWidget {
  const EventsInfo(
      {Key? key,
      required this.icon,
      required this.title,
      required this.description,
      this.isLink = false})
      : super(key: key);
  final IconData icon;
  final String title;
  final String description;
  final bool isLink;

  ///this function launches url
  ///needs testing in ios emulator
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: const Color(0xFF606A72),
                size: fontSize14,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              TextNormal(
                text: "$title: ",
                color: const Color(0xFF606A72),
                fontWeight: FontWeight.w500,
                size: fontSize12,
              )
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          !isLink
              ? TextNormal(
                  text: description,
                  fontWeight: FontWeight.w500,
                  size: fontSize12,
                )
              : InkWell(
                  onTap: () {
                    _launchInBrowser(Uri.parse(description));
                  },
                  child: TextNormal(
                    text: description,
                    fontWeight: FontWeight.w500,
                    size: fontSize12,
                    color: heraldGreen,
                  ),
                )
        ],
      ),
    );
  }
}
