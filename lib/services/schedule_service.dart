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
    } catch (e) {
    } finally {
      isLoading(false); // Stop loading after data is fetched
    }
  }

  // Method to get classes for a specific day
  List<ClassModel> getClassesForDay(String day) {
    return classes.where((classItem) {
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
        .format(DateTime.now().subtract(const Duration(days: 1)));
  }

  // Get tomorrow's date label
  String getTomorrow() {
    return DateFormat('EEEE').format(DateTime.now().add(const Duration(days: 1)));
  }

  // Get list of upcoming days starting after tomorrow
  List<String> getDaysAfterTomorrow() {
    return List.generate(5, (index) {
      return DateFormat('EEEE')
          .format(DateTime.now().add(Duration(days: index + 2)));
    });
  }
}
