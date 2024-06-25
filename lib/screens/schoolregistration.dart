import 'package:flutter/material.dart';

class SchoolRegisterPage extends StatefulWidget {
  const SchoolRegisterPage({super.key});

  @override
  _SchoolRegisterPageState createState() => _SchoolRegisterPageState();
}

class _SchoolRegisterPageState extends State<SchoolRegisterPage> {
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  List<Teacher> teachers = [];

  void _registerSchool() {
    // Implement school registration logic here
    // You can use the values from the controllers and the teachers list to register the school
    // For example, print the school name, location, and teachers for demonstration purposes
    print('School Name: ${schoolNameController.text}');
    print('Location: ${locationController.text}');
    print('Teachers:');
    for (var teacher in teachers) {
      print('  ${teacher.name}, ${teacher.email}');
    }
  }

  void _addTeacher() {
    // Open a dialog to add a new teacher
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController teacherNameController = TextEditingController();
        TextEditingController teacherEmailController = TextEditingController();

        return AlertDialog(
          title: const Text('Add Teacher'),
          content: Column(
            children: [
              TextField(controller: teacherNameController, decoration: const InputDecoration(labelText: 'Teacher Name')),
              TextField(controller: teacherEmailController, decoration: const InputDecoration(labelText: 'Teacher Email')),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add the new teacher to the list
                setState(() {
                  teachers.add(Teacher(
                    name: teacherNameController.text,
                    email: teacherEmailController.text,
                  ));
                });
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: schoolNameController, decoration: const InputDecoration(labelText: 'School Name')),
            TextField(controller: locationController, decoration: const InputDecoration(labelText: 'Location')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addTeacher,
              child: const Text('Add Teacher'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registerSchool,
              child: const Text('Register School'),
            ),
          ],
        ),
      ),
    );
  }
}

class Teacher {
  final String name;
  final String email;

  Teacher({required this.name, required this.email});
}
