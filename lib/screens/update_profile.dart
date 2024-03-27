// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class UpdateProfilePage extends StatefulWidget {
//   final Map<String, dynamic> userData;
//
//   UpdateProfilePage({required this.userData});
//
//   @override
//   _UpdateProfilePageState createState() => _UpdateProfilePageState();
// }
//
// class _UpdateProfilePageState extends State<UpdateProfilePage> {
//   late TextEditingController _nameController;
//   late TextEditingController _schoolNameController;
//   late TextEditingController _otherFieldsController;
//
//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController(text: widget.userData['name']);
//     _schoolNameController = TextEditingController(text: widget.userData['schoolName']);
//     _otherFieldsController = TextEditingController(text: widget.userData['otherFields']);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update Profile'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextFormField(
//               controller: _schoolNameController,
//               decoration: InputDecoration(labelText: 'School Name'),
//             ),
//             // Add more fields here as needed
//             ElevatedButton(
//               onPressed: () {
//                 _updateProfile();
//               },
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _updateProfile() async {
//     try {
//       String newName = _nameController.text;
//       String newSchoolName = _schoolNameController.text;
//       // Get other updated fields similarly
//
//       await FirebaseFirestore.instance.collection('users').doc(widget.userData['userId']).update({
//         'name': newName,
//         'schoolName': newSchoolName,
//         // Update other fields as needed
//       });
//
//       // Return to the profile page after updating
//       Navigator.pop(context, {'name': newName, 'schoolName': newSchoolName, /* Add other fields if needed */});
//     } catch (error) {
//       // Handle errors here
//       print('Failed to update profile: $error');
//     }
//   }
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _schoolNameController.dispose();
//     _otherFieldsController.dispose();
//     super.dispose();
//   }
// }


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class UpdateProfilePage extends StatefulWidget {
  final Map<String, dynamic> userData;

  const UpdateProfilePage({super.key, required this.userData});

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _schoolNameController;
  late TextEditingController _otherFieldsController;
  File? _image;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userData['name']);
    _schoolNameController = TextEditingController(text: widget.userData['schoolName']);
    _otherFieldsController = TextEditingController(text: widget.userData['otherFields']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _schoolNameController,
              decoration: const InputDecoration(labelText: 'School Name'),
            ),
            // Add more fields here as needed
            ElevatedButton(
              onPressed: () {
                _updateProfile();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateProfile() async {
    try {
      String newName = _nameController.text;
      String newSchoolName = _schoolNameController.text;
      // Get other updated fields similarly

      // Upload image if changed
      String? newImageUrl;
      if (_image != null) {
        newImageUrl = await _uploadProfilePicture();
      }

      await FirebaseFirestore.instance.collection('users').doc(widget.userData['userId']).update({
        'name': newName,
        'schoolName': newSchoolName,
        // Update other fields as needed
        if (newImageUrl != null) 'profilePicture': newImageUrl,
      });

      // Return to the profile page after updating
      Navigator.pop(context);
    } catch (error) {
      // Handle errors here
      print('Failed to update profile: $error');
    }
  }

  Future<String> _uploadProfilePicture() async {
    String fileName = widget.userData['userId'] + '_profile.jpg'; // Unique file name
    Reference storageRef = FirebaseStorage.instance.ref().child('profile_images/$fileName');
    await storageRef.putFile(_image!);
    return storageRef.getDownloadURL();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _schoolNameController.dispose();
    _otherFieldsController.dispose();
    super.dispose();
  }
}
