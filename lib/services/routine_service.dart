import 'dart:async';
import 'dart:convert';
import 'package:hck_app/resources/api_constants.dart';
import 'package:hck_app/services/notification_service.dart';
import 'package:hck_app/services/reminder_service.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:hck_app/models/routine_model.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoutineController extends GetxController {
  ReminderController reminderController = Get.put(ReminderController());
  var upcomingClass = Rxn<OngoingClassGroup>(); // First upcoming class
  var restClasses = <OngoingClassGroup>[].obs; // Rest of the day's classes
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  RxBool isWeekend = false.obs;

  final Box<OngoingClassGroup> routineBox =
      Hive.box<OngoingClassGroup>('routineBox');

  Timer? _timer;
  DateTime selectedDate = DateTime.now(); // Default to current date

  @override
  void onInit() {
    super.onInit();
    fetchClasses(); // Fetch data when initialized
    _startPolling(); // Poll every minute for updates
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void _startPolling() {
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      fetchClasses();
    });
  }

  Future<void> fetchClasses() async {
    try {
      isLoading(true);

      // First, check if cached data is available and display it
      if (routineBox.isNotEmpty) {
        List<OngoingClassGroup> cachedClasses = routineBox.values.toList();
        _filterClasses(cachedClasses); // Use cached data if available
      } else {
        errorMessage(
            'No cached data available. Please connect to the internet.');
      }

      // Fetch fresh data from API
      final prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString('accessToken');

      await prefs.setString('reminderDuration',
          reminderController.selectedDateTime.value.toString());
      print(prefs.getString('reminderDuration'));

      final group = prefs.getString('group');
      final url = Uri.parse('$getRoutineUrl$group');

      final response = await http.get(url, headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);
        List<dynamic> classList = jsonData['ongoingClassGroup/s'];

        List<OngoingClassGroup> classes =
            classList.map((data) => OngoingClassGroup.fromJson(data)).toList();

        // Store the fetched classes into the Hive box (cache)
        await routineBox.clear();
        await routineBox.addAll(classes);
        // Filter classes based on the selected date
        _filterClasses(classes);
      } else {
        throw Exception('Failed to load ongoing classes');
      }
    } catch (e) {
      // If API call fails, fallback to cached data if it's not already loaded
      if (routineBox.isNotEmpty) {
        List<OngoingClassGroup> cachedClasses = routineBox.values.toList();
        _filterClasses(cachedClasses); // Use cached data if available
      } else {
        errorMessage('Failed to fetch classes. No data available.');
      }
    } finally {
      isLoading(false);
    }
  }

// Filter the classes based on the selected date
  void _filterClasses(List<OngoingClassGroup> classes) {
    DateFormat timeFormat = DateFormat('HH:mm:ss'); // Only hours and minutes

    // Get today's day name (e.g., "Monday")
    String todayDayName = DateFormat('EEEE')
        .format(selectedDate)
        .toUpperCase(); // Convert to uppercase
    if (todayDayName == 'SATURDAY') {
      isWeekend.value = true;
    }
    List<OngoingClassGroup> selectedDateClasses = classes.where((classGroup) {
      DateTime classStartTime = timeFormat.parse(classGroup.startTime);
      DateTime classEndTime = timeFormat.parse(classGroup.endTime);

      // Combine the class start time with the selected date
      DateTime classStartDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          classStartTime.hour,
          classStartTime.minute,
          classStartTime.second);

      DateTime classEndDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        classEndTime.hour,
        classEndTime.minute,
        classEndTime.second,
      );

      // Check if the class day matches today's day
      bool isSameDay = classGroup.day.toUpperCase() == todayDayName;

      // Ensure the class is for today and hasn't ended yet
      return isSameDay &&
          (classStartDateTime.isAfter(DateTime.now()) ||
              classEndDateTime.isAfter(DateTime.now()));
    }).toList();

    // Sort by start time
    selectedDateClasses.sort((a, b) {
      DateTime timeA = timeFormat.parse(a.startTime);
      DateTime timeB = timeFormat.parse(b.startTime);
      return timeA.compareTo(timeB);
    });

    if (selectedDateClasses.isNotEmpty) {
      upcomingClass.value = selectedDateClasses.first;
      restClasses.value = selectedDateClasses.skip(1).toList();
    } else {
      upcomingClass.value = null;
      restClasses.clear();
    }
  }

  // Method to get classes for a specific date
  List<OngoingClassGroup> getClassesForDate(DateTime date) {
    selectedDate = date;
    List<OngoingClassGroup> allClasses = routineBox.values.toList();
    _filterClasses(allClasses);
    return restClasses;
  }

  void setSelectedDate(DateTime date) {
    selectedDate = date;
    fetchClasses();
  }
}

