class Job {
  final String id;
  final JobCategory jobCategory;
  final String jobTitle;
  final List<String> jobResponsibilities;
  final List<String> jobRequirements;
  final List<String> jobRequiredSkills;
  final List<String> jobWhyUs;
  final String jobType;
  final String applicationDeadline;
  final int salary;
  final String salaryType;
  final String applicantsType;
  final String serviceType;
  final bool saveJob;
  final String datePosted;

  Job({
    required this.id,
    required this.jobCategory,
    required this.jobTitle,
    required this.jobResponsibilities,
    required this.jobRequirements,
    required this.jobRequiredSkills,
    required this.jobWhyUs,
    required this.jobType,
    required this.applicationDeadline,
    required this.salary,
    required this.salaryType,
    required this.applicantsType,
    required this.serviceType,
    required this.saveJob,
    required this.datePosted,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['_id'],
      jobCategory: JobCategory.fromJson(json['jobCategory']),
      jobTitle: json['jobTitle'],
      jobResponsibilities: List<String>.from(json['jobResponsibilities']),
      jobRequirements: List<String>.from(json['jobRequirements']),
      jobRequiredSkills: List<String>.from(json['jobRequiredSkills']),
      jobWhyUs: List<String>.from(json['jobWhyUs']),
      jobType: json['jobType'],
      applicationDeadline: json['applicationDeadline'],
      salary: json['salary'],
      salaryType: json['salaryType'],
      applicantsType: json['applicantsType'],
      serviceType: json['serviceType'],
      saveJob: json['saveJob'],
      datePosted: json['datePosted'],
    );
  }
}

class JobCategory {
  final String id;
  final String name;

  JobCategory({required this.id, required this.name});

  factory JobCategory.fromJson(Map<String, dynamic> json) {
    return JobCategory(
      id: json['_id'],
      name: json['name'],
    );
  }
}
