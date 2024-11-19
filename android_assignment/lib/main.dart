// lib/main.dart

import 'package:flutter/material.dart';
import 'pages/gender_selection.dart';
import 'pages/age_input.dart';
import 'pages/selfie_page.dart';
import 'pages/submission_page.dart';
import 'pages/result_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Form App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Define named routes for each page
      initialRoute: '/gender',
      routes: {
        '/gender': (context) => GenderSelectionPage(),
        '/age': (context) => AgeInputPage(),
        '/selfie': (context) => SelfiePage(),
        '/submit': (context) => SubmissionPage(),
        '/result': (context) => ResultPage(),
      },
    );
  }
}
