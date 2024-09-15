import 'dart:convert';
import 'package:hck_app/models/routine_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// Function to fetch data from the API with an access token
Future<List<OngoingClassGroup>> fetchOngoingClasses() async {
  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString('accessToken');
  final group = prefs.getString('group');
  // Define the API endpoint
  final url =
      Uri.parse('http://localhost:9999/api/v4/routines/ongoing?group=$group');

  // Make the GET request and include the token in the headers
  final response = await http.get(
    url,
    headers: {
      'Authorization':
          'Bearer $accessToken', // Send the token in the Authorization header
      'Content-Type': 'application/json', // Add this if the API expects JSON
    },
  );

  if (response.statusCode == 200) {
    // Decode the JSON response
    Map<String, dynamic> jsonData = json.decode(response.body);

    // Get the list of ongoing classes
    List<dynamic> classList = jsonData['ongoingClassGroup/s'];

    // Parse the list of classes into a List of OngoingClassGroup
    return classList
        .map((classData) => OngoingClassGroup.fromJson(classData))
        .toList();
  } else {
    throw Exception('Failed to load ongoing classes');
  }
}
