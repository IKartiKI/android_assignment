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
      print("Using file path: $path"); // Debug: Log the file path
      return path;
    } catch (e) {
      print("Error getting file path: $e"); // Debug: Log any path errors
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

      print("Saving answers: $answers"); // Debug: Log answers before saving

      await file.writeAsString(jsonEncode(answers));
      print("Answers successfully saved at $path"); // Debug: Confirm save
    } catch (e) {
      print("Error saving answers: $e"); // Debug: Log any error during save
    }
  }

  static Future<Map<String, dynamic>> loadAnswers() async {
    try {
      final path = await _getFilePath();
      if (path.isEmpty) {
        print(
            "File path is empty, cannot load answers."); // Check if path retrieval failed
        return {};
      }
      final file = File(path);

      // Check if the file exists
      if (await file.exists()) {
        final contents = await file.readAsString();
        final data = jsonDecode(contents);
        print("Loaded data from file: $data"); // Debug: Log loaded data
        return data;
      } else {
        print("File not found at $path"); // Debug: Log if file does not exist
        return {}; // Returning empty map if file does not exist
      }
    } catch (e) {
      print("Error loading answers: $e"); // Debug: Log any error during load
      return {}; // Returning empty map on error
    }
  }
}
