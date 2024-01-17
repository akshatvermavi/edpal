import 'package:flutter/material.dart';

class MySchoolPage extends StatelessWidget {
  const MySchoolPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My School'),
      ),
      body: const Center(
        child: Text('This is the My School Page!'),
      ),
    );
  }
}
