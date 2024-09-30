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
    final start = DateFormat("HH:mm:ss").parse(json['startTime']);
    final end = DateFormat("HH:mm:ss").parse(json['endTime']);
    final classDuration = end.difference(start);

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
      duration: classDuration,
    );
  }

  // New factory method to parse Hive-stored objects directly
  factory ClassModel.fromHive(dynamic e) {
    final start = DateFormat("HH:mm:ss").parse(e.startTime);
    final end = DateFormat("HH:mm:ss").parse(e.endTime);
    final classDuration = end.difference(start);

    return ClassModel(
      id: e.id,
      courseType: e.courseType,
      moduleName: e.moduleName,
      teacherName: e.teacherName,
      classType: e.classType,
      groups: List<String>.from(e.groups),
      roomName: e.roomName,
      blockName: e.blockName,
      day: e.day,
      startTime: e.startTime,
      endTime: e.endTime,
      status: e.status,
      createdOn: e.createdOn ?? "",  // Handle missing createdOn
      duration: classDuration,
    );
  }

  // Helper method to format the duration as a string (hours and minutes)
  String getFormattedDuration() {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '${hours}h ${minutes}m';
  }
}