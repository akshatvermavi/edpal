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
// import 'package:edpal/components/text_form_builder.dart';
// import 'package:edpal/models/user.dart';
// import 'package:edpal/utils/firebase.dart';
// import 'package:edpal/utils/validation.dart';
// import 'package:edpal/models/profile/edit_profile_view_model.dart';
// import 'package:edpal/widgets/indicators.dart';
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


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  String _imageUrl = '';
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageUrl = pickedFile.path!;
      } else {
        print('No image selected.');
      }
    });
  }

  Future updateProfile() async {
    if (_imageUrl.isNotEmpty) {
      await user?.updatePhotoURL(_imageUrl);

      // Save the updated profile picture in Firestore
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      users.doc(user!.uid).update({
        'photoURL': _imageUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Profile updated successfully!'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please select an image first.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: _imageUrl.isNotEmpty ? NetworkImage(_imageUrl) : AssetImage('assets/placeholder_image.jpg') as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: ElevatedButton(
                onPressed: getImage,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text('Select Image'),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: ElevatedButton(
                onPressed: updateProfile,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text('Update Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}