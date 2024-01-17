import 'package:flutter/material.dart';

class MyApplausesPage extends StatelessWidget {
  const MyApplausesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Applauses'),
      ),
      body: const Center(
        child: Text('This is the My Applauses Page!'),
      ),
    );
  }
}
