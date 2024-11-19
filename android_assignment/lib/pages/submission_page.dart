// lib/pages/submission_page.dart

import 'package:flutter/material.dart';

class SubmissionPage extends StatelessWidget {
  // Include methods to stop recording, fetch location, and save data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Submit Form")),
      body: Center(
        child: ElevatedButton(
          child: Text("Submit"),
          onPressed: () {
            // Perform all submission logic here, including saving JSON data
            Navigator.pushNamed(context, '/result');
          },
        ),
      ),
    );
  }
}
