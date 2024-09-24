import 'package:get/get.dart';
import 'package:hck_app/models/schedule_model.dart';
import 'package:hck_app/resources/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ClassController extends GetxController {
  RxList<ClassModel> classes = <ClassModel>[].obs; // Observable list of classes
  RxBool isLoading = true.obs; // Loading state indicator

  @override
  void onInit() {
    super.onInit();
    fetchClasses(); // Fetch classes when the controller is initialized
  }

  // Fetch classes from the API
  Future<void> fetchClasses() async {
    isLoading(true);
    try {
      final prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString('accessToken');
      final group = prefs.getString('group');

      // Ensure group and accessToken are not null
      if (accessToken == null || group == null) {
        print('Error: Missing accessToken or group.');
        return;
      }

      // API request to fetch ongoing classes
      final response = await http.get(
        Uri.parse('${API.getRoutineUrl}$group'),
        headers: {
          'Authorization': 'Bearer $accessToken', // Token for authentication
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(
            response.body)['ongoingClassGroup/s']; // Fix the key name here
        classes.value = data
            .map((e) => ClassModel.fromJson(e))
            .toList(); // Parse data into ClassModel
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading(false); // Stop loading after data is fetched
    }
  }

  // Method to get classes for a specific day
  List<ClassModel> getClassesForDay(String day) {
    return classes.where((classItem) {
      // Ensure both comparison strings are case-insensitive
      return classItem.day.toLowerCase() == day.toLowerCase();
    }).toList();
  }

// Get today's date label
  String getToday() {
    return DateFormat('EEEE').format(DateTime.now());
  }

  // Get yesterday's date label
  String getYesterday() {
    return DateFormat('EEEE')
        .format(DateTime.now().subtract(Duration(days: 1)));
  }

  // Get tomorrow's date label
  String getTomorrow() {
    return DateFormat('EEEE').format(DateTime.now().add(Duration(days: 1)));
  }

  // Get list of upcoming days starting after tomorrow
  List<String> getDaysAfterTomorrow() {
    return List.generate(5, (index) {
      return DateFormat('EEEE')
          .format(DateTime.now().add(Duration(days: index + 2)));
    });
  }
}
