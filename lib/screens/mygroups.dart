import 'package:flutter/material.dart';

class MyGroupsPage extends StatelessWidget {
  const MyGroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Groups'),
      ),
      body: const Center(
        child: Text('This is the My Groups Page!'),
      ),
    );
  }
}
