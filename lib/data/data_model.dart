class CollegeClass {
  String studentName;
  String className;
  List<ClassDetails> dailyClasses;
  List<String> extraEvents;
  String emailId;
  List<ProgramDetails> programDetails;
  List<Notification> notifications;

  CollegeClass({
    required this.studentName,
    required this.className,
    required this.dailyClasses,
    required this.extraEvents,
    required this.emailId,
    required this.programDetails,
    required this.notifications,
  });

  factory CollegeClass.fromJson(Map<String, dynamic> json) {
    List<dynamic> programs = json['programDetails'];
    List<ProgramDetails> programDetails = programs
        .map((programJson) => ProgramDetails.fromJson(programJson))
        .toList();

    List<dynamic> classes = json['dailyClasses'];
    List<ClassDetails> dailyClasses =
        classes.map((classJson) => ClassDetails.fromJson(classJson)).toList();

    List<dynamic> notificationsJson = json['notifications'];
    List<Notification> notifications = notificationsJson
        .map((notificationJson) => Notification.fromJson(notificationJson))
        .toList();

    return CollegeClass(
      studentName: json['studentName'],
      className: json['className'],
      dailyClasses: dailyClasses,
      extraEvents: List<String>.from(json['extraEvents']),
      emailId: json['emailId'],
      programDetails: programDetails,
      notifications: notifications,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['studentName'] = this.studentName;
    data['className'] = this.className;
    data['dailyClasses'] =
        this.dailyClasses.map((classDetail) => classDetail.toJson()).toList();
    data['extraEvents'] = this.extraEvents;
    data['emailId'] = this.emailId;
    data['programDetails'] =
        this.programDetails.map((program) => program.toJson()).toList();
    data['notifications'] = this
        .notifications
        .map((notification) => notification.toJson())
        .toList();
    return data;
  }
}

class ClassDetails {
  String className;
  String startTime;
  String endTime;
  String venue;
  String teacherName;

  ClassDetails({
    required this.className,
    required this.startTime,
    required this.endTime,
    required this.venue,
    required this.teacherName,
  });

  factory ClassDetails.fromJson(Map<String, dynamic> json) {
    return ClassDetails(
      className: json['className'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      venue: json['venue'],
      teacherName: json['teacherName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['className'] = this.className;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['venue'] = this.venue;
    data['teacherName'] = this.teacherName;
    return data;
  }
}

class ProgramDetails {
  String programName;
  List<String> subjectList;
  int creditHours;

  ProgramDetails({
    required this.programName,
    required this.subjectList,
    required this.creditHours,
  });

  factory ProgramDetails.fromJson(Map<String, dynamic> json) {
    return ProgramDetails(
      programName: json['programName'],
      subjectList: List<String>.from(json['subjectList']),
      creditHours: json['creditHours'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['programName'] = this.programName;
    data['subjectList'] = this.subjectList;
    data['creditHours'] = this.creditHours;
    return data;
  }
}

class Notification {
  String title;
  String description;

  Notification({
    required this.title,
    required this.description,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
