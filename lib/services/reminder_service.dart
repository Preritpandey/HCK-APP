import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hck_app/services/notification_service.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReminderController extends GetxController {
  var selectedDateTime = DateTime.now().obs;
  var isReminderSet = false.obs;
  RxString moduleName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadReminderData(); // Load saved reminder data on initialization
  }

  // Function to pick date and time
  void pickDateTime(BuildContext context, String? className) async {
    moduleName.value = className.toString();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final selectedTime = DateTime(pickedDate.year, pickedDate.month,
            pickedDate.day, pickedTime.hour, pickedTime.minute);
        selectedDateTime.value = selectedTime;

        // Set the reminder
        NotificationService.scheduleNotification(
          1, // Unique ID for the notification
          "Class Reminder",
          "Don't forget to join your $moduleName class!",
          selectedDateTime.value,
        );

        // Update the state to indicate the reminder is set
        isReminderSet.value = true;

        // Save reminder data to SharedPreferences
        await saveReminderData();

        // Show confirmation dialog
        showReminderDialog(context);
      }
    }
  }

  // Function to show confirmation dialog
  void showReminderDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text('Reminder Set'),
        content: Text(
          'Your reminder has been set for ${DateFormat('MMM d, yyyy, hh:mm a').format(selectedDateTime.value)}',
        ),
        actions: [
          TextButton(
            onPressed: () {
              cancelReminder();
              Get.back(); // Close dialog
            },
            child: const Text('Cancel Reminder'),
          ),
          TextButton(
            onPressed: () => Get.back(), // Close dialog
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // Function to cancel the reminder
  void cancelReminder() {
    NotificationService.cancelNotification(
        1); // Cancel the notification with ID 1
    isReminderSet.value = false; // Reset the reminder set state
    clearReminderData(); // Clear reminder data from SharedPreferences
  }

  // Function to return the reminder time in hours and minutes
  String getReminderTime() {
    return DateFormat('hh:mm a').format(selectedDateTime.value);
  }

  // Save reminder data to SharedPreferences
  Future<void> saveReminderData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isReminderSet', isReminderSet.value);
    await prefs.setString(
        'reminderTime', selectedDateTime.value.toIso8601String());
    await prefs.setString('moduleName', moduleName.value);
  }

  // Load reminder data from SharedPreferences
  Future<void> loadReminderData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isReminderSet.value = prefs.getBool('isReminderSet') ?? false;
    moduleName.value = prefs.getString('moduleName') ?? '';
    String? savedTime = prefs.getString('reminderTime');
    if (savedTime != null) {
      selectedDateTime.value = DateTime.parse(savedTime);
    }
  }

  // Clear reminder data from SharedPreferences
  Future<void> clearReminderData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isReminderSet');
    await prefs.remove('reminderTime');
    await prefs.remove('moduleName');
  }
}
