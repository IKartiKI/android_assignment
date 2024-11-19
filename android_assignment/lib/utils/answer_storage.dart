// lib/utils/answer_storage.dart

import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class AnswerStorage {
  static get directory => null;

  static Future<String> _getFilePath() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/answers.json';
      print("Using file path: $path");
      return path;
    } catch (e) {
      print("Error getting file path: $e");
      return '';
    }
  }

  static Future<void> saveAnswers(Map<String, dynamic> answers) async {
    try {
      //final path = await _getFilePath();
      final path = '${directory!.path}/answers.json';
      final file = File(path);
      print("Trying to write to: $path");
      if (path.isEmpty) {
        print("File path is empty, aborting save.");
        return;
      }

      print("Saving answers: $answers");

      await file.writeAsString(jsonEncode(answers));
      print("Answers successfully saved at $path");
    } catch (e) {
      print("Error saving answers: $e");
    }
  }

  static Future<Map<String, dynamic>> loadAnswers() async {
    try {
      final path = await _getFilePath();
      if (path.isEmpty) {
        print("File path is empty, cannot load answers.");
        return {};
      }
      final file = File(path);

      // Check if the file exists
      if (await file.exists()) {
        final contents = await file.readAsString();
        final data = jsonDecode(contents);
        print("Loaded data from file: $data");
        return data;
      } else {
        print("File not found at $path");
        return {}; // Returning empty map if file does not exist
      }
    } catch (e) {
      print("Error loading answers: $e");
      return {}; // Returning empty map on error
    }
  }
}
