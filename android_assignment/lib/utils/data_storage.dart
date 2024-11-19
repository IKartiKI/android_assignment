// lib/utils/data_storage.dart

import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DataStorage {
  // Get path for JSON storage
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Get file for JSON storage
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/form_data.json');
  }

  // Save form data to a JSON file
  Future<void> saveFormData(Map<String, dynamic> formData) async {
    final file = await _localFile;
    String jsonString = jsonEncode(formData);
    await file.writeAsString(jsonString);
  }

  // Read form data from JSON file
  Future<Map<String, dynamic>?> readFormData() async {
    try {
      final file = await _localFile;
      if (await file.exists()) {
        String jsonString = await file.readAsString();
        return jsonDecode(jsonString);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
