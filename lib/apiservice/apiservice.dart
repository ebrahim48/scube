import 'dart:convert';

import '../model/model.dart';
import 'package:http/http.dart' as http;
class ProjectService {
  static const String baseUrl = 'https://scubetech.xyz/projects/dashboard';

  static Future<List<Project>> fetchAllProjects() async {
    final response = await http.get(Uri.parse('$baseUrl/all-project-elements/'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Project.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load projects');
    }
  }

  static Future<void> addProject(Project project) async {
    final response = await http.post(Uri.parse('$baseUrl/add-project-elements/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(project.toJson()));
    if (response.statusCode != 200) {
      throw Exception('Failed to add project');
    }
  }

  static Future<void> updateProject(String id, Project project) async {
    final response = await http.put(Uri.parse('$baseUrl/update-project-elements/$id/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(project.toJson()));
    if (response.statusCode != 200) {
      throw Exception('Failed to update project');
    }
  }
}