import 'package:hive/hive.dart';

part 'routine_model.g.dart';

@HiveType(typeId: 0)
class OngoingClassGroup extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String courseType;

  @HiveField(2)
  String moduleName;

  @HiveField(3)
  String teacherName;

  @HiveField(4)
  String classType;

  @HiveField(5)
  List<String> groups;

  @HiveField(6)
  String roomName;

  @HiveField(7)
  String blockName;

  @HiveField(8)
  String day;

  @HiveField(9)
  String startTime;

  @HiveField(10)
  String endTime;

  @HiveField(11)
  String status;

  @HiveField(12)
  String createdOn;

  @HiveField(13)
  int v;

  OngoingClassGroup({
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
    required this.v,
  });

  // Factory method to create an instance from JSON
  factory OngoingClassGroup.fromJson(Map<String, dynamic> json) {
    return OngoingClassGroup(
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
      v: json['__v'],
    );
  }

  // Override the toString() method to return a readable output
  @override
  String toString() {
    return 'OngoingClassGroup{id: $id, courseType: $courseType, moduleName: $moduleName, '
        'teacherName: $teacherName, classType: $classType, groups: $groups, roomName: $roomName, '
        'blockName: $blockName, day: $day, startTime: $startTime, endTime: $endTime, status: $status}';
  }
}
