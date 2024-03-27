// import 'package:flutter/material.dart';
// import 'package:edpal/screens/post.dart'; // Import the Post class
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class PostPage extends StatelessWidget {
//   final TextEditingController _contentController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Post'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _contentController,
//               decoration: InputDecoration(
//                 labelText: 'Post Content',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _savePostToFirestore(context);
//               },
//               child: Text('Post'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _savePostToFirestore(BuildContext context) async {
//     // Get the current user ID from wherever you store it
//     String userId = ''; // Replace '' with your logic to get user ID
//
//     // Get content from text field
//     String content = _contentController.text;
//
//     // You need to add logic to upload images and get their URLs
//     List<String> imageUrls = []; // For now, empty list
//
//     // Create a Post object
//     Post newPost = Post(
//       userId: userId,
//       content: content,
//       imageUrls: imageUrls,
//     );
//
//     // Save the post to Firestore
//     try {
//       await FirebaseFirestore.instance.collection('posts').add(newPost.toMap());
//       // Show a success message or navigate back to previous screen
//       Navigator.pop(context); // Go back to the previous screen
//     } catch (error) {
//       // Show an error message
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Error'),
//             content: Text('Failed to post. Please try again later.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
// }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class PostPage extends StatefulWidget {
//   @override
//   _PostPageState createState() => _PostPageState();
// }
//
// class _PostPageState extends State<PostPage> {
//   final TextEditingController _contentController = TextEditingController();
//   List<File> _imageList = [];
//   final picker = ImagePicker();
//
//   Future<void> _getImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _imageList.add(File(pickedFile.path));
//       });
//     }
//   }
//
//   void _removeImage(int index) {
//     setState(() {
//       _imageList.removeAt(index);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Post'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _contentController,
//               decoration: InputDecoration(
//                 labelText: 'Write something...',
//                 border: OutlineInputBorder(),
//               ),
//               maxLines: null, // Allow multiple lines for content
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: GridView.builder(
//                 itemCount: _imageList.length + 1,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   mainAxisSpacing: 8.0,
//                   crossAxisSpacing: 8.0,
//                 ),
//                 itemBuilder: (BuildContext context, int index) {
//                   if (index == _imageList.length) {
//                     return GestureDetector(
//                       onTap: _getImage,
//                       child: Container(
//                         color: Colors.grey[300],
//                         child: Icon(Icons.add),
//                       ),
//                     );
//                   } else {
//                     return Stack(
//                       children: [
//                         Image.file(
//                           _imageList[index],
//                           fit: BoxFit.cover,
//                         ),
//                         Positioned(
//                           top: 0,
//                           right: 0,
//                           child: GestureDetector(
//                             onTap: () => _removeImage(index),
//                             child: CircleAvatar(
//                               backgroundColor: Colors.red,
//                               radius: 12,
//                               child: Icon(
//                                 Icons.close,
//                                 color: Colors.white,
//                                 size: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   }
//                 },
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Add logic to save post to Firestore
//               },
//               child: Text('Post'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class PostPage extends StatefulWidget {
//   @override
//   _PostPageState createState() => _PostPageState();
// }
//
// class _PostPageState extends State<PostPage> {
//   final TextEditingController _contentController = TextEditingController();
//   List<File> _imageList = [];
//   final picker = ImagePicker();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<void> _getImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _imageList.add(File(pickedFile.path));
//       });
//     }
//   }
//
//   void _removeImage(int index) {
//     setState(() {
//       _imageList.removeAt(index);
//     });
//   }
//
//   Future<void> _savePost() async {
//     final currentUser = _auth.currentUser;
//     if (currentUser != null) {
//       final userEmail = currentUser.email;
//       final content = _contentController.text;
//       final List<String> imageUrls = [];
//
//       // Upload images to Firestore and get their URLs
//       for (final imageFile in _imageList) {
//         final imageRef = FirebaseStorage.instance.ref().child('post_images').child('${DateTime.now().millisecondsSinceEpoch}');
//         await imageRef.putFile(imageFile);
//         final imageUrl = await imageRef.getDownloadURL();
//         imageUrls.add(imageUrl);
//       }
//
//       // Save post data to Firestore
//       await _firestore.collection('posts').add({
//         'userEmail': userEmail,
//         'content': content,
//         'imageUrls': imageUrls,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//
//       // Clear content and images after posting
//       _contentController.clear();
//       setState(() {
//         _imageList.clear();
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Post'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _contentController,
//               decoration: InputDecoration(
//                 labelText: 'Write something...',
//                 border: OutlineInputBorder(),
//               ),
//               maxLines: null, // Allow multiple lines for content
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: GridView.builder(
//                 itemCount: _imageList.length + 1,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   mainAxisSpacing: 8.0,
//                   crossAxisSpacing: 8.0,
//                 ),
//                 itemBuilder: (BuildContext context, int index) {
//                   if (index == _imageList.length) {
//                     return GestureDetector(
//                       onTap: _getImage,
//                       child: Container(
//                         color: Colors.grey[300],
//                         child: Icon(Icons.add),
//                       ),
//                     );
//                   } else {
//                     return Stack(
//                       children: [
//                         Image.file(
//                           _imageList[index],
//                           fit: BoxFit.cover,
//                         ),
//                         Positioned(
//                           top: 0,
//                           right: 0,
//                           child: GestureDetector(
//                             onTap: () => _removeImage(index),
//                             child: CircleAvatar(
//                               backgroundColor: Colors.red,
//                               radius: 12,
//                               child: Icon(
//                                 Icons.close,
//                                 color: Colors.white,
//                                 size: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   }
//                 },
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _savePost,
//               child: Text('Post'),
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
//
// class PostPage extends StatefulWidget {
//   @override
//   _PostPageState createState() => _PostPageState();
// }
//
// class _PostPageState extends State<PostPage> {
//   late File _image;
//   final picker = ImagePicker();
//   TextEditingController _descriptionController = TextEditingController();
//
//   Future getImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   Future<void> _uploadImageAndPost() async {
//     if (_image == null || _descriptionController.text.isEmpty) {
//       // Handle case where image is not selected or description is empty
//       return;
//     }
//
//     try {
//       // Upload image to Firebase Storage
//       Reference storageReference =
//       FirebaseStorage.instance.ref().child('posts/${DateTime.now()}.png');
//       UploadTask uploadTask = storageReference.putFile(_image);
//       await uploadTask.whenComplete(() => null);
//
//       // Get image URL
//       String imageUrl = await storageReference.getDownloadURL();
//
//       // Post data to Firestore
//       await FirebaseFirestore.instance.collection('posts').add({
//         'description': _descriptionController.text,
//         'imageUrl': imageUrl,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//
//       // Clear controllers and image
//       _descriptionController.clear();
//       setState(() {
//         _image = null;
//       });
//
//       // Navigate to home page or any other page you want
//       Navigator.pop(context);
//     } catch (e) {
//       // Handle error
//       print('Error uploading image and posting: $e');
//       // You can show a snackbar or dialog to inform the user about the error
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Post'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             _image != null
//                 ? Image.file(
//               _image,
//               height: 200,
//               width: 200,
//               fit: BoxFit.cover,
//             )
//                 : Placeholder(
//               fallbackHeight: 200,
//               fallbackWidth: 200,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: getImage,
//               child: Text('Select Image'),
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               controller: _descriptionController,
//               decoration: InputDecoration(
//                 labelText: 'Description',
//                 border: OutlineInputBorder(),
//               ),
//               maxLines: 3,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _uploadImageAndPost,
//               child: Text('Post'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final TextEditingController _contentController = TextEditingController();
  final List<File> _imageList = [];
  final picker = ImagePicker();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageList.add(File(pickedFile.path));
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _imageList.removeAt(index);
    });
  }

  Future<void> _savePost() async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      final userEmail = currentUser.email;
      final content = _contentController.text;
      final List<String> imageUrls = [];

      // Upload images to Firestore and get their URLs
      for (final imageFile in _imageList) {
        final imageRef = FirebaseStorage.instance.ref().child('post_images').child('${DateTime.now().millisecondsSinceEpoch}');
        await imageRef.putFile(imageFile);
        final imageUrl = await imageRef.getDownloadURL();
        imageUrls.add(imageUrl);
      }

      // Save post data to Firestore
      await _firestore.collection('posts').add({
        'userEmail': userEmail,
        'content': content,
        'imageUrls': imageUrls,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Clear content and images after posting
      _contentController.clear();
      setState(() {
        _imageList.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(
                labelText: 'Write something...',
                border: OutlineInputBorder(),
              ),
              maxLines: null, // Allow multiple lines for content
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: _imageList.length + 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (index == _imageList.length) {
                    return GestureDetector(
                      onTap: _getImage,
                      child: Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.add),
                      ),
                    );
                  } else {
                    return Stack(
                      children: [
                        Image.file(
                          _imageList[index],
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => _removeImage(index),
                            child: const CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 12,
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _savePost,
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:edpal/models/user.dart';
// import 'package:edpal/screens/view_image.dart';
// import 'package:edpal/services/services.dart';
// import 'package:edpal/utils/firebase.dart';
// import 'package:uuid/uuid.dart';
//
// class PostService extends Service {
//   String postId = Uuid().v4();
//
// //uploads profile picture to the users collection
//   uploadProfilePicture(File image, User user) async {
//     String link = await uploadImage(profilePic, image);
//     var ref = usersRef.doc(user.uid);
//     ref.update({
//       "photoUrl": link,
//     });
//   }
//
// //uploads post to the post collection
//   uploadPost(File image, String location, String description) async {
//     String link = await uploadImage(posts, image);
//     DocumentSnapshot doc =
//     await usersRef.doc(firebaseAuth.currentUser!.uid).get();
//     user = UserModel.fromJson(
//       doc.data() as Map<String, dynamic>,
//     );
//     var ref = postRef.doc();
//     ref.set({
//       "id": ref.id,
//       "postId": ref.id,
//       "username": user!.username,
//       "ownerId": firebaseAuth.currentUser!.uid,
//       "mediaUrl": link,
//       "description": description ?? "",
//       "location": location ?? "Wooble",
//       "timestamp": Timestamp.now(),
//     }).catchError((e) {
//       print(e);
//     });
//   }
//
// //upload a comment
//   uploadComment(String currentUserId, String comment, String postId,
//       String ownerId, String mediaUrl) async {
//     DocumentSnapshot doc = await usersRef.doc(currentUserId).get();
//     user = UserModel.fromJson(doc.data() as Map<String, dynamic>);
//     await commentRef.doc(postId).collection("comments").add({
//       "username": user!.username,
//       "comment": comment,
//       "timestamp": Timestamp.now(),
//       "userDp": user!.photoUrl,
//       "userId": user!.id,
//     });
//     bool isNotMe = ownerId != currentUserId;
//     if (isNotMe) {
//       addCommentToNotification("comment", comment, user!.username!, user!.id!,
//           postId, mediaUrl, ownerId, user!.photoUrl!);
//     }
//   }
//
// //add the comment to notification collection
//   addCommentToNotification(
//       String type,
//       String commentData,
//       String username,
//       String userId,
//       String postId,
//       String mediaUrl,
//       String ownerId,
//       String userDp) async {
//     await notificationRef.doc(ownerId).collection('notifications').add({
//       "type": type,
//       "commentData": commentData,
//       "username": username,
//       "userId": userId,
//       "userDp": userDp,
//       "postId": postId,
//       "mediaUrl": mediaUrl,
//       "timestamp": Timestamp.now(),
//     });
//   }
//
// //add the likes to the notfication collection
//   addLikesToNotification(String type, String username, String userId,
//       String postId, String mediaUrl, String ownerId, String userDp) async {
//     await notificationRef
//         .doc(ownerId)
//         .collection('notifications')
//         .doc(postId)
//         .set({
//       "type": type,
//       "username": username,
//       "userId": firebaseAuth.currentUser!.uid,
//       "userDp": userDp,
//       "postId": postId,
//       "mediaUrl": mediaUrl,
//       "timestamp": Timestamp.now(),
//     });
//   }
//
//   //remove likes from notification
//   removeLikeFromNotification(
//       String ownerId, String postId, String currentUser) async {
//     bool isNotMe = currentUser != ownerId;
//
//     if (isNotMe) {
//       DocumentSnapshot doc = await usersRef.doc(currentUser).get();
//       user = UserModel.fromJson(doc.data() as Map<String, dynamic>);
//       notificationRef
//           .doc(ownerId)
//           .collection('notifications')
//           .doc(postId)
//           .get()
//           .then((doc) => {
//         if (doc.exists) {doc.reference.delete()}
//       });
//     }
//   }
// }
//
//
//


