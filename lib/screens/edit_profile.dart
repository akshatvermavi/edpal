// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
//
// class EditProfilePage extends StatefulWidget {
//   final Map<String, dynamic> userData;
//
//   const EditProfilePage({Key? key, required this.userData}) : super(key: key);
//
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   late User _currentUser;
//   late TextEditingController _nameController;
//   late TextEditingController _schoolNameController;
//   late File? _imageFile;
//   bool _isUploading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _currentUser = _auth.currentUser!;
//     _nameController = TextEditingController(text: widget.userData['name']);
//     _schoolNameController = TextEditingController(text: widget.userData['schoolName']);
//   }
//
//   Future<void> _uploadProfilePicture() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedImage != null) {
//       setState(() {
//         _imageFile = File(pickedImage.path);
//       });
//     }
//   }
//
//   Future<void> _saveProfileChanges() async {
//     setState(() {
//       _isUploading = true;
//     });
//
//     try {
//       // Upload profile picture if changed
//       String? profilePictureUrl;
//       if (_imageFile != null) {
//         String fileName = _currentUser.uid + '_profile.jpg';
//         Reference storageRef = FirebaseStorage.instance.ref().child('profile_images/$fileName');
//         UploadTask uploadTask = storageRef.putFile(_imageFile!);
//         await uploadTask.whenComplete(() async {
//           profilePictureUrl = await storageRef.getDownloadURL();
//         });
//       }
//
//       // Update user data in Firestore
//       await _firestore.collection('users').doc(_currentUser.uid).update({
//         'name': _nameController.text,
//         'schoolName': _schoolNameController.text,
//         if (profilePictureUrl != null) 'profilePicture': profilePictureUrl,
//       });
//
//       // Refresh user data in parent page
//       Navigator.pop(context);
//     } catch (e) {
//       print('Error saving profile changes: $e');
//       // Handle error
//     } finally {
//       setState(() {
//         _isUploading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//       ),
//       body: _isUploading
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             GestureDetector(
//               onTap: _uploadProfilePicture,
//               child: CircleAvatar(
//                 radius: 50,
//                 // backgroundImage: _imageFile != null
//                 //     ? FileImage(_imageFile!)
//                 //     : NetworkImage(widget.userData['profilePicture'] ?? ''),
//                 child: _imageFile == null && widget.userData['profilePicture'] == null
//                     ? Icon(Icons.add_a_photo)
//                     : null,
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _schoolNameController,
//               decoration: InputDecoration(labelText: 'School Name'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _saveProfileChanges,
//               child: Text('Save Changes'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//upr wala data last used hai
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:ionicons/ionicons.dart';
// import 'package:loading_overlay/loading_overlay.dart';
// import 'package:provider/provider.dart';
// import 'package:ic_launcher.png/components/text_form_builder.dart';
// import 'package:ic_launcher.png/models/user_profile.dart';
// import 'package:ic_launcher.png/utils/firebase.dart';
// import 'package:ic_launcher.png/utils/validation.dart';
// import 'package:ic_launcher.png/models/profile/edit_profile_view_model.dart';
// import 'package:ic_launcher.png/widgets/indicators.dart';
//
// class EditProfile extends StatefulWidget {
//   final UserModel? user;
//
//   const EditProfile({this.user});
//
//   @override
//   _EditProfileState createState() => _EditProfileState();
// }
//
// class _EditProfileState extends State<EditProfile> {
//   UserModel? user;
//
//   String currentUid() {
//     return firebaseAuth.currentUser!.uid;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     EditProfileViewModel viewModel = Provider.of<EditProfileViewModel>(context);
//     return LoadingOverlay(
//       progressIndicator: circularProgress(context),
//       isLoading: viewModel.loading,
//       child: Scaffold(
//         key: viewModel.scaffoldKey,
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text("Edit Profile"),
//           actions: [
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 25.0),
//                 child: GestureDetector(
//                   onTap: () => viewModel.editProfile(context),
//                   child: Text(
//                     'SAVE',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w900,
//                       fontSize: 15.0,
//                       color: Theme.of(context).colorScheme.secondary,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         body: ListView(
//           children: [
//             Center(
//               child: GestureDetector(
//                 onTap: () => viewModel.pickImage(),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color: Colors.transparent,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.3),
//                         offset: new Offset(0.0, 0.0),
//                         blurRadius: 2.0,
//                         spreadRadius: 0.0,
//                       ),
//                     ],
//                   ),
//                   child: viewModel.imgLink != null
//                       ? Padding(
//                     padding: const EdgeInsets.all(1.0),
//                     child: CircleAvatar(
//                       radius: 65.0,
//                       backgroundImage: NetworkImage(viewModel.imgLink!),
//                     ),
//                   )
//                       : viewModel.image == null
//                       ? Padding(
//                     padding: const EdgeInsets.all(1.0),
//                     child: CircleAvatar(
//                       radius: 65.0,
//                       backgroundImage:
//                       NetworkImage(widget.user!.photoUrl!),
//                     ),
//                   )
//                       : Padding(
//                     padding: const EdgeInsets.all(1.0),
//                     child: CircleAvatar(
//                       radius: 65.0,
//                       backgroundImage: FileImage(viewModel.image!),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10.0),
//             buildForm(viewModel, context)
//           ],
//         ),
//       ),
//     );
//   }
//
//   buildForm(EditProfileViewModel viewModel, BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Form(
//         key: viewModel.formKey,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             TextFormBuilder(
//               enabled: !viewModel.loading,
//               initialValue: widget.user!.username,
//               prefix: Ionicons.person_outline,
//               hintText: "Username",
//               textInputAction: TextInputAction.next,
//               validateFunction: Validations.validateName,
//               onSaved: (String val) {
//                 viewModel.setUsername(val);
//               },
//             ),
//             SizedBox(height: 10.0),
//             TextFormBuilder(
//               initialValue: widget.user!.country,
//               enabled: !viewModel.loading,
//               prefix: Ionicons.pin_outline,
//               hintText: "Country",
//               textInputAction: TextInputAction.next,
//               validateFunction: Validations.validateName,
//               onSaved: (String val) {
//                 viewModel.setCountry(val);
//               },
//             ),
//             SizedBox(height: 10.0),
//             Text(
//               "Bio",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             TextFormField(
//               maxLines: null,
//               initialValue: widget.user!.bio,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               validator: (String? value) {
//                 if (value!.length > 1000) {
//                   return 'Bio must be short';
//                 }
//                 return null;
//               },
//               onSaved: (String? val) {
//                 viewModel.setBio(val!);
//               },
//               onChanged: (String val) {
//                 viewModel.setBio(val);
//               },
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
// class EditProfilePage extends StatelessWidget {
//   final User? user;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   EditProfilePage({Key? key, required this.user}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Form fields for editing profile data
//             // You can use TextFormField or other form fields
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Update profile data in Firestore
//           // You can use firestore.update() or firestore.set() to update user data
//           Navigator.pop(context); // Navigate back to ProfilePage after saving
//         },
//         child: Icon(Icons.save),
//       ),
//     );
//   }
// }

