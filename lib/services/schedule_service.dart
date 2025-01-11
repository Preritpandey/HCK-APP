import 'package:get/get.dart';
import 'package:hck_app/services/routine_service.dart';
import 'package:hck_app/models/schedule_model.dart';
import 'package:intl/intl.dart';

class ClassController extends GetxController {
  RxList<ClassModel> classes = <ClassModel>[].obs; // Observable list of classes
  RxBool isLoading = true.obs; // Loading state indicator
  RoutineController routineController = Get.put(RoutineController());

  @override
  void onInit() {
    super.onInit();
    fetchClasses(); // Fetch classes when the controller is initialized
  }

  // Fetch classes from the routineBox (Hive) and convert them to ClassModel
  Future<void> fetchClasses() async {
    isLoading(true);
    try {
      // Fetch the stored data from routineBox (Hive)
      List<dynamic> storedClasses =
          routineController.routineBox.values.toList();

      // Directly map Hive-stored objects to ClassModel using fromHive factory method
      classes.value = storedClasses.map((e) => ClassModel.fromHive(e)).toList();
    } catch (e)  {
    } finally {
      isLoading(false); // Stop loading after data is fetched
    }
  }

  List<ClassModel> getClassesForDay(String dayOrDate) {
    // Convert date (if passed) into a day name to ensure comparison works
    try {
      // Check if the input is a valid date (dd/MM/yyyy format)
      DateTime? parsedDate;
      if (dayOrDate.contains('/')) {
        parsedDate = DateFormat('dd/MM/yyyy').parse(dayOrDate);
      }

      // If a valid date is parsed, convert it to the day name (e.g., "Monday")
      if (parsedDate != null) {
        dayOrDate = DateFormat('EEEE').format(parsedDate);
      }

      // Now compare the day name (case-insensitive)
      return classes.where((classItem) {
        return classItem.day.toLowerCase() == dayOrDate.toLowerCase();
      }).toList();
    } catch (e) {
      // Handle any errors
      print('Error parsing date or fetching classes: $e');
      return [];
    }
  }

  // Get today's date label
  String getToday() {
    return DateFormat('EEEE').format(DateTime.now());
  }

  // Get yesterday's date label
  String getYesterday() {
    return DateFormat('EEEE')
        .format(DateTime.now().subtract(const Duration(days: 1)));
  }

  // Get tomorrow's date label
  String getTomorrow() {
    return DateFormat('EEEE')
        .format(DateTime.now().add(const Duration(days: 1)));
  }

  List<String> getDatesAfterTomorrow() {
    return List.generate(5, (index) {
      return DateFormat('dd/MM/yyyy')
          .format(DateTime.now().add(Duration(days: index + 2)));
    });
  }
}
