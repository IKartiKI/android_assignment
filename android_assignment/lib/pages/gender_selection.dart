// lib/pages/gender_selection_page.dart

import 'package:flutter/material.dart';

class GenderSelectionPage extends StatefulWidget {
  @override
  _GenderSelectionPageState createState() => _GenderSelectionPageState();
}

class _GenderSelectionPageState extends State<GenderSelectionPage> {
  int? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Gender")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<int>(
              hint: Text("Select Gender"),
              value: selectedGender,
              items: [
                DropdownMenuItem(value: 1, child: Text("Male")),
                DropdownMenuItem(value: 2, child: Text("Female")),
                DropdownMenuItem(value: 3, child: Text("Other")),
              ],
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
            ElevatedButton(
              child: Text("Next"),
              onPressed: () {
                Navigator.pushNamed(context, '/age');
              },
            ),
          ],
        ),
      ),
    );
  }
}
