import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/data/events_data.dart';
import 'package:hck_app/pages/Notice/pages/event_details.dart';
import 'package:hck_app/pages/Notice/utils/no_events_now.dart';
import 'package:hck_app/pages/Notice/utils/today_events.dart';
import 'package:hck_app/pages/Notice/utils/upcoming_events.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_normal.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class EventBody extends StatelessWidget {
  const EventBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EventDataController());
    PageController pageController = PageController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              TextNormal(
                  text: "Events Now",
                  size: fontSize16,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              controller.todayEvents.isNotEmpty
                  ? Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.75,
                            width: double.maxFinite,
                            child: PageView.builder(
                                controller: pageController,
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.todayEvents.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () => Get.to(EventsDetails(),
                                        arguments:
                                            controller.todayEvents[index]),
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) {
                                    //   return EventsDetails();
                                    // }));

                                    // onTap: () => Get.toNamed("/events_details",
                                    //     arguments:
                                    //         controller.todayEvents[index]
                                    //         ),
                                    child: TodayEvents(
                                      eventTitle:
                                          controller.todayEvents[index].title,
                                      location: controller
                                          .todayEvents[index].organizer,
                                      imageUrl: controller
                                          .todayEvents[index].imageUrl,
                                    ),
                                  );
                                })),
                        controller.todayEvents.length > 1
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Center(
                                      child: SmoothPageIndicator(
                                    controller: pageController,
                                    count: controller.todayEvents.length,
                                    effect: WormEffect(
                                        dotHeight: 8,
                                        dotWidth: 8,
                                        activeDotColor:
                                            Theme.of(context).brightness ==
                                                    Brightness.light
                                                ? elementColor2
                                                : elementColor1,
                                        dotColor:
                                            Theme.of(context).brightness ==
                                                    Brightness.light
                                                ? elementColor1
                                                : elementColor2),
                                  )),
                                ],
                              )
                            : Container()
                      ],
                    )
                  : const NoEvents(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              TextNormal(
                  text: "Upcomming Events",
                  size: fontSize16,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              controller.eventInformation.isEmpty
                  ? Center(
                      child: Image.asset("assets/images/no_items_found.json"),
                    )
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.eventInformation.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            UpcomingEvents(
                                title: controller.eventInformation[index].title,
                                subTitle: controller
                                    .eventInformation[index].organizer,
                                date:
                                    controller.eventInformation[index].dateTime,
                                events: controller.eventInformation[index]),
                          ],
                        );
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
