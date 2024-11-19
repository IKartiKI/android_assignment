import 'dart:io';
import 'package:flutter/material.dart';

import '../utils/audio_player_widget.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String imagePath = 'path/to/saved/image.png'; // Replace with actual path
  String audioPath = 'path/to/saved/audio.wav'; // Replace with actual path

  Future<Map<String, dynamic>> loadResults() async {
    await Future.delayed(Duration(seconds: 1));

    // Simulate results
    return {
      "Q1": 2,
      "Q2": 25,
      "Q3": imagePath,
      "recordedAudio": audioPath,
      "gps": "26.12323,86.23235",
      "submitTime": "2023-07-04 18:30:45"
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Submission Results')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: loadResults(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error loading results: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No results available.'));
          }

          final resultData = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Results submitted successfully!'),
                SizedBox(height: 16),
                Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(
                      children: [
                        Text('Q1'),
                        Text('Q2'),
                        Text('Q3'),
                        Text('RecordedAudio'),
                        Text('GPS'),
                        Text('SubmissionTime'),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(resultData["Q1"].toString()),
                        Text(resultData["Q2"].toString()),
                        Image.file(File(resultData["Q3"])),
                        AudioPlayerWidget(
                          resultData["recordedAudio"],
                          audioPath: '',
                        ),
                        Text(resultData["gps"]),
                        Text(resultData["submitTime"]),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
