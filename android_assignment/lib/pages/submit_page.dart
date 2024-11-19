import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:android_assignment/utils/answer_storage.dart';

class SubmitPage extends StatelessWidget {
  final Map<String, dynamic> answers;

  SubmitPage({required this.answers});

  void _submitAnswers(BuildContext context) async {
    // Adding the current time to answers
    answers["submit_time"] =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    // Save answers to local storage
    await AnswerStorage.saveAnswers(answers);

    // Navigate to results page
    Navigator.pushNamed(context, '/results');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Submit")),
      body: Center(
        child: ElevatedButton(
          child: Text("Submit"),
          onPressed: () => _submitAnswers(context),
        ),
      ),
    );
  }
}
