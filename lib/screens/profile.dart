//
// import 'package:edpal/screens/login.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'dart:developer';
// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});
//
//
//
//   void logOut() async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.popUntil(context, (route) => route.isFirst);
//     Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => LoginPage()
//     ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//         actions: [
//           OutlinedButton.icon(
//             onPressed: () {
//               logOut();
//             },
//             icon: Icon(Icons.exit_to_app),
//             label: Text("Logout"),
//           ), // Add a closing parenthesis here
//         ],
//       ),
//       body: const Center(
//         child: Text('This is the Profile Page!'),
//       ),
//     );
//   }
// }



// import 'package:edpal/screens/login.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({Key? key});
//
//   void logOut(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.popUntil(context, (route) => route.isFirst);
//     Navigator.pushReplacement(
//       context,
//       CupertinoPageRoute(builder: (context) => LoginPage()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//         actions: [
//           OutlinedButton.icon(
//             onPressed: () {
//               logOut(context); // Pass the context to the logOut method
//             },
//             icon: Icon(Icons.exit_to_app),
//             label: Text("Logout"),
//           ),
//         ],
//       ),
//       body: const Center(
//         child: Text('This is the Profile Page!'),
//       ),
//     );
//   }
// }

// import 'package:edpal/screens/login.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
// class _ProfilePageState extends State<ProfilePage> {
//   // Add state variables for storing user data
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController schoolController = TextEditingController();
//   TextEditingController classController = TextEditingController();
//   TextEditingController regNumberController = TextEditingController();
//
//   // Add a variable to store the selected image file
//   // (you might want to use a package like image_picker for image selection)
//   // File? selectedImage;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Add a widget to display/upload the photo
//             // (You can use the Image.network widget or Image.file widget here)
//
//             // Add text fields for name, email, school, class, and registration number
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: schoolController,
//               decoration: InputDecoration(labelText: 'School'),
//             ),
//             TextField(
//               controller: classController,
//               decoration: InputDecoration(labelText: 'Class'),
//             ),
//             TextField(
//               controller: regNumberController,
//               decoration: InputDecoration(labelText: 'Registration Number'),
//             ),
//
//             // Add a button to submit the form
//             ElevatedButton(
//               onPressed: () {
//                 // Implement the logic to handle the form submission
//                 // You can access the user input using the controllers (e.g., nameController.text)
//               },
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:html';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _schoolNameController = TextEditingController();
//   TextEditingController _classController = TextEditingController();
//   TextEditingController _registrationNumberController = TextEditingController();
//   late String _imagePath;
//
//   Future _getImage() async {
//     final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imagePath = pickedFile.path;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             GestureDetector(
//               onTap: _getImage,
//               child: CircleAvatar(
//                 radius: 60,
//                 backgroundImage: _imagePath != null
//                     ? FileImage(
//                   File(_imagePath),
//                 )
//                     : null,
//                 child: _imagePath == null
//                     ? Icon(
//                   Icons.camera_alt,
//                   size: 40,
//                 )
//                     : null,
//               ),
//             ),
//             SizedBox(height: 20),
//             _buildTextField("Username", _usernameController),
//             _buildTextField("Email", _emailController),
//             _buildTextField("School Name", _schoolNameController),
//             _buildTextField("Class", _classController),
//             _buildTextField("Registration Number", _registrationNumberController),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement your submit logic here
//                 // You can access the entered data using _usernameController.text, _emailController.text, etc.
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(String label, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }


// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _schoolNameController = TextEditingController();
//   TextEditingController _classController = TextEditingController();
//   TextEditingController _registrationNumberController = TextEditingController();
//   late File _imageFile;
//
//   Future _getImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imageFile = File(pickedFile.path);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             GestureDetector(
//               onTap: _getImage,
//               child: CircleAvatar(
//                 radius: 60,
//                 backgroundImage: _imageFile != null ? FileImage(_imageFile) : null,
//                 child: _imageFile == null
//                     ? Icon(
//                   Icons.camera_alt,
//                   size: 40,
//                 )
//                     : null,
//               ),
//             ),
//             SizedBox(height: 20),
//             _buildTextField("Username", _usernameController),
//             _buildTextField("Email", _emailController),
//             _buildTextField("School Name", _schoolNameController),
//             _buildTextField("Class", _classController),
//             _buildTextField("Registration Number", _registrationNumberController),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement your submit logic here
//                 // You can access the entered data using _usernameController.text, _emailController.text, etc.
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(String label, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }


// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   TextEditingController _schoolNameController = TextEditingController();
//   TextEditingController _studentNameController = TextEditingController();
//   TextEditingController _classController = TextEditingController();
//   TextEditingController _registrationNumberController = TextEditingController();
//   // late File _imageFile;
//   File? _imageFile;
//
//
//   bool _isEditing = false;
//
//   Future _getImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imageFile = File(pickedFile.path);
//       }
//     });
//   }
//
//   void _toggleEditing() {
//     setState(() {
//       _isEditing = !_isEditing;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(_isEditing ? Icons.save : Icons.edit),
//             onPressed: () {
//               if (_isEditing) {
//                 // Save the edited profile information
//                 // You can access the entered data using _schoolNameController.text, _studentNameController.text, etc.
//                 // Perform your save logic here
//               }
//               _toggleEditing();
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             GestureDetector(
//               onTap: _isEditing ? _getImage : null,
//               child: CircleAvatar(
//                 radius: 60,
//                 backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
//                 child: _imageFile == null
//                     ? Icon(
//                   Icons.camera_alt,
//                   size: 40,
//                 )
//                     : null,
//               ),
//             ),
//             SizedBox(height: 20),
//             _buildEditableField("School Name", _schoolNameController),
//             _buildEditableField("Student Name", _studentNameController),
//             _buildEditableField("Class", _classController),
//             _buildEditableField("Registration Number", _registrationNumberController),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildEditableField(String label, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         controller: controller,
//         enabled: _isEditing,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:io';
// import 'package:edpal/screens/login.dart';
// import 'package:edpal/screens/auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:image_picker/image_picker.dart';
// import 'user_data.dart';
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);
//
//
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   void logOut(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.popUntil(context, (route) => route.isFirst);
//     Navigator.pushReplacement(
//       context,
//       CupertinoPageRoute(builder: (context) =>LoginPage()),
//     );
//   }
//   TextEditingController _schoolNameController = TextEditingController();
//   TextEditingController _studentNameController = TextEditingController();
//   TextEditingController _classController = TextEditingController();
//   TextEditingController _registrationNumberController = TextEditingController();
//   File? _imageFile;
//   bool _isEditing = false;
//
//   Future _getImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imageFile = File(pickedFile.path);
//       }
//     });
//   }
//
//   void _toggleEditing() {
//     setState(() {
//       _isEditing = !_isEditing;
//     });
//   }
//
//   void _saveChanges() {
//     // Save the edited profile information
//     // You can access the entered data using _schoolNameController.text, _studentNameController.text, etc.
//     // Perform your save logic here
//     _toggleEditing(); // Toggle back to non-editing mode after saving
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//         actions: [
//           _isEditing
//               ? IconButton(
//             icon: Icon(Icons.save),
//             onPressed: _saveChanges,
//           )
//               : IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: _toggleEditing,
//           ),
//               OutlinedButton.icon(
//                       onPressed: () {
//               logOut(context); // Pass the context to the logOut method
//                       //  _submit();
//             },
//             icon: Icon(Icons.exit_to_app),
//             label: Text("Logout"),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             GestureDetector(
//               onTap: _isEditing ? _getImage : null,
//               child: CircleAvatar(
//                 radius: 60,
//                 backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
//                 child: _imageFile == null
//                     ? Icon(
//                   Icons.camera_alt,
//                   size: 40,
//                 )
//                     : null,
//               ),
//             ),
//             SizedBox(height: 20),
//             _buildEditableField("School Name", _schoolNameController),
//             _buildEditableField("Student Name", _studentNameController),
//             _buildEditableField("Class", _classController),
//             _buildEditableField("Registration Number", _registrationNumberController),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildEditableField(String label, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         controller: controller,
//         enabled: _isEditing,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }
//


// import 'dart:io';
// import 'package:edpal/screens/login.dart';
// import 'package:edpal/screens/auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:image_picker/image_picker.dart';
// import '../models/user_data_model.dart';
// import 'user_data.dart';
// class ProfilePage extends StatefulWidget {
//   final UserData userData;
//
//   const ProfilePage({Key? key, required this.userData}) : super(key: key);
//
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   void logOut(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.popUntil(context, (route) => route.isFirst);
//     Navigator.pushReplacement(
//       context,
//       CupertinoPageRoute(builder: (context) => LoginPage()),
//     );
//   }
//
//   TextEditingController _schoolNameController = TextEditingController();
//   TextEditingController _studentNameController = TextEditingController();
//   TextEditingController _classController = TextEditingController();
//   TextEditingController _registrationNumberController = TextEditingController();
//   File? _imageFile;
//   bool _isEditing = false;
//
//   Future _getImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imageFile = File(pickedFile.path);
//       }
//     });
//   }
//
//   void _toggleEditing() {
//     setState(() {
//       _isEditing = !_isEditing;
//     });
//   }
//
//   void _saveChanges() {
//     // Save the edited profile information
//     // You can access the entered data using _schoolNameController.text, _studentNameController.text, etc.
//     // Perform your save logic here
//     _toggleEditing(); // Toggle back to non-editing mode after saving
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize controllers with user data
//     _schoolNameController.text = widget.userData.school;
//     _studentNameController.text = widget.userData.name;
//     _classController.text = widget.userData.studentClass; // Updated property name
//     _registrationNumberController.text = widget.userData.registrationNumber;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//         actions: [
//           _isEditing
//               ? IconButton(
//             icon: Icon(Icons.save),
//             onPressed: _saveChanges,
//           )
//               : IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: _toggleEditing,
//           ),
//           OutlinedButton.icon(
//             onPressed: () {
//               logOut(context); // Pass the context to the logOut method
//               //  _submit();
//             },
//             icon: Icon(Icons.exit_to_app),
//             label: Text("Logout"),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             Stack(
//               alignment: Alignment.bottomCenter,
//               children: [
//                 Container(
//                   height: 200,
//                   width: double.infinity,
//                   color: Colors.blue, // Use this as a placeholder background color
//                   child: _imageFile != null
//                       ? Image.file(
//                     _imageFile!,
//                     fit: BoxFit.cover,
//                   )
//                       : null,
//                 ),
//                 GestureDetector(
//                   onTap: _isEditing ? _getImage : null,
//                   child: CircleAvatar(
//                     radius: 60,
//                     backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
//                     child: _imageFile == null
//                         ? Icon(
//                       Icons.camera_alt,
//                       size: 40,
//                     )
//                         : null,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             _buildEditableField("School Name", _schoolNameController),
//             _buildEditableField("Student Name", _studentNameController),
//             _buildEditableField("Class", _classController),
//             _buildEditableField("Registration Number", _registrationNumberController),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildEditableField(String label, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         controller: controller,
//         enabled: _isEditing,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:io';
// import 'package:edpal/screens/login.dart';
// import 'package:edpal/screens/auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:image_picker/image_picker.dart';
// import 'user_data.dart'; // Assuming you have your UserData class defined here
//
// class ProfilePage extends StatefulWidget {
//   final UserData? userData; // Make userData optional by adding '?'
//
//   const ProfilePage({Key? key, this.userData}) : super(key: key); // Make userData optional
//
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   void logOut(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.popUntil(context, (route) => route.isFirst);
//     Navigator.pushReplacement(
//       context,
//       CupertinoPageRoute(builder: (context) => LoginPage()),
//     );
//   }
//
//   TextEditingController _schoolNameController = TextEditingController();
//   TextEditingController _studentNameController = TextEditingController();
//   TextEditingController _classController = TextEditingController();
//   TextEditingController _registrationNumberController = TextEditingController();
//   File? _imageFile;
//   bool _isEditing = false;
//
//   Future _getImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imageFile = File(pickedFile.path);
//       }
//     });
//   }
//
//   void _toggleEditing() {
//     setState(() {
//       _isEditing = !_isEditing;
//     });
//   }
//
//   void _saveChanges() {
//     // Save the edited profile information
//     // You can access the entered data using _schoolNameController.text, _studentNameController.text, etc.
//     // Perform your save logic here
//     _toggleEditing(); // Toggle back to non-editing mode after saving
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize controllers with user data
//     _schoolNameController.text = widget.userData!.school;
//     _studentNameController.text = widget.userData!.name;
//     _classController.text = widget.userData!.studentClass!; // Updated property name
//     _registrationNumberController.text = widget.userData!.registrationNumber;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//         actions: [
//           _isEditing
//               ? IconButton(
//             icon: Icon(Icons.save),
//             onPressed: _saveChanges,
//           )
//               : IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: _toggleEditing,
//           ),
//           OutlinedButton.icon(
//             onPressed: () {
//               logOut(context); // Pass the context to the logOut method
//               //  _submit();
//             },
//             icon: Icon(Icons.exit_to_app),
//             label: Text("Logout"),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             Stack(
//               alignment: Alignment.bottomCenter,
//               children: [
//                 Container(
//                   height: 200,
//                   width: double.infinity,
//                   color: Colors.blue, // Use this as a placeholder background color
//                   child: _imageFile != null
//                       ? Image.file(
//                     _imageFile!,
//                     fit: BoxFit.cover,
//                   )
//                       : null,
//                 ),
//                 GestureDetector(
//                   onTap: _isEditing ? _getImage : null,
//                   child: CircleAvatar(
//                     radius: 60,
//                     backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
//                     child: _imageFile == null
//                         ? Icon(
//                       Icons.camera_alt,
//                       size: 40,
//                     )
//                         : null,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             _buildEditableField("School Name", _schoolNameController),
//             _buildEditableField("Student Name", _studentNameController),
//             _buildEditableField("Class", _classController),
//             _buildEditableField("Registration Number", _registrationNumberController),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildEditableField(String label, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         controller: controller,
//         enabled: _isEditing,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }

//
// import 'dart:io';
// import 'package:edpal/screens/login.dart';
// import 'package:edpal/screens/auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:image_picker/image_picker.dart';
// import 'user_data.dart'; // Assuming you have your UserData class defined here
//
// class ProfilePage extends StatefulWidget {
//   final UserData? userData; // Make userData optional by adding '?'
//
//   const ProfilePage({Key? key, this.userData}) : super(key: key); // Make userData optional
//
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   TextEditingController _schoolNameController = TextEditingController();
//   TextEditingController _studentNameController = TextEditingController();
//   TextEditingController _classController = TextEditingController();
//   TextEditingController _registrationNumberController = TextEditingController();
//   File? _imageFile;
//   bool _isEditing = false;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize controllers with user data if available
//     if (widget.userData != null) {
//       _schoolNameController.text = widget.userData!.school;
//       _studentNameController.text = widget.userData!.name;
//       _classController.text = widget.userData!.studentClass ?? ''; // Updated property name
//       _registrationNumberController.text = widget.userData!.registrationNumber;
//     }
//   }
//
//   Future<void> _getImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = File(pickedFile.path);
//       });
//     }
//   }
//
//   void _toggleEditing() {
//     setState(() {
//       _isEditing = !_isEditing;
//     });
//   }
//
//   void _saveChanges() {
//     // Save the edited profile information
//     // You can access the entered data using _schoolNameController.text, _studentNameController.text, etc.
//     // Perform your save logic here
//     _toggleEditing(); // Toggle back to non-editing mode after saving
//   }
//
//   void _logOut(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.popUntil(context, (route) => route.isFirst);
//     Navigator.pushReplacement(
//       context,
//       CupertinoPageRoute(builder: (context) => LoginPage()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//         actions: [
//           _isEditing
//               ? IconButton(
//             icon: Icon(Icons.save),
//             onPressed: _saveChanges,
//           )
//               : IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: _toggleEditing,
//           ),
//           OutlinedButton.icon(
//             onPressed: () => _logOut(context),
//             icon: Icon(Icons.exit_to_app),
//             label: Text("Logout"),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             Stack(
//               alignment: Alignment.bottomCenter,
//               children: [
//                 Container(
//                   height: 200,
//                   width: double.infinity,
//                   color: Colors.blue, // Use this as a placeholder background color
//                   child: _imageFile != null
//                       ? Image.file(
//                     _imageFile!,
//                     fit: BoxFit.cover,
//                   )
//                       : null,
//                 ),
//                 GestureDetector(
//                   onTap: _isEditing ? _getImage : null,
//                   child: CircleAvatar(
//                     radius: 60,
//                     backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
//                     child: _imageFile == null
//                         ? Icon(
//                       Icons.camera_alt,
//                       size: 40,
//                     )
//                         : null,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             _buildEditableField("School Name", _schoolNameController),
//             _buildEditableField("Student Name", _studentNameController),
//             _buildEditableField("Class", _classController),
//             _buildEditableField("Registration Number", _registrationNumberController),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildEditableField(String label, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         controller: controller,
//         enabled: _isEditing,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
//
// class Profile extends StatefulWidget {
//   @override
//   _ProfileState createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final ImagePicker _imagePicker = ImagePicker();
//   late User? _user;
//   File? _image;
//   bool _loading = false;
//
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _contactNumberController = TextEditingController();
//   final TextEditingController _classController = TextEditingController();
//   final TextEditingController _rollNumberController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }
//
//   Future<void> _fetchUserData() async {
//     setState(() {
//       _loading = true;
//     });
//     try {
//       User? currentUser = _auth.currentUser;
//       if (currentUser != null) {
//         DocumentSnapshot userSnapshot = await _firestore
//             .collection('users')
//             .doc(currentUser.uid)
//             .get();
//
//         if (userSnapshot.exists) {
//           setState(() {
//             _user = currentUser;
//             _nameController.text = userSnapshot['name'];
//             _contactNumberController.text = userSnapshot['contactNumber'];
//             _classController.text = userSnapshot['class'];
//             _rollNumberController.text = userSnapshot['rollNumber'];
//           });
//         }
//       }
//     } catch (e) {
//       print("Error fetching user data: $e");
//     } finally {
//       setState(() {
//         _loading = false;
//       });
//     }
//   }
//
//   // Future<void> _updateProfile() async {
//   //   // Update user profile in Firestore
//   //   try {
//   //     await _firestore.collection('users').doc(_user!.uid).update({
//   //       'name': _nameController.text,
//   //       'contactNumber': _contactNumberController.text,
//   //       'class': _classController.text,
//   //       'rollNumber': _rollNumberController.text,
//   //     });
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(
//   //         content: Text('Profile updated successfully.'),
//   //       ),
//   //     );
//   //   } catch (e) {
//   //     print("Error updating profile: $e");
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(
//   //         content: Text('Error updating profile. Please try again later.'),
//   //       ),
//   //     );
//   //   }
//   // }
//   Future<void> _updateProfile() async {
//     // Update user profile in Firestore
//     try {
//       await _firestore.collection('users').doc(_user!.uid).update({
//         'name': _nameController.text,
//         'contactNumber': _contactNumberController.text,
//         'class': _classController.text,
//         'rollNumber': _rollNumberController.text,
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Profile updated successfully.'),
//         ),
//       );
//     } catch (e) {
//       print("Error updating profile: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error updating profile. Please try again later.'),
//         ),
//       );
//     }
//   }
//
//   // Future<void> _pickImage() async {
//   //   final pickedFile = await _imagePicker.getImage(source: ImageSource.gallery);
//   //   if (pickedFile != null) {
//   //     setState(() {
//   //       _image = File(pickedFile.path);
//   //     });
//   //   }
//   // }
//     Future<void> _getImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }
//
//   Future<void> _uploadImage() async {
//     if (_image == null) return;
//
//     try {
//       String uid = _user!.uid;
//       Reference ref = FirebaseStorage.instance.ref().child('profile_images').child('$uid.jpg');
//       UploadTask uploadTask = ref.putFile(_image!);
//       await uploadTask.whenComplete(() => null);
//       String downloadURL = await ref.getDownloadURL();
//
//       await _firestore.collection('users').doc(uid).update({
//         'profileImageUrl': downloadURL,
//       });
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Profile image uploaded successfully.'),
//         ),
//       );
//     } catch (e) {
//       print("Error uploading image: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error uploading image. Please try again later.'),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: _loading
//           ? Center(
//         child: CircularProgressIndicator(),
//       )
//           : SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: GestureDetector(
//                   //onTap: _pickImage,
//                   onTap: _getImage,
//                   child: CircleAvatar(
//                     radius: 60,
//                     backgroundImage: _image != null ? FileImage(_image!) : null,
//                     child: _image == null ? Icon(Icons.person, size: 60) : null,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text('Name'),
//               TextField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   hintText: 'Enter your name',
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text('Contact Number'),
//               TextField(
//                 controller: _contactNumberController,
//                 decoration: InputDecoration(
//                   hintText: 'Enter your contact number',
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text('Class'),
//               TextField(
//                 controller: _classController,
//                 decoration: InputDecoration(
//                   hintText: 'Enter your class',
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text('Roll Number'),
//               TextField(
//                 controller: _rollNumberController,
//                 decoration: InputDecoration(
//                   hintText: 'Enter your roll number',
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _updateProfile,
//                 child: Text('Update Profile'),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _uploadImage,
//         tooltip: 'Upload Profile Photo',
//         child: Icon(Icons.photo),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late User? _currentUser;
//   late Map<String, dynamic>? _userData;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }
//
//   Future<void> _fetchUserData() async {
//     _currentUser = _auth.currentUser;
//     if (_currentUser != null) {
//       DocumentSnapshot userSnapshot = await _firestore
//           .collection('users')
//           .doc(_currentUser!.uid)
//           .get();
//
//       setState(() {
//         _userData = userSnapshot.data() as Map<String, dynamic>?;
//       });
//     }
//   }
//
//   // Future<void> _uploadProfilePicture() async {
//   //   final picker = ImagePicker();
//   //   final pickedImage = await picker.getImage(source: ImageSource.gallery);
//   //
//   //   if (pickedImage != null) {
//   //     File imageFile = File(pickedImage.path);
//   //     // Upload image to Firestore or your preferred storage
//   //     // Update user document with image URL
//   //   }
//   // }
//   Future<void> _uploadProfilePicture() async {
//     try {
//       final picker = ImagePicker();
//       final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//
//       if (pickedImage != null) {
//         File imageFile = File(pickedImage.path);
//         // Upload image to Firestore or your preferred storage
//         // Update user document with image URL
//       }
//     } catch (e) {
//       print('Error picking image: $e');
//       // Handle error
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: _userData == null
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             GestureDetector(
//               onTap: _uploadProfilePicture,
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: _userData!['profilePicture'] != null
//                     ? NetworkImage(_userData!['profilePicture'])
//                     : null,
//                 child: _userData!['profilePicture'] == null
//                     ? Icon(Icons.add_a_photo)
//                     : null,
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               _userData!['name'],
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             // Display user data based on user type
//             if (_userData!['isTeacher'])
//               Column(
//                 children: [
//                   Text('Subject: ${_userData!['subjects']}'),
//                   // Display other teacher-specific fields if needed
//                 ],
//               )
//             else
//               Column(
//                 children: [
//                   Text('Class: ${_userData!['class']}'),
//                   Text('Roll Number: ${_userData!['rollNumber']}'),
//                   // Display other student-specific fields if needed
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late User? _currentUser;
//   Map<String, dynamic>? _userData;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }
//
//   Future<void> _fetchUserData() async {
//     _currentUser = _auth.currentUser;
//     if (_currentUser != null) {
//       DocumentSnapshot userSnapshot = await _firestore
//           .collection('users')
//           .doc(_currentUser!.uid)
//           .get();
//
//       setState(() {
//         _userData = userSnapshot.data() as Map<String, dynamic>?;
//       });
//     }
//   }
//
//   Future<void> _uploadProfilePicture() async {
//     await _fetchUserData(); // Ensure user data is fetched before proceeding
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedImage != null) {
//       File imageFile = File(pickedImage.path);
//       // Upload image to Firestore or your preferred storage
//       // Update user document with image URL
//     }
//   }
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Profile'),
// //       ),
// //       body: _userData == null
// //           ? Center(child: CircularProgressIndicator())
// //           : SingleChildScrollView(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             SizedBox(height: 20),
// //             GestureDetector(
// //               onTap: _uploadProfilePicture,
// //               child: CircleAvatar(
// //                 radius: 50,
// //                 backgroundImage: _userData!['profilePicture'] != null
// //                     ? NetworkImage(_userData!['profilePicture'])
// //                     : null,
// //                 child: _userData!['profilePicture'] == null
// //                     ? Icon(Icons.add_a_photo)
// //                     : null,
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             Text(
// //               _userData!['name'],
// //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //             ),
// //             SizedBox(height: 20),
// //             // Display user data based on user type
// //             if (_userData!['isTeacher'])
// //               Column(
// //                 children: [
// //                   Text('Subject: ${_userData!['subjects']}'),
// //                   // Display other teacher-specific fields if needed
// //                 ],
// //               )
// //             else
// //               Column(
// //                 children: [
// //                   Text('Class: ${_userData!['class']}'),
// //                   Text('Roll Number: ${_userData!['rollNumber']}'),
// //                   // Display other student-specific fields if needed
// //                 ],
// //               ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: _userData == null
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             GestureDetector(
//               onTap: _uploadProfilePicture,
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: _userData!['profilePicture'] != null
//                     ? NetworkImage(_userData!['profilePicture'])
//                     : null,
//                 child: _userData!['profilePicture'] == null
//                     ? Icon(Icons.add_a_photo)
//                     : null,
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               _userData!['name'],
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'School Name: ${_userData!['schoolName']}',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             // Display user data based on user type
//             if (_userData!['isTeacher'])
//               Column(
//                 children: [
//                   Text('Teacher Details:'),
//                   Text('Subjects: ${_userData!['subjects']}'),
//                   // Display other teacher-specific fields if needed
//                 ],
//               )
//             else
//               Column(
//                 children: [
//                   Text('Student Details:'),
//                   Text('Class: ${_userData!['class']}'),
//                   Text('Roll Number: ${_userData!['rollNumber']}'),
//                   // Display other student-specific fields if needed
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:edpal/screens/update_profile.dart';
// import 'login.dart';
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late User? _currentUser;
//   Map<String, dynamic>? _userData;
//   Future<void> _fetchUserData() async {
//     _currentUser = _auth.currentUser;
//     if (_currentUser != null) {
//       DocumentSnapshot userSnapshot = await _firestore
//           .collection('users')
//           .doc(_currentUser!.uid)
//           .get();
//
//       setState(() {
//         _userData = userSnapshot.data() as Map<String, dynamic>?;
//       });
//     }
//   }
//
//
//   void _navigateToUpdateProfile() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => UpdateProfilePage(userData: _userData!)), // Pass userData to UpdateProfilePage
//     ).then((_) {
//       // Refresh user data after returning from UpdateProfilePage
//       _fetchUserData();
//     });
//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }
//
//   Future<void> _fetchUserData() async {
//     _currentUser = _auth.currentUser;
//     if (_currentUser != null) {
//       DocumentSnapshot userSnapshot = await _firestore
//           .collection('users')
//           .doc(_currentUser!.uid)
//           .get();
//
//       setState(() {
//         _userData = userSnapshot.data() as Map<String, dynamic>?;
//       });
//     }
//   }
//
//   // Future<void> _uploadProfilePicture() async {
//   //   await _fetchUserData(); // Ensure user data is fetched before proceeding
//   //   final picker = ImagePicker();
//   //   final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//   //
//   //   if (pickedImage != null) {
//   //     File imageFile = File(pickedImage.path);
//   //     // Upload image to Firestore or your preferred storage
//   //     // Update user document with image URL
//   //   }
//   // }
//
//   Future<void> _uploadProfilePicture() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedImage != null) {
//       File imageFile = File(pickedImage.path);
//       String fileName = _currentUser!.uid + '_profile.jpg'; // Unique file name
//       Reference storageRef = FirebaseStorage.instance.ref().child('profile_images/$fileName');
//
//       UploadTask uploadTask = storageRef.putFile(imageFile);
//
//       await uploadTask.whenComplete(() async {
//         String downloadUrl = await storageRef.getDownloadURL();
//         await _firestore.collection('users').doc(_currentUser!.uid).update({
//           'profilePicture': downloadUrl,
//         });
//         setState(() {
//           _userData!['profilePicture'] = downloadUrl;
//         });
//       }).catchError((error) {
//         print('Failed to upload image: $error');
//       });
//     }
//   }
//
//   // Future<void> _logout() async {
//   //   await _auth.signOut();
//   //   Navigator.pushReplacementNamed(context, 'login'); // Replace '/login' with your login route
//   // }
//   void logOut(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.popUntil(context, (route) => route.isFirst);
//     Navigator.pushReplacement(
//       context,
//       CupertinoPageRoute(builder: (context) => LoginPage()),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: _userData == null
//           ? Center(child: CircularProgressIndicator())
//           : Stack(
//         children: [
//           Center(
//             child: Container(
//               padding: EdgeInsets.all(20),
//               alignment: Alignment.center,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: _uploadProfilePicture,
//                     child: CircleAvatar(
//                       radius: 50,
//                       backgroundImage: _userData!['profilePicture'] != null
//                           ? NetworkImage(_userData!['profilePicture'])
//                           : null,
//                       child: _userData!['profilePicture'] == null
//                           ? Icon(Icons.add_a_photo)
//                           : null,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     _userData!['name'],
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'School Name: ${_userData!['schoolName']}',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 20),
//                   // Display user data based on user type
//                   if (_userData!['isTeacher'])
//                     Column(
//                       children: [
//                         Text('Teacher Details:'),
//                         Text('Subjects: ${_userData!['subjects']}'),
//                         // Display other teacher-specific fields if needed
//                       ],
//                     )
//                   else
//                     Column(
//                       children: [
//                         Text('Student Details:'),
//                         Text('Class: ${_userData!['class']}'),
//                         Text('Roll Number: ${_userData!['rollNumber']}'),
//                         // Display other student-specific fields if needed
//                       ],
//                     ),
//                   // SizedBox(height: 20),
//                   // ElevatedButton(
//                   //   onPressed:_uploadProfilePicture,
//                   //   child: Text('Update Profile'),
//                   // ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _navigateToUpdateProfile, // Navigate to UpdateProfilePage
//                     child: Text('Update Profile'),
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed :(){ logOut(context);},
//                     child: Text('Logout'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Positioned(
//           //   top: 0,
//           //   right: 0,
//           //   child: IconButton(
//           //     icon: Icon(Icons.logout),
//           //     onPressed: () {
//           //       logOut(context); // Pass the context to the logOut method
//           //     },
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:edpal/screens/update_profile.dart'; // Import the update_profile.dart file
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late User? _currentUser;
//   Map<String, dynamic>? _userData;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }
//
//   // Future<void> _fetchUserData() async {
//   //   _currentUser = _auth.currentUser;
//   //   if (_currentUser != null) {
//   //     DocumentSnapshot userSnapshot = await _firestore
//   //         .collection('users')
//   //         .doc(_currentUser!.uid)
//   //         .get();
//   //
//   //     setState(() {
//   //       _userData = userSnapshot.data() as Map<String, dynamic>?;
//   //     });
//   //   }
//   // }
//   Future<void> _fetchUserData() async {
//     _currentUser = _auth.currentUser;
//     if (_currentUser != null) {
//       try {
//         DocumentSnapshot userSnapshot = await _firestore
//             .collection('users')
//             .doc(_currentUser!.uid)
//             .get();
//
//         if (userSnapshot.exists) {
//           setState(() {
//             _userData = userSnapshot.data() as Map<String, dynamic>?;
//           });
//         } else {
//           print('User data not found');
//         }
//       } catch (e) {
//         print('Error fetching user data: $e');
//       }
//     }
//   }
//
//
//   void _logout() async {
//     await _auth.signOut();
//     Navigator.pushReplacementNamed(context, '/login'); // Navigate to login page
//   }
//
//   void _navigateToUpdateProfile() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => UpdateProfilePage(userData: _userData!)), // Pass userData to UpdateProfilePage
//     ).then((_) {
//       // Refresh user data after returning from UpdateProfilePage
//       _fetchUserData();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: _userData == null
//           ? Center(child: CircularProgressIndicator())
//           : Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(height: 20),
//           GestureDetector(
//             onTap: () {
//               // Handle updating profile picture
//             },
//             child: CircleAvatar(
//               radius: 50,
//               backgroundImage: _userData!['profilePicture'] != null
//                   ? NetworkImage(_userData!['profilePicture'])
//                   : null,
//               child: _userData!['profilePicture'] == null
//                   ? Icon(Icons.add_a_photo)
//                   : null,
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             _userData!['name'],
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           Text(
//             'School Name: ${_userData!['schoolName']}',
//             style: TextStyle(fontSize: 16),
//           ),
//           // Display other user details as needed
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _navigateToUpdateProfile, // Navigate to UpdateProfilePage
//             child: Text('Update Profile'),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _logout,
//             child: Text('Logout'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:edpal/screens/update_profile.dart'; // Import the update_profile.dart file
// import 'package:edpal/screens/login.dart'; // Import the login.dart file
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late User? _currentUser;
//   Map<String, dynamic>? _userData;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }
//
//   Future<void> _fetchUserData() async {
//     _currentUser = _auth.currentUser;
//     if (_currentUser != null) {
//       DocumentSnapshot userSnapshot = await _firestore
//           .collection('users')
//           .doc(_currentUser!.uid)
//           .get();
//
//       setState(() {
//         _userData = userSnapshot.data() as Map<String, dynamic>?;
//       });
//     }
//   }
//
//   Future<void> _uploadProfilePicture() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedImage != null) {
//       File imageFile = File(pickedImage.path);
//       String fileName = _currentUser!.uid + '_profile.jpg'; // Unique file name
//       Reference storageRef = FirebaseStorage.instance.ref().child('profile_images/$fileName');
//
//       UploadTask uploadTask = storageRef.putFile(imageFile);
//
//       await uploadTask.whenComplete(() async {
//         String downloadUrl = await storageRef.getDownloadURL();
//         await _firestore.collection('users').doc(_currentUser!.uid).update({
//           'profilePicture': downloadUrl,
//         });
//         setState(() {
//           _userData!['profilePicture'] = downloadUrl;
//         });
//       }).catchError((error) {
//         print('Failed to upload image: $error');
//       });
//     }
//   }
//
//   void logOut(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.popUntil(context, (route) => route.isFirst);
//     Navigator.pushReplacement(
//       context,
//       CupertinoPageRoute(builder: (context) => LoginPage()),
//     );
//   }
//
//   void _navigateToUpdateProfile() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => UpdateProfilePage(userData: _userData!)),
//     ).then((_) {
//       _fetchUserData(); // Refresh user data after returning from UpdateProfilePage
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: _userData == null
//           ? Center(child: CircularProgressIndicator())
//           : Stack(
//         children: [
//           Center(
//             child: Container(
//               padding: EdgeInsets.all(20),
//               alignment: Alignment.center,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: _uploadProfilePicture,
//                     child: CircleAvatar(
//                       radius: 50,
//                       backgroundImage: _userData!['profilePicture'] != null
//                           ? NetworkImage(_userData!['profilePicture'])
//                           : null,
//                       child: _userData!['profilePicture'] == null
//                           ? Icon(Icons.add_a_photo)
//                           : null,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     _userData!['name'],
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'School Name: ${_userData!['schoolName']}',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 20),
//                   // Display user data based on user type
//                   if (_userData!['isTeacher'])
//                     Column(
//                       children: [
//                         Text('Teacher Details:'),
//                         Text('Subjects: ${_userData!['subjects']}'),
//                         // Display other teacher-specific fields if needed
//                       ],
//                     )
//                   else
//                     Column(
//                       children: [
//                         Text('Student Details:'),
//                         Text('Class: ${_userData!['class']}'),
//                         Text('Roll Number: ${_userData!['rollNumber']}'),
//                         // Display other student-specific fields if needed
//                       ],
//                     ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _navigateToUpdateProfile,
//                     child: Text('Update Profile'),
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       logOut(context);
//                     },
//                     child: Text('Logout'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'dart:developer';
//       import 'dart:io';
//
//       import 'package:edpal/screens/home_screen.dart';
//       import 'package:app/util/snackbar.dart';
//       import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
//       import 'package:cloud_firestore/cloud_firestore.dart';
//       import 'package:firebase_auth/firebase_auth.dart';
//       import 'package:firebase_storage/firebase_storage.dart';
//       import 'package:flutter/cupertino.dart';
//       import 'package:flutter/material.dart';
//       import 'package:image_cropper/image_cropper.dart';
//       import 'package:image_picker/image_picker.dart';
//
//       import '../models/user_model.dart';
//
//     class CompleteProfileScreen extends StatefulWidget {
//     final UserModel userModel;
//     final User user;
//     const CompleteProfileScreen(
//     {Key? key, required this.userModel, required this.user})
//         : super(key: key);
//
//     @override
//     State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
//     }
//
//     class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
//     File? imageFile;
//     TextEditingController nameConroller = TextEditingController();
//     bool buttonEnabled = false;
//     bool loading = false;
//     final _formKey = GlobalKey<FormState>();
//     bool uploaded = false;
//
//     void selectImage(ImageSource source) async {
//     XFile? pickedImage = await ImagePicker().pickImage(source: source);
//
//     if (pickedImage != null) {
//     cropTheImage(pickedImage);
//     }
//     }
//
//     void cropTheImage(XFile file) async {
//     CroppedFile? croppedImage = await ImageCropper().cropImage(
//     sourcePath: file.path,
//     aspectRatio: const CropAspectRatio(
//     ratioX: 1,
//     ratioY: 1,
//     ),
//     compressQuality: 20,
//     );
//
//     if (croppedImage != null) {
//     setState(() {
//     imageFile = File(croppedImage.path);
//     });
//     }
//     }
//
//     SnackBar errorSnackBar(String message) {
//     return SnackBar(
//     duration: const Duration(seconds: 3),
//     width: double.infinity,
//     elevation: 0,
//     behavior: SnackBarBehavior.floating,
//     backgroundColor: Colors.transparent,
//     content: AwesomeSnackbarContent(
//     title: 'Error',
//     message: message,
//     contentType: ContentType.failure,
//     ),
//     );
//     }
//
//     void showPhotoOptions() {
//     showDialog(
//     context: context,
//     builder: (context) {
//     return AlertDialog(
//     title: const Text("Upload Photo"),
//     content: Column(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//     ListTile(
//     onTap: () {
//     Navigator.pop(context);
//     selectImage(ImageSource.gallery);
//     },
//     title: const Text("Select from gallery"),
//     leading: const Icon(Icons.photo_album),
//     ),
//     ListTile(
//     onTap: () {
//     Navigator.pop(context);
//     selectImage(ImageSource.camera);
//     },
//     title: const Text("Take a photo"),
//     leading: const Icon(Icons.camera_alt),
//     ),
//     ],
//     ),
//     );
//     },
//     );
//     }
//
//     void uploadData() async {
//     setState(() {
//     loading = true;
//     });
//     try {
//     if (imageFile != null) {
//     UploadTask uploadTask = FirebaseStorage.instance
//         .ref("profilePictures")
//         .child(widget.userModel.userName.toString())
//         .putFile(
//     imageFile!,
//     );
//
//     TaskSnapshot snapshot = await uploadTask;
//     String imageUrl = await snapshot.ref.getDownloadURL();
//     widget.userModel.userDpUrl = imageUrl;
//     }
//     String fullName = nameConroller.text;
//       widget.userModel.userName = fullName;
//
//       FirebaseFirestore.instance
//           .collection("users")
//           .doc(widget.userModel.userId)
//           .set(
//         widget.userModel.toMap(),
//       )
//           .then(
//             (value) {
//           log("\x1B[32muploaded\x1B[0m");
//           setState(() {
//             loading = false;
//           });
//           MySnackbar.successSnackBar("Profile info set successfully");
//           Navigator.popUntil(
//             context,
//                 (route) {
//               return route.isFirst;
//             },
//           );
//
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => HomeScreen(
//                 userModel: widget.userModel,
//                 firebaseUser: widget.user,
//               ),
//             ),
//           );
//         },
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(errorSnackBar(e.toString()));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Complete Your Profile"),
//       ),
//       body: SafeArea(
//         child: Form(
//           onChanged: () {
//             setState(() {
//               buttonEnabled = _formKey.currentState!.validate();
//             });
//           },
//           key: _formKey,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           child: Container(
//             padding: const EdgeInsets.all(30),
//             child: ListView(
//               children: [
//                 CupertinoButton(
//                   onPressed: () {
//                     showPhotoOptions();
//                   },
//                   child: CircleAvatar(
//                     backgroundImage:
//                     imageFile == null ? null : FileImage(imageFile!),
//                     radius: 50,
//                     child: imageFile == null
//                         ? const Icon(Icons.person, size: 60)
//                         : null,
//                   ),
//                 ),
//                 TextFormField(
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Please enter your name";
//                     }
//                     return null;
//                   },
//                   controller: nameConroller,
//                   decoration: const InputDecoration(
//                     labelText: 'Name',
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 loading
//                     ? const Center(child: CircularProgressIndicator())
//                     : ElevatedButton(
//                   onPressed: buttonEnabled
//                       ? () {
//                     uploadData();
//                   }
//                       : null,
//                   child: const Text("Submit"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:edpal/screens/update_profile.dart'; // Import the update_profile.dart file
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late User? _currentUser;
//   Map<String, dynamic>? _userData;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }
//
//   // Future<void> _fetchUserData() async {
//   //   _currentUser = _auth.currentUser;
//   //   if (_currentUser != null) {
//   //     try {
//   //       DocumentSnapshot userSnapshot = await _firestore
//   //           .collection('users')
//   //           .doc(_currentUser!.uid)
//   //           .get();
//   //
//   //       if (userSnapshot.exists) {
//   //         setState(() {
//   //           _userData = userSnapshot.data() as Map<String, dynamic>?;
//   //         });
//   //       } else {
//   //         print('User data not found');
//   //       }
//   //     } catch (e) {
//   //       print('Error fetching user data: $e');
//   //     }
//   //   }
//   // }
//   Future<void> _fetchUserData() async {
//     _currentUser = _auth.currentUser;
//     if (_currentUser != null) {
//       try {
//         DocumentSnapshot userSnapshot = await _firestore
//             .collection('users')
//             .doc(_currentUser!.uid)
//             .get();
//
//         if (userSnapshot.exists) {
//           setState(() {
//             _userData = userSnapshot.data() as Map<String, dynamic>?;
//           });
//         } else {
//           print('User data not found');
//           // Handle case where user data is not found
//         }
//       } catch (e) {
//         print('Error fetching user data: $e');
//       }
//     }
//   }
//
//
//   void _logout() async {
//     await _auth.signOut();
//     Navigator.pushReplacementNamed(context, '/login'); // Navigate to login page
//   }
//
//   void _navigateToUpdateProfile() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => UpdateProfilePage(userData: _userData!)), // Pass userData to UpdateProfilePage
//     ).then((_) {
//       // Refresh user data after returning from UpdateProfilePage
//       _fetchUserData();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: _userData == null
//           ? Center(child: CircularProgressIndicator())
//           : Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(height: 20),
//           GestureDetector(
//             onTap: () {
//               // Handle updating profile picture
//             },
//             child: CircleAvatar(
//               radius: 50,
//               backgroundImage: _userData!['profilePicture'] != null
//                   ? NetworkImage(_userData!['profilePicture'])
//                   : null,
//               child: _userData!['profilePicture'] == null
//                   ? Icon(Icons.add_a_photo)
//                   : null,
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             _userData!['name'],
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           Text(
//             'School Name: ${_userData!['schoolName']}',
//             style: TextStyle(fontSize: 16),
//           ),
//           // Display other user details as needed
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _navigateToUpdateProfile, // Navigate to UpdateProfilePage
//             child: Text('Update Profile'),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _logout,
//             child: Text('Logout'),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:edpal/screens/edit_profile.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:edpal/screens/edit_profile.dart'; // Import the edit_profile.dart file
// import 'package:edpal/screens/login.dart'; // Import the login.dart file
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late User? _currentUser;
//   Map<String, dynamic>? _userData;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }
//
//   Future<void> _fetchUserData() async {
//     _currentUser = _auth.currentUser;
//     if (_currentUser != null) {
//       DocumentSnapshot userSnapshot = await _firestore
//           .collection('users')
//           .doc(_currentUser!.uid)
//           .get();
//
//       setState(() {
//         _userData = userSnapshot.data() as Map<String, dynamic>?;
//       });
//     }
//   }
//
//   void _navigateToEditProfile() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => EditProfilePage(userData: _userData!)),
//     ).then((_) {
//       _fetchUserData(); // Refresh user data after returning from EditProfilePage
//     });
//   }
//
//   void _logout(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.popUntil(context, (route) => route.isFirst);
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => LoginPage()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: _userData == null
//           ? Center(child: CircularProgressIndicator())
//           : Stack(
//         children: [
//           Center(
//             child: Container(
//               padding: EdgeInsets.all(20),
//               alignment: Alignment.center,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       // Handle tapping on profile picture (optional)
//                     },
//                     child: CircleAvatar(
//                       radius: 50,
//                       backgroundImage: _userData!['profilePicture'] != null
//                           ? NetworkImage(_userData!['profilePicture'])
//                           : null,
//                       child: _userData!['profilePicture'] == null
//                           ? Icon(Icons.add_a_photo)
//                           : null,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     _userData!['name'],
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'School Name: ${_userData!['schoolName']}',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 20),
//                   // Display user data based on user type
//                   // Implement your UI based on user type here
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _navigateToEditProfile,
//                     child: Text('Edit Profile'),
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       _logout(context);
//                     },
//                     child: Text('Logout'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//upr wala last data hai
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:ionicons/ionicons.dart';
// //import 'package:edpal/auth/register/register.dart';
// import 'package:edpal/screens/myschool.dart';
// import 'package:edpal/components/stream_grid_wrapper.dart';
// import 'package:edpal/models/post.dart';
// import 'package:edpal/models/user.dart';
// import 'package:edpal/screens/edit_profile.dart';
// import 'package:edpal/screens/list_posts.dart';
// import 'package:edpal/screens/settings.dart';
// import 'package:edpal/utils/firebase.dart';
// //import 'package:edpal/widgets/post_tiles.dart';
//
// import '../widgets/post_titles.dart';
//
// class Profile extends StatefulWidget {
//   final profileId;
//
//   Profile({this.profileId});
//
//   @override
//   _ProfileState createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   User? user;
//   bool isLoading = false;
//   int postCount = 0;
//   int followersCount = 0;
//   int followingCount = 0;
//   bool isFollowing = false;
//   UserModel? users;
//   final DateTime timestamp = DateTime.now();
//   ScrollController controller = ScrollController();
//
//   currentUserId() {
//     return firebaseAuth.currentUser?.uid;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     checkIfFollowing();
//   }
//
//   checkIfFollowing() async {
//     DocumentSnapshot doc = await followersRef
//         .doc(widget.profileId)
//         .collection('userFollowers')
//         .doc(currentUserId())
//         .get();
//     setState(() {
//       isFollowing = doc.exists;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('EDPAL'),
//         actions: [
//           widget.profileId == firebaseAuth.currentUser!.uid
//               ? Center(
//             child: Padding(
//               padding: const EdgeInsets.only(right: 25.0),
//               child: GestureDetector(
//                 onTap: () async {
//                   await firebaseAuth.signOut();
//                   Navigator.of(context).push(
//                     CupertinoPageRoute(
//                       //builder: (_) => Register(),
//                       builder: (_) => MemberRegistration(),
//                     ),
//                   );
//                 },
//                 child: Text(
//                   'Log Out',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w900,
//                     fontSize: 15.0,
//                   ),
//                 ),
//               ),
//             ),
//           )
//               : SizedBox()
//         ],
//       ),
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverAppBar(
//             automaticallyImplyLeading: false,
//             pinned: true,
//             floating: false,
//             toolbarHeight: 5.0,
//             collapsedHeight: 6.0,
//             expandedHeight: 225.0,
//             flexibleSpace: FlexibleSpaceBar(
//               background: StreamBuilder(
//                 stream: usersRef.doc(widget.profileId).snapshots(),
//                 builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//                   if (snapshot.hasData) {
//                     UserModel user = UserModel.fromJson(
//                       snapshot.data!.data() as Map<String, dynamic>,
//                     );
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 20.0),
//                               child: user.photoUrl!.isEmpty
//                                   ? CircleAvatar(
//                                 radius: 40.0,
//                                 backgroundColor: Theme.of(context)
//                                     .colorScheme
//                                     .secondary,
//                                 child: Center(
//                                   child: Text(
//                                     '${user.username![0].toUpperCase()}',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 15.0,
//                                       fontWeight: FontWeight.w900,
//                                     ),
//                                   ),
//                                 ),
//                               )
//                                   : CircleAvatar(
//                                 radius: 40.0,
//                                 backgroundImage:
//                                 CachedNetworkImageProvider(
//                                   '${user.photoUrl}',
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 20.0),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(height: 32.0),
//                                 Row(
//                                   children: [
//                                     Visibility(
//                                       visible: false,
//                                       child: SizedBox(width: 10.0),
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           width: 130.0,
//                                           child: Text(
//                                             user.username!,
//                                             style: TextStyle(
//                                               fontSize: 15.0,
//                                               fontWeight: FontWeight.w900,
//                                             ),
//                                             maxLines: null,
//                                           ),
//                                         ),
//                                         Container(
//                                           width: 130.0,
//                                           child: Text(
//                                             user.country!,
//                                             style: TextStyle(
//                                               fontSize: 12.0,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                             maxLines: 1,
//                                             overflow: TextOverflow.ellipsis,
//                                           ),
//                                         ),
//                                         SizedBox(width: 10.0),
//                                         Column(
//                                           mainAxisSize: MainAxisSize.min,
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               user.email!,
//                                               style: TextStyle(
//                                                 fontSize: 10.0,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     widget.profileId == currentUserId()
//                                         ? InkWell(
//                                       onTap: () {
//                                         Navigator.of(context).push(
//                                           CupertinoPageRoute(
//                                             builder: (_) => Setting(),
//                                           ),
//                                         );
//                                       },
//                                       child: Column(
//                                         children: [
//                                           Icon(
//                                             Ionicons.settings_outline,
//                                             color: Theme.of(context)
//                                                 .colorScheme
//                                                 .secondary,
//                                           ),
//                                           Text(
//                                             'settings',
//                                             style: TextStyle(
//                                               fontSize: 11.5,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     )
//                                         : const Text('')
//                                     // : buildLikeButton()
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 10.0, left: 20.0),
//                           child: user.bio!.isEmpty
//                               ? Container()
//                               : Container(
//                             width: 200,
//                             child: Text(
//                               user.bio!,
//                               style: TextStyle(
//                                 fontSize: 10.0,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                               maxLines: null,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 10.0),
//                         Container(
//                           height: 50.0,
//                           child: Padding(
//                             padding:
//                             const EdgeInsets.symmetric(horizontal: 30.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 StreamBuilder(
//                                   stream: postRef
//                                       .where('ownerId',
//                                       isEqualTo: widget.profileId)
//                                       .snapshots(),
//                                   builder: (context,
//                                       AsyncSnapshot<QuerySnapshot> snapshot) {
//                                     if (snapshot.hasData) {
//                                       QuerySnapshot<Object?>? snap =
//                                           snapshot.data;
//                                       List<DocumentSnapshot> docs = snap!.docs;
//                                       return buildCount(
//                                           "POSTS", docs.length ?? 0);
//                                     } else {
//                                       return buildCount("POSTS", 0);
//                                     }
//                                   },
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(bottom: 15.0),
//                                   child: Container(
//                                     height: 50.0,
//                                     width: 0.3,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                                 StreamBuilder(
//                                   stream: followersRef
//                                       .doc(widget.profileId)
//                                       .collection('userFollowers')
//                                       .snapshots(),
//                                   builder: (context,
//                                       AsyncSnapshot<QuerySnapshot> snapshot) {
//                                     if (snapshot.hasData) {
//                                       QuerySnapshot<Object?>? snap =
//                                           snapshot.data;
//                                       List<DocumentSnapshot> docs = snap!.docs;
//                                       return buildCount(
//                                           "FOLLOWERS", docs.length ?? 0);
//                                     } else {
//                                       return buildCount("FOLLOWERS", 0);
//                                     }
//                                   },
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(bottom: 15.0),
//                                   child: Container(
//                                     height: 50.0,
//                                     width: 0.3,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                                 StreamBuilder(
//                                   stream: followingRef
//                                       .doc(widget.profileId)
//                                       .collection('userFollowing')
//                                       .snapshots(),
//                                   builder: (context,
//                                       AsyncSnapshot<QuerySnapshot> snapshot) {
//                                     if (snapshot.hasData) {
//                                       QuerySnapshot<Object?>? snap =
//                                           snapshot.data;
//                                       List<DocumentSnapshot> docs = snap!.docs;
//                                       return buildCount(
//                                           "FOLLOWING", docs.length ?? 0);
//                                     } else {
//                                       return buildCount("FOLLOWING", 0);
//                                     }
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         buildProfileButton(user),
//                       ],
//                     );
//                   }
//                   return Container();
//                 },
//               ),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//                   (BuildContext context, int index) {
//                 if (index > 0) return null;
//                 return Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: Row(
//                         children: [
//                           Text(
//                             'All Posts',
//                             style: TextStyle(fontWeight: FontWeight.w900),
//                           ),
//                           const Spacer(),
//                           IconButton(
//                             onPressed: () async {
//                               DocumentSnapshot doc =
//                               await usersRef.doc(widget.profileId).get();
//                               var currentUser = UserModel.fromJson(
//                                 doc.data() as Map<String, dynamic>,
//                               );
//                               Navigator.push(
//                                 context,
//                                 CupertinoPageRoute(
//                                   builder: (_) => ListPosts(
//                                     userId: widget.profileId,
//                                     username: currentUser.username,
//                                   ),
//                                 ),
//                               );
//                             },
//                             icon: Icon(Ionicons.grid_outline),
//                           )
//                         ],
//                       ),
//                     ),
//                     buildPostView()
//                   ],
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   buildCount(String label, int count) {
//     return Column(
//       children: <Widget>[
//         Text(
//           count.toString(),
//           style: TextStyle(
//             fontSize: 16.0,
//             fontWeight: FontWeight.w900,
//             fontFamily: 'Ubuntu-Regular',
//           ),
//         ),
//         SizedBox(height: 3.0),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.w400,
//             fontFamily: 'Ubuntu-Regular',
//           ),
//         )
//       ],
//     );
//   }
//
//   buildProfileButton(user) {
//     //if isMe then display "edit profile"
//     bool isMe = widget.profileId == firebaseAuth.currentUser!.uid;
//     if (isMe) {
//       return buildButton(
//           text: "Edit Profile",
//           function: () {
//             Navigator.of(context).push(
//               CupertinoPageRoute(
//                 builder: (_) => EditProfile(
//                   user: user,
//                 ),
//               ),
//             );
//           });
//       //if you are already following the user then "unfollow"
//     } else if (isFollowing) {
//       return buildButton(
//         text: "Unfollow",
//         function: handleUnfollow,
//       );
//       //if you are not following the user then "follow"
//     } else if (!isFollowing) {
//       return buildButton(
//         text: "Follow",
//         function: handleFollow,
//       );
//     }
//   }
//
//   buildButton({String? text, Function()? function}) {
//     return Center(
//       child: GestureDetector(
//         onTap: function!,
//         child: Container(
//           height: 40.0,
//           width: 200.0,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5.0),
//             gradient: LinearGradient(
//               begin: Alignment.topRight,
//               end: Alignment.bottomLeft,
//               colors: [
//                 Theme.of(context).colorScheme.secondary,
//                 Color(0xff597FDB),
//               ],
//             ),
//           ),
//           child: Center(
//             child: Text(
//               text!,
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   handleUnfollow() async {
//     DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
//     users = UserModel.fromJson(doc.data() as Map<String, dynamic>);
//     setState(() {
//       isFollowing = false;
//     });
//     //remove follower
//     followersRef
//         .doc(widget.profileId)
//         .collection('userFollowers')
//         .doc(currentUserId())
//         .get()
//         .then((doc) {
//       if (doc.exists) {
//         doc.reference.delete();
//       }
//     });
//     //remove following
//     followingRef
//         .doc(currentUserId())
//         .collection('userFollowing')
//         .doc(widget.profileId)
//         .get()
//         .then((doc) {
//       if (doc.exists) {
//         doc.reference.delete();
//       }
//     });
//     //remove from notifications feeds
//     notificationRef
//         .doc(widget.profileId)
//         .collection('notifications')
//         .doc(currentUserId())
//         .get()
//         .then((doc) {
//       if (doc.exists) {
//         doc.reference.delete();
//       }
//     });
//   }
//
//   handleFollow() async {
//     DocumentSnapshot doc = await usersRef.doc(currentUserId()).get();
//     users = UserModel.fromJson(doc.data() as Map<String, dynamic>);
//     setState(() {
//       isFollowing = true;
//     });
//     //updates the followers collection of the followed user
//     followersRef
//         .doc(widget.profileId)
//         .collection('userFollowers')
//         .doc(currentUserId())
//         .set({});
//     //updates the following collection of the currentUser
//     followingRef
//         .doc(currentUserId())
//         .collection('userFollowing')
//         .doc(widget.profileId)
//         .set({});
//     //update the notification feeds
//     notificationRef
//         .doc(widget.profileId)
//         .collection('notifications')
//         .doc(currentUserId())
//         .set({
//       "type": "follow",
//       "ownerId": widget.profileId,
//       "username": users?.username,
//       "userId": users?.id,
//       "userDp": users?.photoUrl,
//       "timestamp": timestamp,
//     });
//   }
//
//   buildPostView() {
//     return buildGridPost();
//   }
//
//   buildGridPost() {
//     return StreamGridWrapper(
//       shrinkWrap: true,
//       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//       stream: postRef
//           .where('ownerId', isEqualTo: widget.profileId)
//           .orderBy('timestamp', descending: true)
//           .snapshots(),
//       physics: NeverScrollableScrollPhysics(),
//       itemBuilder: (_, DocumentSnapshot snapshot) {
//         PostModel posts =
//         PostModel.fromJson(snapshot.data() as Map<String, dynamic>);
//         return PostTile(
//           post: posts,
//         );
//       },
//     );
//   }
//
//   buildLikeButton() {
//     return StreamBuilder(
//       stream: favUsersRef
//           .where('postId', isEqualTo: widget.profileId)
//           .where('userId', isEqualTo: currentUserId())
//           .snapshots(),
//       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasData) {
//           List<QueryDocumentSnapshot> docs = snapshot.data?.docs ?? [];
//           return GestureDetector(
//             onTap: () {
//               if (docs.isEmpty) {
//                 favUsersRef.add({
//                   'userId': currentUserId(),
//                   'postId': widget.profileId,
//                   'dateCreated': Timestamp.now(),
//                 });
//               } else {
//                 favUsersRef.doc(docs[0].id).delete();
//               }
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.2),
//                     spreadRadius: 3.0,
//                     blurRadius: 5.0,
//                   )
//                 ],
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(3.0),
//                 child: Icon(
//                   docs.isEmpty
//                       ? CupertinoIcons.heart
//                       : CupertinoIcons.heart_fill,
//                   color: Colors.red,
//                 ),
//               ),
//             ),
//           );
//         }
//         return Container();
//       },
//     );
//   }
// }


// import 'package:edpal/screens/edit_profile.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class ProfilePage extends StatelessWidget {
//   final User? user;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   ProfilePage({Key? key, required this.user}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     print('User: $user'); // Debug print statement
//
//     if (user == null) {
//       // If user is null, display error message or navigate back to login page
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Error'),
//         ),
//         body: Center(
//           child: Text('User not authenticated.'),
//         ),
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => EditProfilePage(user: user),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: firestore.collection('users').doc(user!.uid).snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           var userData = snapshot.data!.data() as Map<String, dynamic>;
//           return Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Name: ${userData['name']}',
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Email: ${userData['email']}',
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//                 // Add more fields here as needed
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:edpal/resources/auth_methods.dart';
// import 'package:edpal/resources/firestore_methods.dart';
// import 'package:edpal/screens/login.dart';
// import 'package:edpal/utils/colors.dart';
// import 'package:edpal/utils/utils.dart';
// import 'package:edpal/widgets/follow_button.dart';
//
// class ProfileScreen extends StatefulWidget {
//   final String uid;
//
//   const ProfileScreen({Key? key, required this.uid}) : super(key: key);
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   var userData = {};
//   int postLen = 0;
//   int followers = 0;
//   int following = 0;
//   bool isFollowing = false;
//   bool isLoading = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getData();
//   }
//
//   getData() async {
//     setState(() {
//       isLoading = true;
//     });
//     try {
//       var userSnap = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(widget.uid)
//           .get();
//       var postSnap = await FirebaseFirestore.instance
//           .collection('posts')
//           .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//           .get();
//
//       postLen = postSnap.docs.length;
//       userData = userSnap.data()!;
//       followers = userSnap.data()!['followers'].length;
//       following = userSnap.data()!['following'].length;
//       isFollowing = userSnap
//           .data()!['followers']
//           .contains(FirebaseAuth.instance.currentUser!.uid);
//       setState(() {});
//     } catch (e) {
//       showSnackBar(e.toString(), context);
//     }
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? const Center(
//       child: CircularProgressIndicator(),
//     )
//         : Scaffold(
//       appBar: AppBar(
//         backgroundColor: mobileBackgroundColor,
//         title: Text(userData['username']),
//         centerTitle: false,
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.grey,
//                       radius: 40,
//                       backgroundImage: NetworkImage(userData['photoUrl']),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment:
//                             MainAxisAlignment.spaceEvenly,
//                             children: [
//                               buildStatColumn(postLen, 'posts'),
//                               buildStatColumn(followers, 'followers'),
//                               buildStatColumn(following, 'following'),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment:
//                             MainAxisAlignment.spaceEvenly,
//                             children: [
//                               FirebaseAuth.instance.currentUser!.uid ==
//                                   widget.uid
//                                   ? FollowButton(
//                                 backgroundColor:
//                                 mobileBackgroundColor,
//                                 borderColor: Colors.grey,
//                                 text: 'Sign Out',
//                                 textColor: primaryColor,
//                                 function: () async {
//                                   await AuthMethods().signout();
//                                   Navigator.of(context)
//                                       .pushReplacement(
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                       const LoginPage(),
//                                     ),
//                                   );
//                                 },
//                               )
//                                   : isFollowing
//                                   ? FollowButton(
//                                 backgroundColor: Colors.white,
//                                 borderColor: Colors.grey,
//                                 text: 'Unfollow',
//                                 textColor: Colors.black,
//                                 function: () async {
//                                   await FirestoreMethods()
//                                       .followUser(
//                                       FirebaseAuth.instance
//                                           .currentUser!.uid,
//                                       userData['uid']);
//                                   setState(() {
//                                     isFollowing = false;
//                                     followers--;
//                                   });
//                                 },
//                               )
//                                   : FollowButton(
//                                 backgroundColor: Colors.blue,
//                                 borderColor: Colors.blue,
//                                 text: 'Follow',
//                                 textColor: Colors.white,
//                                 function: () async {
//                                   await FirestoreMethods()
//                                       .followUser(
//                                       FirebaseAuth.instance
//                                           .currentUser!.uid,
//                                       userData['uid']);
//                                   setState(() {
//                                     isFollowing = true;
//                                     followers++;
//                                   });
//                                 },
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   alignment: Alignment.centerLeft,
//                   padding: const EdgeInsets.only(top: 15),
//                   child: Text(
//                     userData['username'],
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.centerLeft,
//                   padding: const EdgeInsets.only(top: 1),
//                   child: Text(
//                     userData['bio'],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const Divider(),
//           FutureBuilder(
//               future: FirebaseFirestore.instance
//                   .collection('posts')
//                   .where('uid', isEqualTo: widget.uid)
//                   .get(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 return GridView.builder(
//                     shrinkWrap: true,
//                     itemCount: (snapshot.data! as dynamic).docs.length,
//                     gridDelegate:
//                     SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3,
//                         crossAxisSpacing: 5,
//                         mainAxisSpacing: 1.5,
//                         childAspectRatio: 1),
//                     itemBuilder: (context, index) {
//                       DocumentSnapshot snap =
//                       (snapshot.data! as dynamic).docs[index];
//                       return Container(
//                         child: Image(
//                           image: NetworkImage(
//                             (snap.data()! as dynamic)['postUrl'],
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                       );
//                     });
//               }),
//         ],
//       ),
//     );
//   }
//
//   Column buildStatColumn(int num, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           num.toString(),
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         Container(
//           margin: EdgeInsets.only(top: 4),
//           child: Text(
//             label.toString(),
//             style: const TextStyle(
//                 fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
//           ),
//         ),
//       ],
//     );
//   }
//}


// import 'dart:html';
// import 'dart:io';
//
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// //class _ProfilePageState extends State<ProfilePage> {}
//
// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//       ),
//       body: Center(child: Text('User Profile Page')),
//     );
//   }
// }
// FirebaseAuth _auth = FirebaseAuth.instance;
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// Future createUserInFirestore(User user, String username) async {
//   DocumentSnapshot doc = await _firestore.collection('users').doc(user.uid).get();
//
//   if (!doc.exists) {
//     _firestore.collection('users').doc(user.uid).set({
//       'username': username,
//       'email': user.email,
//       'createdOn': DateTime.now(),
//     });
//   }
// }
// Future updateUserProfile(User user, String newUsername) async {
//   await _firestore.collection('users').doc(user.uid).update({
//     'username': newUsername,
//   });
//   @override
//   Widget build(BuildContext context) {
//     final User user = _auth.currentUser;
//
//     return StreamBuilder<DocumentSnapshot>(
//       stream: _firestore.collection('users').doc(user.uid).snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else if (!snapshot.hasData) {
//           return CircularProgressIndicator();
//         } else if (snapshot.hasData) {
//           Map<String, dynamic> data = snapshot.data.data();
//           return ListTile(
//               title: Text('Username: ${data['username']}',
//                 subtitle: Text('Email: ${data['email']}'),
//               );
//           }
//               return CircularProgressIndicator();
//         },
//     );
//   }
// }
//
// final FirebaseStorage _storage = FirebaseStorage.instance;
// Future uploadProfilePicture(User user, File profilePicture) async {
//   UploadTask uploadTask = _storage
//       .ref()
//       .child('userProfilePictures/${user.uid}/profilePicture.jpg')
//       .putFile(profilePicture as File);
//
//   TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
//   String downloadURL = await taskSnapshot.ref.getDownloadURL();
//
//   return downloadURL;
// }
// Image.network('${data['profilePictureURL']}')


// import 'dart:io';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   TextEditingController _usernameController = TextEditingController();
//
//   late User _user;
//   late String _username;
//   late String _profilePictureURL;
//
//   @override
//   void initState() {
//     super.initState();
//     _user = _auth.currentUser!;
//     _loadUserProfile();
//   }
//
//   Future<void> _loadUserProfile() async {
//     DocumentSnapshot doc =
//     await _firestore.collection('users').doc(_user.uid).get();
//
//     if (doc.exists) {
//       // setState(() {
//       //   _username = doc.data()['username'];
//       //   _profilePictureURL = doc.data()['profilePictureURL'];
//       // });
//       setState(() {
//         _username = doc.data()?["username"] ?? '';
//         _profilePictureURL = doc.data()?['profilePictureURL'] ?? '';
//       });
//
//     }
//   }
//
//   Future<void> _updateUserProfile() async {
//     String newUsername = _usernameController.text;
//
//     await _firestore.collection('users').doc(_user.uid).update({
//       'username': newUsername,
//     });
//
//     setState(() {
//       _username = newUsername;
//     });
//   }
//
//   Future<void> _uploadProfilePicture(File profilePicture) async {
//     String filePath = 'userProfilePictures/${_user.uid}/profilePicture.jpg';
//     UploadTask uploadTask =
//     _storage.ref().child(filePath).putFile(profilePicture);
//
//     TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
//     String downloadURL = await taskSnapshot.ref.getDownloadURL();
//
//     await _firestore.collection('users').doc(_user.uid).update({
//       'profilePictureURL': downloadURL,
//     });
//
//     setState(() {
//       _profilePictureURL = downloadURL;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: Text('Edit Profile'),
//                     content: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         TextField(
//                           controller: _usernameController,
//                           decoration: InputDecoration(labelText: 'Username'),
//                         ),
//                         SizedBox(height: 20),
//                         ElevatedButton(
//                           onPressed: () {
//                             _updateUserProfile();
//                             Navigator.pop(context);
//                           },
//                           child: Text('Save'),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_profilePictureURL != null)
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: NetworkImage(_profilePictureURL),
//               ),
//             SizedBox(height: 20),
//             Text('Username: $_username'),
//             SizedBox(height: 20),
//             Text('Email: ${_user.email}'),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:io';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   TextEditingController _usernameController = TextEditingController();
//
//   late User _user;
//   late String _username = '';
//   late String _email = '';
//   late String _schoolName = '';
//   late String _principalEmail = '';
//   late String _class = ''; // For students
//   late String _rollNumber = ''; // For students
//   late String _subject = ''; // For teachers
//   late String _profilePictureURL = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _user = _auth.currentUser!;
//     _loadUserProfile();
//   }
//
//   Future<void> _loadUserProfile() async {
//     DocumentSnapshot doc =
//     await _firestore.collection('users').doc(_user.uid).get();
//
//     if (doc.exists) {
//       setState(() {
//         // _username = doc.data()?['username'] ?? '';
//         // _email = doc.data()?['email'] ?? '';
//         // _schoolName = doc.data()?['schoolName'] ?? '';
//         // _principalEmail = doc.data()?['principalEmail'] ?? '';
//         // if (doc.data()?['class'] != null) {
//         //   _class = doc.data()?['class'];
//         //   _rollNumber = doc.data()?['rollNumber'];
//         // }
//         // _subject = doc.data()?['subject'] ?? '';
//         // _profilePictureURL = doc.data()?['profilePictureURL'] ?? '';
//         Map<String, dynamic>? userData = doc.data() as Map<String, dynamic>?;
//
//         if (userData != null) {
//           _username = userData['username'] ?? '';
//           _email = userData['email'] ?? '';
//           _schoolName = userData['schoolName'] ?? '';
//           _principalEmail = userData['principalEmail'] ?? '';
//           if (userData['class'] != null) {
//             _class = userData['class'];
//             _rollNumber = userData['rollNumber'];
//           }
//           _subject = userData['subject'] ?? '';
//           _profilePictureURL = userData['profilePictureURL'] ?? '';
//         }
//
//       });
//     }
//   }
//
//   Future<void> _updateUserProfile() async {
//     String newUsername = _usernameController.text;
//
//     await _firestore.collection('users').doc(_user.uid).update({
//       'username': newUsername,
//     });
//
//     setState(() {
//       _username = newUsername;
//     });
//   }
//
//   Future<void> _uploadProfilePicture(File profilePicture) async {
//     String filePath = 'userProfilePictures/${_user.uid}/profilePicture.jpg';
//     UploadTask uploadTask =
//     _storage.ref().child(filePath).putFile(profilePicture);
//
//     TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
//     String downloadURL = await taskSnapshot.ref.getDownloadURL();
//
//     await _firestore.collection('users').doc(_user.uid).update({
//       'profilePictureURL': downloadURL,
//     });
//
//     setState(() {
//       _profilePictureURL = downloadURL;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: Text('Edit Profile'),
//                     content: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         TextField(
//                           controller: _usernameController,
//                           decoration: InputDecoration(labelText: 'Username'),
//                         ),
//                         SizedBox(height: 20),
//                         ElevatedButton(
//                           onPressed: () {
//                             _updateUserProfile();
//                             Navigator.pop(context);
//                           },
//                           child: Text('Save'),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_profilePictureURL.isNotEmpty)
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: NetworkImage(_profilePictureURL),
//               ),
//             SizedBox(height: 20),
//             Text('Username: $_username'),
//             Text('Email: $_email'),
//             Text('School Name: $_schoolName'),
//             Text('Principal Email: $_principalEmail'),
//             if (_class.isNotEmpty) Text('Class: $_class'),
//             if (_rollNumber.isNotEmpty) Text('Roll Number: $_rollNumber'),
//             if (_subject.isNotEmpty) Text('Subject: $_subject'),
//           ],
//         ),
//       ),
//     );
//   }
// }


// // profile.dart
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'edit_profile.dart';
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   late User _user;
//   late String _username = '';
//   late String _email = '';
//   late String _profilePictureURL = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _user = _auth.currentUser!;
//     _loadUserProfile();
//   }
//
//   Future<void> _loadUserProfile() async {
//     DocumentSnapshot doc =
//     await _firestore.collection('users').doc(_user.uid).get();
//
//     Map<String, dynamic>? userData = doc.data() as Map<String, dynamic>?;
//
//     if (userData != null) {
//       _username = userData['username'] ?? '';
//       _email = userData['email'] ?? '';
//       _profilePictureURL = userData['profilePictureURL'] ?? '';
//     }
//     }
//   }
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('User Profile'),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.edit),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => EditProfilePage()),
//             );
//           },
//         ),
//         IconButton(
//           icon: Icon(Icons.logout),
//           onPressed: () {
//             _auth.signOut();
//             // Navigate to login page
//           },
//         ),
//       ],
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           if (_profilePictureURL.isNotEmpty)
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: NetworkImage(_profilePictureURL),
//             ),
//           SizedBox(height: 20),
//           Text('Username: $_username'),
//           Text('Email: $_email'),
//         ],
//       ),
//     ),
//   );
// }
//


// profile.dart

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'edit_profile.dart';
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late User _user;
//   bool _isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _getUserData();
//   }
//
//   Future<void> _getUserData() async {
//     setState(() {
//       _isLoading = true;
//     });
//     _user = _auth.currentUser!;
//     setState(() {
//       _isLoading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               // Implement logout functionality
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => EditProfilePage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: AssetImage('assets/default_profile.jpg'),
//               // Display profile photo
//             ),
//             SizedBox(height: 10),
//             Text(
//               _user.displayName ?? 'User Name',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'User Description',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'User Posts',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             StreamBuilder(
//               stream: _firestore
//                   .collection('posts')
//                   .where('userId', isEqualTo: _user.uid)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return CircularProgressIndicator();
//                 }
//                 if (!snapshot.hasData || snapshot.data?.docs.length == 0) {
//                   return Text('No posts yet');
//                 }
//                 return Column(
//                   children: snapshot.data!.docs.map<Widget>((doc) {
//                     Map<String, dynamic> post = doc.data();
//                     return ListTile(
//                       title: Text(post['title']),
//                       subtitle: Text(post['description']),
//                       // Display other post information
//                     );
//                   }).toList(),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Container(
//               padding: EdgeInsets.all(20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: 60.0,
//                     backgroundImage: AssetImage('assets/garginew.jfif'),
//                   ),
//                   SizedBox(height: 20.0),
//                   Text(
//                     'Gargi Versha',
//                     style: TextStyle(
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10.0),
//                   Text(
//                     'Bio information here...',
//                     style: TextStyle(
//                       fontSize: 16.0,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               title: Text('Posts'),
//               subtitle: Text('10'),
//             ),
//             Divider(),
//             ListTile(
//               title: Text('Followers'),
//               subtitle: Text('100'),
//             ),
//             Divider(),
//             ListTile(
//               title: Text('Following'),
//               subtitle: Text('50'),
//             ),
//             Divider(),
//             // Add more profile details as needed
//           ],
//         ),
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
//
// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               // Implement logout functionality
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {
//               // Navigate to edit profile page
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Container(
//               padding: EdgeInsets.all(20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle follower button press
//                     },
//                     child: Text('Followers'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle following button press
//                     },
//                     child: Text('Following'),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: 60.0,
//                     backgroundImage: AssetImage('assets/garginew.jfif'),
//                   ),
//                   SizedBox(height: 20.0),
//                   Text(
//                     'Username',
//                     style: TextStyle(
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10.0),
//                   Text(
//                     'Bio information here...',
//                     style: TextStyle(
//                       fontSize: 16.0,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Divider(),
//             // Add more profile details as needed
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   late User _user;
//   late Map<String, dynamic> _userData;
//
//   @override
//   void initState() {
//     super.initState();
//     _getUserData();
//   }
//
//   Future<void> _getUserData() async {
//     _user = _auth.currentUser!;
//     DocumentSnapshot userSnapshot = await _firestore
//         .collection('schools')
//         .doc(_user.uid)
//         .get(); // Assuming user data is stored directly under 'schools' collection with UID as document ID
//     setState(() {
//       _userData = userSnapshot.data() as Map<String, dynamic>;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: _userData == null
//           ? Center(
//         child: CircularProgressIndicator(),
//       )
//           : SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Name: ${_userData['name']}'),
//             Text('Email: ${_userData['email']}'),
//             Text('Contact Number: ${_userData['contactNumber']}'),
//             _userData['isTeacher']
//                 ? Text('Subjects: ${_userData['subjects']}')
//                 : Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Class: ${_userData['class']}'),
//                 Text('Roll Number: ${_userData['rollNumber']}'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});
//
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   late User _user;
//   Map<String, dynamic>? _userData;
//
//   @override
//   void initState() {
//     super.initState();
//     _getUserData();
//   }
//
//   Future<void> _getUserData() async {
//     _user = _auth.currentUser!;
//     DocumentSnapshot userSnapshot = await _firestore
//         .collection('schools')
//         .doc(_user.uid)
//         .get(); // Assuming user data is stored directly under 'schools' collection with UID as document ID
//     setState(() {
//       _userData = userSnapshot.data() as Map<String, dynamic>?;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//       ),
//       body: _userData == null
//           ? const Center(
//         child: CircularProgressIndicator(),
//       )
//           : SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Name: ${_userData!['name']}'),
//             Text('Email: ${_userData!['email']}'),
//             Text('Contact Number: ${_userData!['contactNumber']}'),
//             _userData!['isTeacher']
//                 ? Text('Subjects: ${_userData!['subjects']}')
//                 : Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Class: ${_userData!['class']}'),
//                 Text('Roll Number: ${_userData!['rollNumber']}'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     List<Widget> profileWidgets = [];
//
//     if (user != null) {
//       for (final providerProfile in user.providerData) {
//         // ID of the provider (google.com, apple.com, etc.)
//         final provider = providerProfile.providerId;
//
//         // UID specific to the provider
//         final uid = providerProfile.uid;
//
//         // Name, email address, and profile photo URL
//         final name = providerProfile.displayName;
//         final emailAddress = providerProfile.email;
//         final profilePhoto = providerProfile.photoURL;
//
//         profileWidgets.add(
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 radius: 80,
//                 backgroundImage: NetworkImage(profilePhoto ?? ''),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 name ?? '',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 emailAddress ?? '',
//                 style: TextStyle(fontSize: 18, color: Colors.grey),
//               ),
//               SizedBox(height: 20),
//             ],
//           ),
//         );
//       }
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: profileWidgets.isNotEmpty
//               ? profileWidgets
//               : [Text('No profile data available')],
//         ),
//       ),
//     );
//   }
// }
//

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:edpal/screens/edit_profile.dart';
// import 'package:edpal/screens/login.dart';
//
// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     List<Widget> profileWidgets = [];
//
//     if (user != null) {
//       for (final providerProfile in user.providerData) {
//         // ID of the provider (google.com, apple.com, etc.)
//         final provider = providerProfile.providerId;
//
//         // UID specific to the provider
//         final uid = providerProfile.uid;
//
//         // Name, email address, and profile photo URL
//         final name = providerProfile.displayName;
//         final emailAddress = providerProfile.email;
//         final profilePhoto = providerProfile.photoURL;
//
//         profileWidgets.add(
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 radius: 80,
//                 backgroundImage: NetworkImage(profilePhoto ?? ''),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 name ?? '',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 emailAddress ?? '',
//                 style: TextStyle(fontSize: 18, color: Colors.grey),
//               ),
//               SizedBox(height: 20),
//             ],
//           ),
//         );
//       }
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 //MaterialPageRoute(builder: (context) => EditProfilePage()),
//                 MaterialPageRoute(builder: (context) =>  UpdateProfile()),
//               );
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginPage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: profileWidgets.isNotEmpty
//               ? profileWidgets
//               : [Text('No profile data available')],
//         ),
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:edpal/screens/edit_profile.dart';
// import 'package:edpal/screens/login.dart';
//
// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     List<Widget> profileWidgets = [];
//
//     if (user != null) {
//       for (final providerProfile in user.providerData) {
//         // ID of the provider (google.com, apple.com, etc.)
//         final provider = providerProfile.providerId;
//
//         // UID specific to the provider
//         final uid = providerProfile.uid;
//
//         // Name, email address, and profile photo URL
//         final name = providerProfile.displayName;
//         final emailAddress = providerProfile.email;
//         final profilePhoto = providerProfile.photoURL;
//
//         profileWidgets.add(
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: 20),
//               CircleAvatar(
//                 radius: 80,
//                 backgroundImage: NetworkImage(profilePhoto ?? ''),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 name ?? '',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 emailAddress ?? '',
//                 style: TextStyle(fontSize: 18, color: Colors.grey),
//               ),
//             ],
//           ),
//         );
//       }
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => UpdateProfile()),
//               );
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginPage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: profileWidgets.isNotEmpty
//               ? profileWidgets
//               : [Text('No profile data available')],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:edpal/screens/edit_profile.dart';
// import 'package:edpal/screens/login.dart';
//
// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     CollectionReference users = FirebaseFirestore.instance.collection('users');
//     List<Widget> profileWidgets = [];
//
//     if (user != null) {
//       for (final providerProfile in user.providerData) {
//         final emailAddress = providerProfile.email;
//
//         profileWidgets.add(
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: 20),
//               CircleAvatar(
//                 radius: 80,
//                 backgroundImage: NetworkImage(providerProfile.photoURL ?? ''),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 providerProfile.displayName ?? '',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 emailAddress ?? '',
//                 style: TextStyle(fontSize: 18, color: Colors.grey),
//               ),
//             ],
//           ),
//         );
//
//         users.doc(user.uid).get().then((DocumentSnapshot documentSnapshot) {
//           if (documentSnapshot.exists) {
//             Map<String, dynamic> userData = documentSnapshot.data() as Map<String, dynamic>;
//             userData.forEach((key, value) {
//               profileWidgets.add(Text('$key: $value'));
//             });
//           } else {
//             profileWidgets.add(Text('No additional user data available'));
//           }
//         }).catchError((error) {
//           print('Error retrieving user data: $error');
//           profileWidgets.add(Text('Error retrieving user data'));
//         });
//       }
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => UpdateProfile()),
//               );
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginPage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: profileWidgets.isNotEmpty
//               ? profileWidgets
//               : [Text('No profile data available')],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edpal/screens/edit_profile.dart';
import 'package:edpal/screens/login.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    List<Widget> profileWidgets = [];

    if (user != null) {
      for (final providerProfile in user.providerData) {
        final emailAddress = providerProfile.email;

        profileWidgets.add(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(providerProfile.photoURL ?? ''),
              ),
              SizedBox(height: 20),
              Text(
                providerProfile.displayName ?? '',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                emailAddress ?? '',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
        );

        // Fetch additional user data from Firestore
        users.doc(user.uid).get().then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            Map<String, dynamic> userData = documentSnapshot.data() as Map<String, dynamic>;
            // Check if user is a teacher or student based on data stored in Firestore
            final userType = userData['userType']; // Assuming 'userType' field exists
            if (userType == 'teacher') {
              // Display teacher-specific data
              profileWidgets.add(Text('Teacher Specific Data'));
            } else if (userType == 'student') {
              // Display student-specific data
              profileWidgets.add(Text('Student Specific Data'));
            } else {
              // Handle other user types or scenarios
              profileWidgets.add(Text('Unknown User Type'));
            }
          } else {
            profileWidgets.add(Text('No additional user data available'));
          }
        }).catchError((error) {
          print('Error retrieving user data: $error');
          profileWidgets.add(Text('Error retrieving user data'));
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdateProfile()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: profileWidgets.isNotEmpty
              ? profileWidgets
              : [Text('No profile data available')],
        ),
      ),
    );
  }
}
