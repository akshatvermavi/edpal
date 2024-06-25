import 'dart:io';

// Import Firebase packages
// import 'package:edpal/screens/post_username_form.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:edpal/screens/post_username_form.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

// Import the Post model
import 'post.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final TextEditingController _contentController = TextEditingController();
  final List<File> _imageList = [];
  final picker = ImagePicker();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

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

      // Upload images to Firebase Storage and get their URLs
      for (int i = 0; i < _imageList.length; i++) {
        final File image = _imageList[i];
        final Reference ref = _storage.ref().child('posts/$userEmail/${DateTime.now().millisecondsSinceEpoch}_$i.jpg');
        final UploadTask uploadTask = ref.putFile(image);
        final TaskSnapshot downloadUrl = await uploadTask.whenComplete(() {});
        final String url = await downloadUrl.ref.getDownloadURL();
        imageUrls.add(url);
      }

      // Show UserNameForm to allow users to enter their name
      showDialog(
        context: context,
        builder: (context) {
          return UserNameForm(
            onSave: (name) {
              _savePostWithName(userEmail!, name, content, imageUrls);
            },
          );
        },
      );
    } else {
      // Handle case when currentUser is null
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User not authenticated. Please log in to create a post.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _savePostWithName(String userEmail, String userName, String content, List<String> imageUrls) async {
    try {
      // Save post data to Firestore
      final postDocRef = await _firestore.collection('posts').add({
        'userId': userEmail ?? 'unknown@example.com',
        'userName': userName,
        'content': content,
        'imageUrls': imageUrls,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Post successfully created!'),
          duration: Duration(seconds: 2),
        ),
      );

      // Clear content and images after posting
      _contentController.clear();
      setState(() {
        _imageList.clear();
      });
    } catch (error) {
      // Handle error if post couldn't be saved
      print('Error saving post: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create post. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    // Build UI
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        backgroundColor: Colors.lightBlueAccent,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // IconButton(
                //   onPressed: () {
                //     // Handle like functionality
                //   },
                //   icon: const Icon(Icons.favorite_border),
                // ),
                ElevatedButton(
                  onPressed: _savePost,
                  child: const Text('Post'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

