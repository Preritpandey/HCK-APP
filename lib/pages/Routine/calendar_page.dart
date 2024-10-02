import 'package:flutter/material.dart';
import 'package:hck_app/resources/constant.dart';
import 'package:hck_app/resources/text_heading.dart';
import 'package:hck_app/resources/text_normal.dart';
import 'package:hck_app/services/schedule_service.dart';
import 'package:hck_app/widgets/sf_calendar_styles.dart';
import 'package:iconsax/iconsax.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // For date formatting

class CalendarPage extends StatelessWidget {
  CalendarPage({super.key});
  final ClassController classController = Get.put(ClassController());
  var selectedDay = ''.obs;
  Rx selectedFullDate = DateTime.now().obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.38,
              child: SfCalendar(
                view: CalendarView.month,
                initialSelectedDate: DateTime.now(),
                cellBorderColor: Colors.transparent,
                viewHeaderStyle: viewHeaderStyle(context),
                todayTextStyle: const TextStyle(color: white),
                headerStyle:
                    calendarHeaderStyle(context, fontWeight: FontWeight.w500),
                showNavigationArrow: true,
                selectionDecoration: BoxDecoration(
                    border: Border.all(width: 1, color: heraldGreen),
                    shape: BoxShape.circle),
                todayHighlightColor: heraldGreen,
                monthViewSettings: monthViewSettings(context),
                onSelectionChanged: (CalendarSelectionDetails details) {
                  // When a date is selected, convert it to the day and fetch the classes
                  final DateTime selectedDate = details.date!;
                  selectedFullDate.value = selectedDate;
                  selectedDay.value = DateFormat('EEEE').format(selectedDate);

                  // Fetch classes for the selected day
                  classController.getClassesForDay(selectedDay.value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Obx(
                  () => TextNormal(
                      fontWeight: FontWeight.w500,
                      text:
                          'Date : ${DateFormat('yyyy-MM-dd').format(selectedFullDate.value)}'),
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                // Show loading spinner while data is loading
                if (classController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Display the classes for the selected date
                final classes =
                    classController.getClassesForDay(selectedDay.value);
                if (classes.isEmpty) {
                  return const Center(child: Text('No classes for this date'));
                }

                return ListView.builder(
                  itemCount: classes.length,
                  itemBuilder: (context, index) {
                    final classItem = classes[index];
                    return Card(
                      elevation: 0,
                      shape: Border.all(color: transparent),
                      color: heraldGreen.withOpacity(0.2),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        title: TextHeading(
                          text: classItem.moduleName,
                          size: fontSize16,
                          color: textColor,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            TextNormal(
                              text:
                                  '${classItem.startTime} - ${classItem.endTime}',
                              size: fontSize14,
                              fontWeight: FontWeight.w600,
                              color: textColor,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 16.0, top: 16),
                              child: TextNormal(
                                text: classItem.teacherName,
                                size: fontSize12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        trailing: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.1,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? null
                                    : Colors.white,
                          ),
                          child: IconButton(
                            icon: const Icon(Iconsax.calendar_add),
                            onPressed: () {
                              debugPrint('TO:DO - Add to calendar');
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