// -------------------new code including scheduled notification
// class RoutineController extends GetxController {
//   ReminderController reminderController = Get.put(ReminderController());
//   var upcomingClass = Rxn<OngoingClassGroup>(); // First upcoming class
//   var restClasses = <OngoingClassGroup>[].obs; // Rest of the day's classes
//   var isLoading = true.obs;
//   var errorMessage = ''.obs;
//   RxBool isWeekend = false.obs;

//   final Box<OngoingClassGroup> routineBox =
//       Hive.box<OngoingClassGroup>('routineBox');
//   Timer? _timer;
//   DateTime selectedDate = DateTime.now(); // Default to current date

//   Set<int> scheduledNotifications = {}; // Keep track of scheduled notifications

//   @override
//   void onInit() {
//     super.onInit();
//     fetchClasses(); // Fetch data when initialized
//     _startPolling(); // Poll every minute for updates
//   }

//   @override
//   void onClose() {
//     _timer?.cancel();
//     super.onClose();
//   }

//   void _startPolling() {
//     _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
//       fetchClasses();
//     });
//   }

//   Future<void> fetchClasses() async {
//     try {
//       isLoading(true);

//       // First, check if cached data is available and display it
//       if (routineBox.isNotEmpty) {
//         List<OngoingClassGroup> cachedClasses = routineBox.values.toList();
//         _filterClasses(cachedClasses); // Use cached data if available
//       } else {
//         errorMessage(
//             'No cached data available. Please connect to the internet.');
//       }

//       // Fetch fresh data from API
//       final prefs = await SharedPreferences.getInstance();
//       final accessToken = prefs.getString('accessToken');
//       final group = prefs.getString('group');
//       final url = Uri.parse('$getRoutineUrl$group');

//       final response = await http.get(url, headers: {
//         'Authorization': 'Bearer $accessToken',
//         'Content-Type': 'application/json',
//       });

//       if (response.statusCode == 200) {
//         Map<String, dynamic> jsonData = json.decode(response.body);
//         List<dynamic> classList = jsonData['ongoingClassGroup/s'];

//         List<OngoingClassGroup> classes =
//             classList.map((data) => OngoingClassGroup.fromJson(data)).toList();

//         // Store the fetched classes into the Hive box (cache)
//         await routineBox.clear();
//         await routineBox.addAll(classes);

//         // Filter classes based on the selected date
//         _filterClasses(classes);

//         // Schedule notifications for upcoming classes
//         _scheduleClassNotifications(classes);
//       } else {
//         throw Exception('Failed to load ongoing classes');
//       }
//     } catch (e) {
//       // If API call fails, fallback to cached data if it's not already loaded
//       if (routineBox.isNotEmpty) {
//         List<OngoingClassGroup> cachedClasses = routineBox.values.toList();
//         _filterClasses(cachedClasses); // Use cached data if available
//       } else {
//         errorMessage('Failed to fetch classes. No data available.');
//       }
//     } finally {
//       isLoading(false);
//     }
//   }

//   // Filter the classes based on the selected date
//   void _filterClasses(List<OngoingClassGroup> classes) {
//     DateFormat timeFormat = DateFormat('HH:mm:ss'); // Only hours and minutes

