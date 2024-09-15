// Define the data model
class OngoingClassGroup {
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
}
