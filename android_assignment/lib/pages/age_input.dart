// lib/pages/age_input_page.dart

import 'package:flutter/material.dart';

class AgeInputPage extends StatelessWidget {
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Enter Age")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Enter Age"),
          ),
          ElevatedButton(
            child: Text("Next"),
            onPressed: () {
              if (ageController.text.isNotEmpty) {
                Navigator.pushNamed(context, '/selfie');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Age is required")),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
