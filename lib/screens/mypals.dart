import 'package:flutter/material.dart';

class MyPalsPage extends StatelessWidget {
  const MyPalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pals'),
      ),
      body: const Center(
        child: Text('This is the My Pals Page!'),
      ),
    );
  }
}