// edit_profile.dart
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
// class EditProfilePage extends StatefulWidget {
//   const EditProfilePage({super.key});
//
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   final TextEditingController _usernameController = TextEditingController();
//   File? _profilePicture;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_profilePicture != null)
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: FileImage(_profilePicture!),
//               ),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement logic to pick an image from gallery
//               },
//               child: const Text('Upload Profile Picture'),
//             ),
//             TextField(
//               controller: _usernameController,
//               decoration: const InputDecoration(labelText: 'Username'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _updateUserProfile();
//                 Navigator.pop(context);
//               },
//               child: const Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _updateUserProfile() async {
//     String newUsername = _usernameController.text;
//     User? user = _auth.currentUser;
//     if (user != null) {
//       await _firestore.collection('users').doc(user.uid).update({
//         'username': newUsername,
//       });
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class EditProfilePage extends StatefulWidget {
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//               enabled: false, // Disable email editing
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Update profile logic
//                 String newName = _nameController.text;
//                 FirebaseFirestore.instance
//                     .collection('users')
//                     .doc(user?.email)
//                     .update({'name': newName});
//                 // You can add logic here to upload and update the profile photo as well
//               },
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     final user = FirebaseAuth.instance.currentUser;
//     _nameController.text = user?.displayName ?? '';
//     _emailController.text = user?.email ?? '';
//   }
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }
// }

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:image_picker/image_picker.dart';
//
// class UpdateProfile extends StatefulWidget {
//   @override
//   _UpdateProfileState createState() => _UpdateProfileState();
// }
//
// class _UpdateProfileState extends State<UpdateProfile> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   User? user = FirebaseAuth.instance.currentUser;
//   late String _imageUrl;
//   final picker = ImagePicker();
//
//   Future getImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imageUrl = pickedFile.path;
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   Future updateProfile() async {
//     if (_imageUrl != null) {
//       await user?.updatePhotoURL(_imageUrl);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Profile updated successfully!'),
//       ));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Please select an image first.'),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _imageUrl != null
//                 ? SizedBox(
//               height: 100.0,
//               width: 100.0,
//               child: Image.file(File(_imageUrl)),
//             )
//                 : Container(),
//             ElevatedButton(
//               onPressed: getImage,
//               child: Text('Select Image'),
//             ),
//             ElevatedButton(
//               onPressed: updateProfile,
//               child: Text('Update Profile'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:image_picker/image_picker.dart';
//
// class UpdateProfile extends StatefulWidget {
//   @override
//   _UpdateProfileState createState() => _UpdateProfileState();
// }
//
// class _UpdateProfileState extends State<UpdateProfile> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   User? user = FirebaseAuth.instance.currentUser;
//   String _imageUrl = '';
//   final picker = ImagePicker();
//
//   Future getImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imageUrl = pickedFile.path!;
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   Future updateProfile() async {
//     if (_imageUrl.isNotEmpty) {
//       await user?.updatePhotoURL(_imageUrl);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Profile updated successfully!'),
//       ));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Please select an image first.'),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _imageUrl.isNotEmpty
//                 ? SizedBox(
//               height: 100.0,
//               width: 100.0,
//               child: Image.network(_imageUrl),
//             )
//                 : Container(),
//             ElevatedButton(
//               onPressed: getImage,
//               child: Text('Select Image'),
//             ),
//             ElevatedButton(
//               onPressed: updateProfile,
//               child: Text('Update Profile'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:image_picker/image_picker.dart';
//
// class UpdateProfile extends StatefulWidget {
//   @override
//   _UpdateProfileState createState() => _UpdateProfileState();
// }
//
// class _UpdateProfileState extends State<UpdateProfile> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   User? user = FirebaseAuth.instance.currentUser;
//   String _imageUrl = '';
//   final picker = ImagePicker();
//
//   Future getImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imageUrl = pickedFile.path!;
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   Future updateProfile() async {
//     if (_imageUrl.isNotEmpty) {
//       await user?.updatePhotoURL(_imageUrl);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Profile updated successfully!'),
//       ));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Please select an image first.'),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               width: 100.0,
//               height: 100.0,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                   image: _imageUrl.isNotEmpty ? NetworkImage(_imageUrl) : AssetImage('assets/placeholder_image.jpg') as ImageProvider,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: getImage,
//               child: Text('Select Image'),
//             ),
//             ElevatedButton(
//               onPressed: updateProfile,
//               child: Text('Update Profile'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:image_picker/image_picker.dart';
//
// class UpdateProfile extends StatefulWidget {
//   @override
//   _UpdateProfileState createState() => _UpdateProfileState();
// }
//
// class _UpdateProfileState extends State<UpdateProfile> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   User? user = FirebaseAuth.instance.currentUser;
//   String _imageUrl = '';
//   final picker = ImagePicker();
//
//   Future getImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imageUrl = pickedFile.path!;
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   Future updateProfile() async {
//     if (_imageUrl.isNotEmpty) {
//       await user?.updatePhotoURL(_imageUrl);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Profile updated successfully!'),
//       ));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Please select an image first.'),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               width: 100.0,
//               height: 100.0,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                   image: _imageUrl.isNotEmpty ? NetworkImage(_imageUrl) : AssetImage('assets/placeholder_image.jpg') as ImageProvider,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(4.0),
//               ),
//               child: ElevatedButton(
//                 onPressed: getImage,
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.transparent,
//                   onPrimary: Colors.white,
//                   shadowColor: Colors.transparent,
//                 ),
//                 child: Text('Select Image'),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(4.0),
//               ),
//               child: ElevatedButton(
//                 onPressed: updateProfile,
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.transparent,
//                   onPrimary: Colors.white,
//                   shadowColor: Colors.transparent,
//                 ),
//                 child: Text('Update Profile'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class UpdateProfile extends StatefulWidget {
//   @override
//   _UpdateProfileState createState() => _UpdateProfileState();
// }
//
// class _UpdateProfileState extends State<UpdateProfile> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   User? user = FirebaseAuth.instance.currentUser;
//   String _imageUrl = '';
//   final picker = ImagePicker();
//
//   Future getImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imageUrl = pickedFile.path!;
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   Future updateProfile() async {
//     if (_imageUrl.isNotEmpty) {
//       await user?.updatePhotoURL(_imageUrl);
//
//       // Save the updated profile picture in Firestore
//       CollectionReference users = FirebaseFirestore.instance.collection('users');
//       users.doc(user!.uid).update({
//         'photoURL': _imageUrl,
//       });
//
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Profile updated successfully!'),
//       ));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Please select an image first.'),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               width: 100.0,
//               height: 100.0,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                   image: _imageUrl.isNotEmpty ? NetworkImage(_imageUrl) : AssetImage('assets/placeholder_image.jpg') as ImageProvider,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(4.0),
//               ),
//               child: ElevatedButton(
//                 onPressed: getImage,
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white, backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                 ),
//                 child: Text('Select Image'),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(4.0),
//               ),
//               child: ElevatedButton(
//                 onPressed: updateProfile,
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white, backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                 ),
//                 child: Text('Update Profile'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import "package:flutter/material.dart";
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ic_launcher.png/main.dart'; //for currentUserModel & googleSignIn instance
// import 'package:ic_launcher.png/screens/user_profile.dart';
// class CurrentUserModel {
//   final String id;
//   final String displayName;
//   final String email;
//   final String photoUrl;
//   final String bio;
//
//   CurrentUserModel({
//     required this.id,
//     required this.displayName,
//     required this.email,
//     required this.photoUrl,
//     required this.bio,
//   });
// }
//
// class EditProfilePage extends StatelessWidget {
//   // final TextEditingController nameController = TextEditingController();
//   // final TextEditingController bioController = TextEditingController();
//   final CurrentUserModel currentUserModel;
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController bioController = TextEditingController();
//
//   EditProfilePage({required this.currentUserModel});
//
//   applyChanges() {
//     FirebaseFirestore.instance
//         .collection('insta_users')
//         .doc(currentUserModel.id)
//         .update({
//       "displayName": nameController.text,
//       "bio": bioController.text,
//     });
//   }
//
//   Widget buildTextField({String name = "", TextEditingController? controller}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(top: 12.0),
//           child: Text(
//             name,
//             style: TextStyle(color: Colors.grey),
//           ),
//         ),
//         TextField(
//           controller: controller,
//           decoration: InputDecoration(
//             hintText: name,
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (currentUserModel.id == null) {
//       // Handle the case where currentUserModel.id is null, for example, show a loading indicator or an error message
//       return CircularProgressIndicator();
//     }
//
//     return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//       future: FirebaseFirestore.instance
//           .collection('insta_users')
//           .doc(currentUserModel.id)
//           .get(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData)
//           return Container(
//             alignment: FractionalOffset.center,
//             child: CircularProgressIndicator(),
//           );
//
//         User user = User.fromDocument(snapshot.data!);
//
//         nameController.text = user.displayName;
//         bioController.text = user.bio;
//
//         return Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
//               child: CircleAvatar(
//                 backgroundImage: NetworkImage(currentUserModel.photoUrl),
//                 radius: 50.0,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: <Widget>[
//                   buildTextField(name: "Name", controller: nameController),
//                   buildTextField(name: "Bio", controller: bioController),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: MaterialButton(
//                 onPressed: applyChanges,
//                 child: Text("Save Changes"),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ic_launcher.png/main.dart'; //for currentUserModel & googleSignIn instance
// import 'package:ic_launcher.png/screens/user_profile.dart';
//
// class CurrentUserModel {
//   final String id;
//   final String displayName;
//   final String email;
//   final String photoUrl;
//   final String bio;
//
//   CurrentUserModel({
//     required this.id,
//     required this.displayName,
//     required this.email,
//     required this.photoUrl,
//     required this.bio,
//   });
// }
//
// class EditProfilePage extends StatelessWidget {
//   final CurrentUserModel currentUserModel;
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController bioController = TextEditingController();
//
//   EditProfilePage({required this.currentUserModel});
//
//   applyChanges() {
//     FirebaseFirestore.instance
//         .collection('insta_users')
//         .doc(currentUserModel.id)
//         .update({
//       "displayName": nameController.text,
//       "bio": bioController.text,
//     });
//   }
//
//   Widget buildTextField({String name = "", TextEditingController? controller}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(top: 12.0),
//           child: Text(
//             name,
//             style: TextStyle(color: Colors.grey),
//           ),
//         ),
//         TextField(
//           controller: controller,
//           decoration: InputDecoration(
//             hintText: name,
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("Current user ID: ${currentUserModel.id}");
//
//     if (currentUserModel.id == null) {
//       // Handle the case where currentUserModel.id is null
//       return CircularProgressIndicator();
//     }
//
//     return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//       future: FirebaseFirestore.instance
//           .collection('insta_users')
//           .doc(currentUserModel.id)
//           .get(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData)
//           return Container(
//             alignment: FractionalOffset.center,
//             child: CircularProgressIndicator(),
//           );
//
//         User user = User.fromDocument(snapshot.data!);
//
//         nameController.text = user.displayName;
//         bioController.text = user.bio;
//
//         return Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
//               child: CircleAvatar(
//                 backgroundImage: NetworkImage(currentUserModel.photoUrl),
//                 radius: 50.0,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: <Widget>[
//                   buildTextField(name: "Name", controller: nameController),
//                   buildTextField(name: "Bio", controller: bioController),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: MaterialButton(
//                 onPressed: applyChanges,
//                 child: Text("Save Changes"),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
// import 'dart:io';
// import 'package:ic_launcher.png/screens/user_profile.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
//
// class EditProfilePage extends StatefulWidget {
//   final CurrentUserModel currentUserModel;
//
//   EditProfilePage({required this.currentUserModel});
//
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController bioController = TextEditingController();
//     File? _image;
//     FirebaseAuth _auth = FirebaseAuth.instance;
//     User? user = FirebaseAuth.instance.currentUser;
//     String _imageUrl = '';
//    final picker = ImagePicker();
//
//   Future getImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imageUrl = pickedFile.path!;
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   applyChanges() {
//     if (_image != null) {
//       FirebaseStorage.instance
//           .ref()
//           .child('profile_photos/${widget.currentUserModel.id}')
//           .putFile(_image!)
//           .then((value) {
//         value.ref.getDownloadURL().then((downloadURL) {
//           FirebaseFirestore.instance
//               .collection('insta_users')
//               .doc(widget.currentUserModel.id)
//               .update({
//             "displayName": nameController.text,
//             "bio": bioController.text,
//             "photoUrl": downloadURL,
//           });
//         });
//       });
//     } else {
//       FirebaseFirestore.instance
//           .collection('insta_users')
//           .doc(widget.currentUserModel.id)
//           .update({
//         "displayName": nameController.text,
//         "bio": bioController.text,
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     nameController.text = widget.currentUserModel.displayName;
//     bioController.text = widget.currentUserModel.bio;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // CircleAvatar(
//             //   backgroundImage: _image != null ? FileImage(_image!) : NetworkImage(widget.currentUserModel.photoUrl),
//             //   radius: 50.0,
//             // ),
//             Container(
//               width: 100.0,
//               height: 100.0,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                   image: _imageUrl.isNotEmpty ? NetworkImage(_imageUrl) : AssetImage('assets/placeholder_image.jpg') as ImageProvider,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: <Widget>[
//                   buildTextField(name: "Name", controller: nameController),
//                   buildTextField(name: "Bio", controller: bioController),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ElevatedButton(
//                       onPressed: getImage,
//                       child: Text("Choose Image"),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: MaterialButton(
//                 onPressed: applyChanges,
//                 child: Text("Save Changes"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildTextField({String name = "", TextEditingController? controller}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(top: 12.0),
//           child: Text(
//             name,
//             style: TextStyle(color: Colors.grey),
//           ),
//         ),
//         TextField(
//           controller: controller,
//           decoration: InputDecoration(
//             hintText: name,
//           ),
//         ),
//       ],
//     );
//   }
// }

//below code is latest
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class UpdateProfile extends StatefulWidget {
//   @override
//   _UpdateProfileState createState() => _UpdateProfileState();
// }
//
// class _UpdateProfileState extends State<UpdateProfile> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   User? user = FirebaseAuth.instance.currentUser;
//   String _imageUrl = '';
//   String _bio = ''; // Added field for bio
//   final picker = ImagePicker();
//
//   Future getImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imageUrl = pickedFile.path;
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   Future updateProfile() async {
//     if (_imageUrl.isNotEmpty && _bio.isNotEmpty) { // Ensure both image and bio are provided
//       await user?.updatePhotoURL(_imageUrl);
//
//       // Save the updated profile picture and bio in Firestore
//       CollectionReference users = FirebaseFirestore.instance.collection('users');
//       users.doc(user!.uid).update({
//         'photoURL': _imageUrl,
//         'bio': _bio, // Update the bio field
//       });
//
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Profile updated successfully!'),
//       ));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Please select an image and provide a bio.'),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               width: 100.0,
//               height: 100.0,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                   image: _imageUrl.isNotEmpty ? NetworkImage(_imageUrl) : AssetImage('assets/placeholder_image.jpg') as ImageProvider,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(4.0),
//               ),
//               child: ElevatedButton(
//                 onPressed: getImage,
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white, backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                 ),
//                 child: Text('Select Image'),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField( // Add TextField for bio input
//               onChanged: (value) {
//                 _bio = value;
//               },
//               decoration: InputDecoration(
//                 hintText: 'Enter your bio',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(4.0),
//               ),
//               child: ElevatedButton(
//                 onPressed: updateProfile,
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white, backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                 ),
//                 child: Text('Update Profile'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:io'; // Add this import statement
//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
// class UpdateProfile extends StatefulWidget {
//   @override
//   _UpdateProfileState createState() => _UpdateProfileState();
// }
//
// class _UpdateProfileState extends State<UpdateProfile> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   User? user = FirebaseAuth.instance.currentUser;
//   String _imageUrl = '';
//   final picker = ImagePicker();
//
//   Future getImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imageUrl = pickedFile.path;
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   Future updateProfile() async {
//     if (_imageUrl.isNotEmpty) {
//       Reference storageReference = FirebaseStorage.instance.ref().child('profile_images/${user!.uid}');
//       UploadTask uploadTask = storageReference.putFile(File(_imageUrl));
//       await uploadTask.whenComplete(() => null);
//       String downloadURL = await storageReference.getDownloadURL();
//
//       await user?.updatePhotoURL(downloadURL);
//
//       // Save the updated profile picture in Firestore
//       CollectionReference users = FirebaseFirestore.instance.collection('users');
//       users.doc(user!.uid).update({
//         'photoURL': downloadURL,
//       });
//
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Profile updated successfully!'),
//       ));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Please select an image first.'),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               width: 100.0,
//               height: 100.0,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                   image: _imageUrl.isNotEmpty ? FileImage(File(_imageUrl)) : AssetImage('assets/placeholder_image.jpg') as ImageProvider,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(4.0),
//               ),
//               child: ElevatedButton(
//                 onPressed: getImage,
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white, backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                 ),
//                 child: Text('Select Image'),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(4.0),
//               ),
//               child: ElevatedButton(
//                 onPressed: updateProfile,
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white, backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                 ),
//                 child: Text('Update Profile'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'profile_model.dart';
// import 'profile_service.dart';
//
// class EditProfilePage extends StatefulWidget {
//   final ProfileModel? profile;
//
//   const EditProfilePage({Key? key, required this.profile}) : super(key: key);
//
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   late TextEditingController _bioController;
//
//   @override
//   void initState() {
//     super.initState();
//     _bioController = TextEditingController(text: widget.profile?.bio ?? '');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: widget.profile != null && widget.profile!.imageUrl.isNotEmpty
//                   ? NetworkImage(widget.profile!.imageUrl)
//                   : null,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _bioController,
//               maxLines: 4,
//               decoration: InputDecoration(labelText: 'Bio'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _saveProfile();
//               },
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _saveProfile() async {
//     try {
//       if (widget.profile != null) {
//         // Update profile information
//         widget.profile!.bio = _bioController.text;
//
//         // Save the updated profile
//         await ProfileService.updateProfile(widget.profile!);
//
//         // Close the edit profile page
//         Navigator.pop(context, true);
//       }
//     } catch (e) {
//       print('Error saving profile: $e');
//       // Show an error message to the user
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Error saving profile. Please try again later.'),
//       ));
//     }
//   }
// }


// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'profile_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class EditProfilePage extends StatefulWidget {
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   User? user = FirebaseAuth.instance.currentUser;
//   final ImagePicker _picker = ImagePicker();
//   String? _imagePath;
//   String _bio = '';
//   String _imageUrl = '';
//
//   final picker = ImagePicker();
//     Future getImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imageUrl = pickedFile.path;
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   void _editBio(String newBio) {
//     setState(() {
//       _bio = newBio;
//     });
//   }
//
//   Future<String> _uploadImage(String imagePath) async {
//     Reference ref = FirebaseStorage.instance.ref().child('profile_images/${DateTime.now().toString()}');
//     UploadTask uploadTask = ref.putFile(File(imagePath));
//     TaskSnapshot snapshot = await uploadTask;
//     return await snapshot.ref.getDownloadURL();
//   }
//
//   Future<void> _saveData() async {
//     if (_imagePath != null && _bio.isNotEmpty) {
//       String imageUrl = await _uploadImage(_imagePath!);
//
//       // Save data to Firestore
//       FirebaseFirestore.instance.collection('profiles').doc(FirebaseAuth.instance.currentUser!.uid).update({
//         'imageUrl': imageUrl,
//         'bio': _bio,
//       });
//     } else {
//       // Handle the case when either the image or bio is not provided
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               backgroundImage: _imagePath != null ? FileImage(File(_imagePath!)) : null,
//               radius: 50,
//             ),
//             ElevatedButton(
//               onPressed: getImage,
//               child: Text('Select Image'),
//             ),
//             TextField(
//               onChanged: _editBio,
//               decoration: InputDecoration(labelText: 'Bio'),
//               maxLines: null,
//             ),
//             ElevatedButton(
//               onPressed: _saveData,
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'profile_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class EditProfilePage extends StatefulWidget {
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   User? user = FirebaseAuth.instance.currentUser;
//   final ImagePicker _picker = ImagePicker();
//   String? _imagePath;
//   String _bio = '';
//   String _imageUrl = '';
//
//   Future getImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imagePath = pickedFile.path; // Update _imagePath with the selected image path
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   void _editBio(String newBio) {
//     setState(() {
//       _bio = newBio;
//     });
//   }
//
//   Future<String> _uploadImage(String imagePath) async {
//     Reference ref = FirebaseStorage.instance.ref().child('profile_images/${DateTime.now().toString()}');
//     UploadTask uploadTask = ref.putFile(File(imagePath));
//     TaskSnapshot snapshot = await uploadTask;
//     return await snapshot.ref.getDownloadURL();
//   }
//
//   Future<void> _saveData() async {
//     if (_imagePath != null && _bio.isNotEmpty) {
//       String imageUrl = await _uploadImage(_imagePath!);
//
//       // Save data to Firestore
//       FirebaseFirestore.instance.collection('profiles').doc(FirebaseAuth.instance.currentUser!.uid).update({
//         'imageUrl': imageUrl,
//         'bio': _bio,
//       });
//     } else {
//       print('Image or bio not provided.'); // Add a message for debugging
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               backgroundImage: _imagePath != null ? FileImage(File(_imagePath!)) : null,
//               radius: 50,
//             ),
//             ElevatedButton(
//               onPressed: getImage,
//               child: Text('Select Image'),
//             ),
//             TextField(
//               onChanged: _editBio,
//               decoration: InputDecoration(labelText: 'Bio'),
//               maxLines: null,
//             ),
//             ElevatedButton(
//               onPressed: _saveData,
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'profile_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// class EditProfilePage extends StatefulWidget {
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   User? user = FirebaseAuth.instance.currentUser;
//   final ImagePicker _picker = ImagePicker();
//   String? _imagePath;
//   String _name = '';
//   String _email = '';
//   String _bio = '';
//   String _imageUrl = '';
//
//   Future getImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imagePath = pickedFile.path; // Update _imagePath with the selected image path
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   void _editName(String newName) {
//     setState(() {
//       _name = newName;
//     });
//   }
//
//   void _editEmail(String newEmail) {
//     setState(() {
//       _email = newEmail;
//     });
//   }
//
//   void _editBio(String newBio) {
//     setState(() {
//       _bio = newBio;
//     });
//   }
//
//   Future<String> _uploadImage(String imagePath) async {
//     Reference ref = FirebaseStorage.instance.ref().child('profile_images/${DateTime.now().toString()}');
//     UploadTask uploadTask = ref.putFile(File(imagePath));
//     TaskSnapshot snapshot = await uploadTask;
//     return await snapshot.ref.getDownloadURL();
//   }
//
//   Future<void> _saveData() async {
//     if (_name.isNotEmpty && _email.isNotEmpty && _bio.isNotEmpty) {
//       String imageUrl = await _uploadImage(_imagePath!);
//
//       // Save data to Firestore
//       Profile profile = Profile(
//         id: user!.uid,
//         name: _name,
//         email: _email,
//         bio: _bio,
//         imageUrl: imageUrl,
//       );
//
//       FirebaseFirestore.instance.collection('profiles').doc(user!.uid).set(profile.toMap());
//     } else {
//       print('Name, email, or bio not provided.'); // Add a message for debugging
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               backgroundImage: _imagePath != null ? FileImage(File(_imagePath!)) : null,
//               radius: 50,
//             ),
//             TextField(
//               onChanged: _editName,
//               decoration: InputDecoration(labelText: 'Name'),
//               maxLines: null,
//             ),
//             TextField(
//               onChanged: _editEmail,
//               decoration: InputDecoration(labelText: 'Email'),
//               maxLines: null,
//             ),
//             TextField(
//               onChanged: _editBio,
//               decoration: InputDecoration(labelText: 'Bio'),
//               maxLines: null,
//             ),
//             ElevatedButton(
//               onPressed: _saveData,
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'profile_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// class EditProfilePage extends StatefulWidget {
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   User? user = FirebaseAuth.instance.currentUser;
//   final ImagePicker _picker = ImagePicker();
//   String? _imagePath;
//   String _name = '';
//   String _email = '';
//   String _bio = '';
//   String _imageUrl = '';
//
//   Future getImage(ImageSource source) async {
//     final pickedFile = await _picker.pickImage(source: source);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imagePath = pickedFile.path; // Update _imagePath with the selected image path
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   void _editName(String newName) {
//     setState(() {
//       _name = newName;
//     });
//   }
//
//   void _editEmail(String newEmail) {
//     setState(() {
//       _email = newEmail;
//     });
//   }
//
//   void _editBio(String newBio) {
//     setState(() {
//       _bio = newBio;
//     });
//   }
//
//   Future<String> _uploadImage(String imagePath) async {
//     Reference ref = FirebaseStorage.instance.ref().child('profile_images/${DateTime.now().toString()}');
//     UploadTask uploadTask = ref.putFile(File(imagePath));
//     TaskSnapshot snapshot = await uploadTask;
//     return await snapshot.ref.getDownloadURL();
//   }
//   Future<void> _saveData() async {
//     if (_name.isNotEmpty && _email.isNotEmpty && _bio.isNotEmpty) {
//       String imageUrl = await _uploadImage(_imagePath!);
//
//       // Save data to Firestore
//       Profile profile = Profile(
//         id: user!.uid,
//         name: _name,
//         email: _email,
//         bio: _bio,
//         imageUrl: imageUrl,
//       );
//
//       try {
//         await FirebaseFirestore.instance.collection('profiles').doc(user!.uid).set(profile.toMap());
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Profile updated successfully'),
//             backgroundColor: Colors.green,
//           ),
//         );
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error updating profile: $e'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } else {
//       print('Name, email, or bio not provided.'); // Add a message for debugging
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               backgroundImage: _imagePath != null ? FileImage(File(_imagePath!)) : null,
//               radius: 50,
//             ),
//             TextField(
//               onChanged: _editName,
//               decoration: InputDecoration(labelText: 'Name'),
//               maxLines: null,
//             ),
//             TextField(
//               onChanged: _editEmail,
//               decoration: InputDecoration(labelText: 'Email'),
//               maxLines: null,
//             ),
//             TextField(
//               onChanged: _editBio,
//               decoration: InputDecoration(labelText: 'Bio'),
//               maxLines: null,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 FloatingActionButton(
//                   heroTag: null,
//                   onPressed: () {
//                     getImage(ImageSource.gallery);
//                   },
//                   child: Icon(Icons.photo_library),
//                 ),
//                 FloatingActionButton(
//                   heroTag: null,
//                   onPressed: () {
//                     getImage(ImageSource.camera);
//                   },
//                   child: Icon(Icons.camera_alt),
//                 ),
//               ],
//             ),
//             ElevatedButton(
//               onPressed: _saveData,
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'profile_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class EditProfilePage extends StatefulWidget {
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   User? user = FirebaseAuth.instance.currentUser;
//   final ImagePicker _picker = ImagePicker();
//   String? _imagePath;
//   String _name = '';
//   String _email = '';
//   String _bio = '';
//
//   Future getImage(ImageSource source) async {
//     final pickedFile = await _picker.pickImage(source: source);
//
//     setState(() {
//       if (pickedFile != null) {
//         _imagePath = pickedFile.path; // Update _imagePath with the selected image path
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   void _editName(String newName) {
//     setState(() {
//       _name = newName;
//     });
//   }
//
//   void _editEmail(String newEmail) {
//     setState(() {
//       _email = newEmail;
//     });
//   }
//
//   void _editBio(String newBio) {
//     setState(() {
//       _bio = newBio;
//     });
//   }
//
//   Future<String> _uploadImage(String imagePath) async {
//     Reference ref = FirebaseStorage.instance.ref().child('profile_images/${DateTime.now().toString()}');
//     UploadTask uploadTask = ref.putFile(File(imagePath));
//     TaskSnapshot snapshot = await uploadTask;
//     return await snapshot.ref.getDownloadURL();
//   }
//
//   Future<void> _saveData() async {
//     if (_name.isNotEmpty && _email.isNotEmpty && _bio.isNotEmpty) {
//       String imageUrl = await _uploadImage(_imagePath ?? '');
//
//       // Save data to Firestore
//       Profile profile = Profile(
//         id: user!.uid,
//         name: _name,
//         email: _email,
//         bio: _bio,
//         imageUrl: imageUrl,
//       );
//
//       try {
//         await FirebaseFirestore.instance.collection('profiles').doc(user!.uid).set(profile.toMap());
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Profile updated successfully'),
//             backgroundColor: Colors.green,
//           ),
//         );
//
//         // Navigate back to ProfilePage with the updated profile
//         Navigator.pop(context, profile);
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error updating profile: $e'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } else {
//       print('Name, email, or bio not provided.'); // Add a message for debugging
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               backgroundImage: _imagePath != null ? FileImage(File(_imagePath!)) : null,
//               radius: 50,
//             ),
//             TextField(
//               onChanged: _editName,
//               decoration: InputDecoration(labelText: 'Name'),
//               maxLines: null,
//             ),
//             TextField(
//               onChanged: _editEmail,
//               decoration: InputDecoration(labelText: 'Email'),
//               maxLines: null,
//             ),
//             TextField(
//               onChanged: _editBio,
//               decoration: InputDecoration(labelText: 'Bio'),
//               maxLines: null,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 FloatingActionButton(
//                   heroTag: null,
//                   onPressed: () {
//                     getImage(ImageSource.gallery);
//                   },
//                   child: Icon(Icons.photo_library),
//                 ),
//                 FloatingActionButton(
//                   heroTag: null,
//                   onPressed: () {
//                     getImage(ImageSource.camera);
//                   },
//                   child: Icon(Icons.camera_alt),
//                 ),
//               ],
//             ),
//             ElevatedButton(
//               onPressed: _saveData,
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  final ImagePicker _picker = ImagePicker();
  String? _imagePath;
  String _name = '';
  String _email = '';
  String _bio = '';

  Future getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imagePath = pickedFile.path; // Update _imagePath with the selected image path
      } else {
        print('No image selected.');
      }
    });
  }

  void _editName(String newName) {
    setState(() {
      _name = newName;
    });
  }

  void _editEmail(String newEmail) {
    setState(() {
      _email = newEmail;
    });
  }

  void _editBio(String newBio) {
    setState(() {
      _bio = newBio;
    });
  }

  Future<String> _uploadImage(String imagePath) async {
    final currentUser = _auth.currentUser;
    // if (currentUser != null) {
      final userEmail = currentUser?.email;
    //Reference ref = FirebaseStorage.instance.ref().child('profile_images/${DateTime.now().toString()}');
    Reference ref = FirebaseStorage.instance.ref().child('profile_images/$userEmail/${DateTime.now().toString()}');
    UploadTask uploadTask = ref.putFile(File(imagePath));
    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }

  Future<void> _saveData() async {
    if (_name.isNotEmpty && _email.isNotEmpty && _bio.isNotEmpty) {
      String imageUrl = await _uploadImage(_imagePath ?? '');

      // Save data to Firestore
      Profile profile = Profile(
        id: user!.uid,
        name: _name,
        email: _email,
        bio: _bio,
        imageUrl: imageUrl,
      );

      try {
        await FirebaseFirestore.instance.collection('profiles').doc(user!.uid).set(profile.toMap());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Profile updated successfully'),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate back to ProfilePage with the updated profile
        Navigator.pop(context, profile);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating profile: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
     // print('Name, email, or bio not provided.'); // Add a message for debugging
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Name, email, or bio not provided'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: _imagePath != null ? FileImage(File(_imagePath!)) : null,
              radius: 50,
            ),
            TextField(
              onChanged: _editName,
              decoration: InputDecoration(labelText: 'Name'),
              maxLines: null,
            ),
            TextField(
              onChanged: _editEmail,
              decoration: InputDecoration(labelText: 'Email'),
              maxLines: null,
            ),
            TextField(
              onChanged: _editBio,
              decoration: InputDecoration(labelText: 'Bio'),
              maxLines: null,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                  child: Icon(Icons.photo_library),
                ),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                  child: Icon(Icons.camera_alt),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _saveData,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
