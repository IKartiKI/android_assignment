// lib/pages/submission_page.dart

import 'package:flutter/material.dart';

class SubmissionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Submit Form")),
      body: Center(
        child: ElevatedButton(
          child: Text("Submit"),
          onPressed: () {
            Navigator.pushNamed(context, '/result');
          },
        ),
      ),
    );
  }
}
