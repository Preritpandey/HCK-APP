import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/models/routine_model.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_normal.dart';
import 'package:hck_app/services/reminder_service.dart';
import 'package:hck_app/widgets/button_style.dart';
import 'package:intl/intl.dart';

class UpcomingClasses extends StatelessWidget {
  final List<OngoingClassGroup> classes;

// final LoginController loginController = Get.put(LoginController());
  final ReminderController reminderController = Get.put(ReminderController());

  UpcomingClasses({super.key, required this.classes});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(right: 25),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: classes.length,
          itemBuilder: (context, index) {
            OngoingClassGroup ongoingClass = classes[index];
            String formattedStartTime = DateFormat('HH:mm')
                .format(DateFormat('HH:mm:ss').parse(ongoingClass.startTime));
            String formattedEndTime = DateFormat('HH:mm')
                .format(DateFormat('HH:mm:ss').parse(ongoingClass.endTime));

            return SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Card(
                elevation: 0,
                shape: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        ongoingClass.moduleName,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Icon(Icons.access_time_outlined,
                              size: 18, color: Colors.black),
                          TextNormal(
                              text: '$formattedStartTime - $formattedEndTime'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Obx(() {
                        return ElevatedButton(
                          onPressed: () {
                            reminderController.pickDateTime(
                                context, ongoingClass.moduleName);
                          },
                          style: heraldButtonStyle(),
                          child: TextNormal(
                              color: white,
                              text: reminderController.isReminderSet.value
                                  ? 'Reminder Set ${(reminderController.getReminderTime())}'
                                  : 'Set Reminder'),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