//     // Get today's day name (e.g., "Monday")
//     String todayDayName = DateFormat('EEEE')
//         .format(selectedDate)
//         .toUpperCase(); // Convert to uppercase
//     if (todayDayName == 'SATURDAY') {
//       isWeekend.value = true;
//     }
//     List<OngoingClassGroup> selectedDateClasses = classes.where((classGroup) {
//       DateTime classStartTime = timeFormat.parse(classGroup.startTime);
//       DateTime classEndTime = timeFormat.parse(classGroup.endTime);

//       // Combine the class start time with the selected date
//       DateTime classStartDateTime = DateTime(
//         selectedDate.year,
//         selectedDate.month,
//         selectedDate.day,
//         classStartTime.hour,
//         classStartTime.minute,
//         classStartTime.second,
//       );

//       DateTime classEndDateTime = DateTime(
//         selectedDate.year,
//         selectedDate.month,
//         selectedDate.day,
//         classEndTime.hour,
//         classEndTime.minute,
//         classEndTime.second,
//       );

//       // Check if the class day matches today's day
//       bool isSameDay = classGroup.day.toUpperCase() == todayDayName;

//       // Ensure the class is for today and hasn't ended yet
//       return isSameDay &&
//           (classStartDateTime.isAfter(DateTime.now()) ||
//               classEndDateTime.isAfter(DateTime.now()));
//     }).toList();

//     // Sort by start time
//     selectedDateClasses.sort((a, b) {
//       DateTime timeA = timeFormat.parse(a.startTime);
//       DateTime timeB = timeFormat.parse(b.startTime);
//       return timeA.compareTo(timeB);
//     });

//     if (selectedDateClasses.isNotEmpty) {
//       upcomingClass.value = selectedDateClasses.first;
//       restClasses.value = selectedDateClasses.skip(1).toList();
//     } else {
//       upcomingClass.value = null;
//       restClasses.clear();
//     }
//   }

//   // Schedule notifications for each class 10 minutes before start time

//   void _scheduleClassNotifications(List<OngoingClassGroup> classes) {
//     DateFormat timeFormat = DateFormat('HH:mm:ss');

//     // Filter classes for the selected date
//     String todayDayName = DateFormat('EEEE').format(selectedDate).toUpperCase();
//     List<OngoingClassGroup> todayClasses = classes.where((classGroup) {
//       return classGroup.day.toUpperCase() == todayDayName;
//     }).toList();

//     for (var classGroup in todayClasses) {
//       DateTime classStartTime = timeFormat.parse(classGroup.startTime);

//       // Combine the class start time with the selected date
//       DateTime classStartDateTime = DateTime(
//         selectedDate.year,
//         selectedDate.month,
//         selectedDate.day,
//         classStartTime.hour,
//         classStartTime.minute,
//         classStartTime.second,
//       );

//       // Calculate the notification time (10 minutes before the class start time)
//       DateTime notificationTime =
//           classStartDateTime.subtract(const Duration(minutes: 10));

//       // Debugging logs
//       print('Class Start Time: $classStartDateTime');
//       print('Notification Time: $notificationTime');
//       print('Current Time: ${DateTime.now()}');

//       if (notificationTime.isAfter(DateTime.now())) {
//         int notificationId = classGroup.id.hashCode; // Convert ID to int

//         // Check if the notification has already been scheduled
//         if (!scheduledNotifications.contains(notificationId)) {
//           scheduledNotifications.add(notificationId);

//           // Schedule notification 10 minutes before the class
//           NotificationService.scheduleNotification(
//             notificationId,
//             'Upcoming Class',
//             'Your class ${classGroup.moduleName} is starting at ${classGroup.startTime}',
//             notificationTime,
//           );
//         }
//       } else {
//         print('Notification time is in the past, skipping notification');
//       }
//     }
//   }

//   // Method to get classes for a specific date
//   List<OngoingClassGroup> getClassesForDate(DateTime date) {
//     selectedDate = date;
//     List<OngoingClassGroup> allClasses = routineBox.values.toList();
//     _filterClasses(allClasses);
//     return restClasses;
//   }

//   void setSelectedDate(DateTime date) {
//     selectedDate = date;
//     fetchClasses();
//   }
// }
