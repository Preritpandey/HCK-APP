import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/services/schedule_service.dart';
import 'package:hck_app/models/schedule_model.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_heading.dart';
import 'package:hck_app/resources/text_normal.dart';
import 'package:hck_app/widgets/weekend.dart';

class EventCard extends StatelessWidget {
  final String day;
  EventCard({super.key, required this.day});

  final ClassController classController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<ClassModel> classes = classController.getClassesForDay(day);

    return classes.isEmpty
        ? Center(
            child: day == 'Saturday'
                ? const WeekendContainer()
                : Text('No classes for $day'))
        : Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01,
            ),
            child: ListView.builder(
              itemCount: classes.length,
              itemBuilder: (context, index) {
                ClassModel classItem = classes[index];
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.015),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    decoration: BoxDecoration(
                        border: Border.all(color: marginColor),
                        color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width / 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: TextHeading(
                                  text: classItem.moduleName,
                                  size: 14,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(color: Colors.transparent),
                                  color: heraldGreen,
                                ),
                                child: Center(
                                  child: TextNormal(
                                    text: classItem.classType,
                                    color: white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          TextNormal(
                              text: classItem.teacherName,
                              size: 13,
                              color: Colors.grey),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextNormal(
                                  text: "${classItem.startTime.split(":")[0]}:${classItem.startTime.split(":")[1]}"),
                              // SizedBox(width: 3),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 8),
                              const Icon(Icons.location_on,
                                  color: Colors.green, size: 15),
                              TextNormal(
                                text: classItem.roomName,
                                // size: 10,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 20),
                              const Icon(Icons.access_time_filled_sharp,
                                  color: Colors.green, size: 15),
                              TextNormal(
                                  text: classItem.getFormattedDuration()),
                            ],
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
