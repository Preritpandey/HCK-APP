import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hck_app/models/internship_model.dart';

class JobService {
  static const String apiUrl =
      'http://localhost:8888/api/jobs'; // API from recruitment portal backend.This is not connected to main backend of application.

  Future<List<Job>> fetchJobs() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      List<Job> jobs = (responseData['data'] as List)
          .map((jobData) => Job.fromJson(jobData))
          .toList();
      return jobs;
    } else {
      throw Exception('Failed to load jobs');
    }
  }
}
