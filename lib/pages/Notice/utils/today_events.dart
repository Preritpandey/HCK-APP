import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_normal.dart';
import 'package:iconsax/iconsax.dart';

class TodayEvents extends StatelessWidget {
  const TodayEvents(
      {super.key,
      required this.eventTitle,
      required this.location,
      required this.imageUrl});
  final String eventTitle;
  final String location;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Radius borderRadius = const Radius.circular(6);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
            width: 0.8,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white30
                : Colors.black26),
      ),
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight * 0.28,
            width: screenWidth * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: borderRadius, topRight: borderRadius),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imageUrl),
                )),
          ),
          SizedBox(
            width: screenWidth * 0.9,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextNormal(
                    text: eventTitle,
                    fontWeight: FontWeight.w600,
                    size: fontSize14,
                  ),
                  SizedBox(
                    height: screenWidth * 0.02,
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Iconsax.location5,
                            size: fontSize20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.005,
                          ),
                          TextNormal(
                            text: location,
                            fontWeight: FontWeight.w500,
                            size: fontSize10,
                          )
                        ],
                      ),
                      SizedBox(
                        width: screenWidth * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.access_time_filled_sharp,
                            size: fontSize20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.005,
                          ),
                          const TextNormal(
                            text: "Started",
                            fontWeight: FontWeight.w500,
                            size: fontSize10,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
