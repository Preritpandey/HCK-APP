import 'package:intl/intl.dart';

class ClassModel {
  String id;
  String courseType;
  String moduleName;
  String teacherName;
  String classType;
  List<String> groups;
  String roomName;
  String blockName;
  String day;
  String startTime;
  String endTime;
  String status;
  String createdOn;
  Duration duration;  // Add duration as a Duration object

  // Constructor including the duration calculation
  ClassModel({
    required this.id,
    required this.courseType,
    required this.moduleName,
    required this.teacherName,
    required this.classType,
    required this.groups,
    required this.roomName,
    required this.blockName,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.createdOn,
    required this.duration,
  });

  // Factory method to parse JSON and calculate the class duration
  factory ClassModel.fromJson(Map<String, dynamic> json) {
    // Parse startTime and endTime to calculate the duration
    final start = DateFormat("HH:mm:ss").parse(json['startTime']);
    final end = DateFormat("HH:mm:ss").parse(json['endTime']);
    final classDuration = end.difference(start);  // Calculate the difference as a Duration object

    return ClassModel(
      id: json['_id'],
      courseType: json['courseType'],
      moduleName: json['moduleName'],
      teacherName: json['teacherName'],
      classType: json['classType'],
      groups: List<String>.from(json['groups']),
      roomName: json['roomName'],
      blockName: json['blockName'],
      day: json['day'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      status: json['status'],
      createdOn: json['createdOn'],
      duration: classDuration,  // Store the calculated duration directly
    );
  }

  // Helper method to format the duration as a string (hours and minutes)
  String getFormattedDuration() {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '${hours}h ${minutes}m';
  }
}



// class ClassModel {
//   final String id;
//   final String courseType;
//   final String moduleName;
//   final String teacherName;
//   final String classType;
//   final List<String> groups;
//   final String roomName;
//   final String blockName;
//   final String day;
//   final String startTime;
//   final String endTime;
//   final String status;
//   final String createdOn;

//   ClassModel({
//     required this.id,
//     required this.courseType,
//     required this.moduleName,
//     required this.teacherName,
//     required this.classType,
//     required this.groups,
//     required this.roomName,
//     required this.blockName,
//     required this.day,
//     required this.startTime,
//     required this.endTime,
//     required this.status,
//     required this.createdOn,
//   });

//   factory ClassModel.fromJson(Map<String, dynamic> json) {
//     return ClassModel(
//       id: json['_id'],
//       courseType: json['courseType'],
//       moduleName: json['moduleName'],
//       teacherName: json['teacherName'],
//       classType: json['classType'],
//       groups: List<String>.from(json['groups']),
//       roomName: json['roomName'],
//       blockName: json['blockName'],
//       day: json['day'],
//       startTime: json['startTime'],
//       endTime: json['endTime'],
//       status: json['status'],
//       createdOn: json['createdOn'],
//     );
//   }
// }
