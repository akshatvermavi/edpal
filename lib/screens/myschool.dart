import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MemberRegistration extends StatefulWidget {
  const MemberRegistration({super.key});

  @override
  _MemberRegistrationState createState() => _MemberRegistrationState();
}

class _MemberRegistrationState extends State<MemberRegistration> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactNumberController =
  TextEditingController();
  final TextEditingController _schoolNameController = TextEditingController();
  final TextEditingController _principalEmailController =
  TextEditingController(); // New controller for principal email
  final TextEditingController _subjectsController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _rollNumberController = TextEditingController();

  bool _isTeacher = false;

  Future<void> _submit() async {
    try {
      // Perform a query to get the school document
      QuerySnapshot schoolSnapshot = await FirebaseFirestore.instance
          .collection('schools')
          .where('schoolName', isEqualTo: _schoolNameController.text)
          .where('principalEmail', isEqualTo: _principalEmailController.text)
          .limit(1)
          .get();

      // Check if the school document exists
      if (schoolSnapshot.docs.isNotEmpty) {
        // Get the schoolId from the retrieved document
        String schoolId = schoolSnapshot.docs[0].id;

        UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _generateRandomPassword(),
        );

        // Create a user document in Firestore under the retrieved schoolId
        await _firestore
            .collection('schools')
            .doc(schoolId)
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'name': _nameController.text,
          'email': _emailController.text,
          'contactNumber': _contactNumberController.text,
          'isTeacher': _isTeacher,
          'principalEmail': _principalEmailController.text,
          if (_isTeacher) 'subjects': _subjectsController.text,
          if (!_isTeacher) 'class': _classController.text,
          if (!_isTeacher) 'rollNumber': _rollNumberController.text,
        });

        // Send email verification
        await userCredential.user!.sendEmailVerification();

        // Show success message or navigate to another screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
            Text('User registered successfully. Verification email sent.'),
          ),
        );
      } else {
        // School not found, handle the case accordingly
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('School not found.'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );
    }
  }

  String _generateRandomPassword() {
    // Logic to generate a random password
    return 'randomPassword'; // Placeholder random password generation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Member Registration'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Are you a Teacher?'),
              value: _isTeacher,
              onChanged: (value) {
                setState(() {
                  _isTeacher = value;
                });
              },
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: _contactNumberController,
                    decoration:
                    const InputDecoration(labelText: 'Contact Number'),
                  ),
                  TextField(
                    controller: _schoolNameController,
                    decoration: const InputDecoration(labelText: 'School Name'),
                  ),
                  TextField(
                    controller: _principalEmailController,
                    decoration:
                    const InputDecoration(labelText: 'Principal Email'), // New field for principal email
                  ),
                  if (_isTeacher)
                    TextField(
                      controller: _subjectsController,
                      decoration: const InputDecoration(
                          labelText: 'Number of Subjects'),
                    ),
                  if (!_isTeacher)
                    TextField(
                      controller: _classController,
                      decoration: const InputDecoration(labelText: 'Class'),
                    ),
                  if (!_isTeacher)
                    TextField(
                      controller: _rollNumberController,
                      decoration:
                      const InputDecoration(labelText: 'Roll Number'),
                    ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

