// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import 'post.dart';
//
// class FeedPage extends StatefulWidget {
//   const FeedPage({Key? key}) : super(key: key);
//
//   @override
//   _FeedPageState createState() => _FeedPageState();
// }
//
// class _FeedPageState extends State<FeedPage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _firestore.collection('posts').orderBy('timestamp', descending: true).snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }
//
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//
//           return ListView(
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//               return PostWidget(
//                 post: Post(
//                   id: document.id, // Pass the document ID as the post ID
//                   userId: data['userId'] ?? 'Unknown', // Handle null case for userId
//                   content: data['content'] ?? '',
//                   imageUrls: List<String>.from(data['imageUrls'] ?? []),
//                 ),
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class PostWidget extends StatefulWidget {
//   final Post post;
//
//   const PostWidget({Key? key, required this.post}) : super(key: key);
//
//   @override
//   _PostWidgetState createState() => _PostWidgetState();
// }
//
// class _PostWidgetState extends State<PostWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.post.userId,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             Text(widget.post.content),
//             const SizedBox(height: 8.0),
//             if (widget.post.imageUrls.isNotEmpty)
//               SizedBox(
//                 height: 200,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: widget.post.imageUrls.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 8.0),
//                       child: Image.network(
//                         widget.post.imageUrls[index],
//                         fit: BoxFit.cover,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             const SizedBox(height: 16.0),
//             Row(
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     // Handle like functionality
//                   },
//                   icon: const Icon(Icons.favorite_border),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     // Handle comment functionality
//                   },
//                   icon: const Icon(Icons.comment),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ic_launcher.png/screens/comment.dart';
// import 'package:ic_launcher.png/screens/like.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import 'post.dart';
//
// class FeedPage extends StatefulWidget {
//   const FeedPage({Key? key}) : super(key: key);
//
//   @override
//   _FeedPageState createState() => _FeedPageState();
// }
//
// class _FeedPageState extends State<FeedPage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _firestore.collection('posts').orderBy('timestamp', descending: true).snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }
//
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//
//           return ListView(
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//               return PostWidget(
//                 post: Post(
//                   id: document.id,
//                   userId: data['userId'] ?? 'Unknown',
//                   content: data['content'] ?? '',
//                   imageUrls: List<String>.from(data['imageUrls'] ?? []),
//                 ),
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class PostWidget extends StatefulWidget {
//   final Post post;
//
//   const PostWidget({Key? key, required this.post}) : super(key: key);
//
//   @override
//   _PostWidgetState createState() => _PostWidgetState();
// }
//
// class _PostWidgetState extends State<PostWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.post.userId,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             Text(widget.post.content),
//             const SizedBox(height: 8.0),
//             if (widget.post.imageUrls.isNotEmpty)
//               SizedBox(
//                 height: 200,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: widget.post.imageUrls.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 8.0),
//                       child: Image.network(
//                         widget.post.imageUrls[index],
//                         fit: BoxFit.cover,
//                         loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
//                           if (loadingProgress == null) {
//                             return child;
//                           }
//                           return Center(
//                             child: CircularProgressIndicator(
//                               value: loadingProgress.expectedTotalBytes != null
//                                   ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
//                                   : null,
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             const SizedBox(height: 16.0),
//             Row(
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     // Handle like functionality
//                     //Like(userId: '');
//                   },
//                   icon: const Icon(Icons.favorite_border),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     // Handle comment functionality
//                     //Comment();
//                   },
//                   icon: const Icon(Icons.comment),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import 'post.dart';
// import 'like.dart';
// import 'comment.dart';
//
// class FeedPage extends StatefulWidget {
//   const FeedPage({Key? key}) : super(key: key);
//
//   @override
//   _FeedPageState createState() => _FeedPageState();
// }
//
// class _FeedPageState extends State<FeedPage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _firestore.collection('posts').orderBy('timestamp', descending: true).snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }
//
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//
//           return ListView(
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//               return PostWidget(
//                 post: Post(
//                   id: document.id,
//                   userId: data['userId'] ?? 'Unknown',
//                   content: data['content'] ?? '',
//                   imageUrls: List<String>.from(data['imageUrls'] ?? []),
//                 ),
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class PostWidget extends StatefulWidget {
//   final Post post;
//
//   const PostWidget({Key? key, required this.post}) : super(key: key);
//
//   @override
//   _PostWidgetState createState() => _PostWidgetState();
// }
//
// class _PostWidgetState extends State<PostWidget> {
//   bool _isLiked = false;
//
//   @override
//   void initState() {
//   super.initState();
//   _checkIfLiked();
//   }
//
//   Future<void> _checkIfLiked() async {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final currentUser = _auth.currentUser;
//   if (currentUser != null) {
//   final likeQuery = await FirebaseFirestore.instance
//       .collection('likes')
//       .where('postId', isEqualTo: widget.post.id)
//       .where('userId', isEqualTo: currentUser.uid)
//       .get();
//   setState(() {
//   _isLiked = likeQuery.docs.isNotEmpty;
//   });
//   }
//   }
//
//   Future<void> _toggleLike() async {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final currentUser = _auth.currentUser;
//   if (currentUser != null) {
//   final like = Like(
//   userId: currentUser.uid,
//   postId: widget.post.id,
//   );
//
//   if (_isLiked) {
//   await like.removeLike();
//   } else {
//   await like.addLike();
//   }
//
//   setState(() {
//   _isLiked = !_isLiked;
//     });
//    }
//   }
//
//   Future<void> _addComment() async {
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     final currentUser = _auth.currentUser;
//     if (currentUser != null) {
//       final commentContent = await showModalBottomSheet<String>(
//         context: context,
//         builder: (BuildContext context) {
//           final TextEditingController controller = TextEditingController();
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: controller,
//                   decoration: const InputDecoration(
//                     hintText: 'Write a comment...',
//                   ),
//                   maxLines: null,
//                 ),
//                 const SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context, controller.text.trim());
//                   },
//                   child: const Text('Submit'),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//
//       if (commentContent != null && commentContent.isNotEmpty) {
//         final comment = Comment(
//           userId: currentUser.uid,
//           postId: widget.post.id,
//           content: commentContent,
//           timestamp: DateTime.now(),
//         );
//         await comment.addComment(context); // Pass the BuildContext
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.post.userId,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             Text(widget.post.content),
//             const SizedBox(height: 8.0),
//             if (widget.post.imageUrls.isNotEmpty)
//               SizedBox(
//                 height: 200,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: widget.post.imageUrls.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 8.0),
//                       child: Image.network(
//                         widget.post.imageUrls[index],
//                         fit: BoxFit.cover,
//                         loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
//                           if (loadingProgress == null) {
//                             return child;
//                           }
//                           return Center(
//                             child: CircularProgressIndicator(
//                               value: loadingProgress.expectedTotalBytes != null
//                                   ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
//                                   : null,
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             const SizedBox(height: 16.0),
//             Row(
//               children: [
//                 IconButton(
//                   onPressed: _toggleLike,
//                   icon: Icon(
//                     _isLiked ? Icons.favorite : Icons.favorite_border,
//                     color: _isLiked ? Colors.red : null,
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: _addComment,
//                   icon: const Icon(Icons.comment),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'post.dart';
// import 'like.dart';
// import 'comment.dart';
//
// class FeedPage extends StatefulWidget {
//   const FeedPage({Key? key}) : super(key: key);
//
//   @override
//   _FeedPageState createState() => _FeedPageState();
// }
//
// class _FeedPageState extends State<FeedPage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _firestore.collection('posts').orderBy('timestamp', descending: true).snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }
//
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//
//           return ListView(
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//               return PostWidget(
//                 post: Post(
//                   id: document.id,
//                   userId: data['userId'] ?? 'Unknown',
//                   content: data['content'] ?? '',
//                   imageUrls: List<String>.from(data['imageUrls'] ?? []),
//                 ),
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class PostWidget extends StatefulWidget {
//   final Post post;
//
//   const PostWidget({Key? key, required this.post}) : super(key: key);
//
//   @override
//   _PostWidgetState createState() => _PostWidgetState();
// }
//
// class _PostWidgetState extends State<PostWidget> {
//   bool _isLiked = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _checkIfLiked();
//   }
//
//   Future<void> _checkIfLiked() async {
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     final currentUser = _auth.currentUser;
//     if (currentUser != null) {
//       final likeQuery = await FirebaseFirestore.instance
//           .collection('likes')
//           .where('postId', isEqualTo: widget.post.id)
//           .where('userId', isEqualTo: currentUser.uid)
//           .get();
//       setState(() {
//         _isLiked = likeQuery.docs.isNotEmpty;
//       });
//     }
//   }
//
//   Future<void> _toggleLike() async {
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     final currentUser = _auth.currentUser;
//     if (currentUser != null) {
//       final like = Like(
//         userId: currentUser.uid,
//         postId: widget.post.id,
//       );
//
//       if (_isLiked) {
//         await like.removeLike();
//       } else {
//         await like.addLike();
//       }
//
//       setState(() {
//         _isLiked = !_isLiked;
//       });
//     }
//   }
//
//   Future<void> _addComment() async {
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     final currentUser = _auth.currentUser;
//     if (currentUser != null) {
//       final commentContent = await showModalBottomSheet<String>(
//         context: context,
//         builder: (BuildContext context) {
//           final TextEditingController controller = TextEditingController();
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: controller,
//                   decoration: const InputDecoration(
//                     hintText: 'Write a comment...',
//                   ),
//                   maxLines: null,
//                 ),
//                 const SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context, controller.text.trim());
//                   },
//                   child: const Text('Submit'),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//
//       if (commentContent != null && commentContent.isNotEmpty) {
//         final comment = Comment(
//           userId: currentUser.uid,
//           postId: widget.post.id,
//           content: commentContent,
//           timestamp: DateTime.now(),
//         );
//         await comment.addComment(context); // Pass the BuildContext
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.post.userId,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             Text(widget.post.content),
//             const SizedBox(height: 8.0),
//             if (widget.post.imageUrls.isNotEmpty)
//               SizedBox(
//                 height: 200,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: widget.post.imageUrls.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 8.0),
//                       child: Image.network(
//                         widget.post.imageUrls[index],
//                         fit: BoxFit.cover,
//                         loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
//                           if (loadingProgress == null) {
//                             return child;
//                           }
//                           return Center(
//                             child: CircularProgressIndicator(
//                               value: loadingProgress.expectedTotalBytes != null
//                                   ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
//                                   : null,
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             const SizedBox(height: 16.0),
//             Row(
//               children: [
//                 IconButton(
//                   onPressed: _toggleLike,
//                   icon: Icon(
//                     _isLiked ? Icons.favorite : Icons.favorite_border,
//                     color: _isLiked ? Colors.red : null,
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: _addComment,
//                   icon: const Icon(Icons.comment),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'post.dart';
// import 'like.dart';
// import 'comment.dart';
//
// class FeedPage extends StatefulWidget {
//   const FeedPage({Key? key}) : super(key: key);
//
//   @override
//   _FeedPageState createState() => _FeedPageState();
// }
//
// class _FeedPageState extends State<FeedPage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _firestore.collection('posts').orderBy('timestamp', descending: true).snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }
//
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//
//           return ListView(
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//               return PostWidget(
//                 post: Post(
//                   id: document.id,
//                   userId: data['userId'] ?? 'Unknown',
//                   content: data['content'] ?? '',
//                   imageUrls: List<String>.from(data['imageUrls'] ?? []),
//                 ),
//                 refreshFeed: () {
//                   setState(() {}); // Refresh the feed when necessary
//                 },
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class PostWidget extends StatefulWidget {
//   final Post post;
//   final Function refreshFeed; // Add this line
//
//   const PostWidget({Key? key, required this.post, required this.refreshFeed}) : super(key: key);
//
//   @override
//   _PostWidgetState createState() => _PostWidgetState();
// }
//
// class _PostWidgetState extends State<PostWidget> {
//   bool _isLiked = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _checkIfLiked();
//   }
//
//   Future<void> _checkIfLiked() async {
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     final currentUser = _auth.currentUser;
//     if (currentUser != null) {
//       final likeQuery = await FirebaseFirestore.instance
//           .collection('likes')
//           .where('postId', isEqualTo: widget.post.id)
//           .where('userId', isEqualTo: currentUser.uid)
//           .get();
//       setState(() {
//         _isLiked = likeQuery.docs.isNotEmpty;
//       });
//     }
//   }
//
//   Future<void> _toggleLike() async {
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     final currentUser = _auth.currentUser;
//     if (currentUser != null) {
//       final like = Like(
//         userId: currentUser.uid,
//         postId: widget.post.id,
//       );
//
//       if (_isLiked) {
//         await like.removeLike();
//       } else {
//         await like.addLike();
//       }
//
//       setState(() {
//         _isLiked = !_isLiked;
//       });
//
//       // Refresh the feed after toggling like
//       widget.refreshFeed();
//     }
//   }
//   Future<void> _addComment() async {
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     final currentUser = _auth.currentUser;
//
//     if (currentUser != null) {
//       final commentContent = await showModalBottomSheet<String>(
//         context: context,
//         builder: (BuildContext context) {
//           final TextEditingController controller = TextEditingController();
//           return SingleChildScrollView( // Add SingleChildScrollView here
//             child: Padding(
//               padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     TextField(
//                       controller: controller,
//                       decoration: const InputDecoration(
//                         hintText: 'Write a comment...',
//                       ),
//                       maxLines: null,
//                     ),
//                     const SizedBox(height: 16.0),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pop(context, controller.text.trim());
//                       },
//                       child: const Text('Submit'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//
//       if (commentContent != null && commentContent.isNotEmpty) {
//         final comment = Comment(
//           userId: currentUser.uid,
//           postId: widget.post.id,
//           content: commentContent,
//           timestamp: DateTime.now(),
//         );
//         await comment.addComment(context); // Pass the BuildContext
//         // Refresh the feed after adding a comment
//         widget.refreshFeed();
//       }
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.post.userId,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             Text(widget.post.content),
//             const SizedBox(height: 8.0),
//             if (widget.post.imageUrls.isNotEmpty)
//               SizedBox(
//                 height: 200,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: widget.post.imageUrls.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 8.0),
//                       child: Image.network(
//                         widget.post.imageUrls[index],
//                         fit: BoxFit.cover,
//                         loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
//                           if (loadingProgress == null) {
//                             return child;
//                           }
//                           return Center(
//                             child: CircularProgressIndicator(
//                               value: loadingProgress.expectedTotalBytes != null
//                                   ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
//                                   : null,
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             const SizedBox(height: 16.0),
//             Row(
//               children: [
//                 IconButton(
//                   onPressed: _toggleLike,
//                   icon: Icon(
//                     _isLiked ? Icons.favorite : Icons.favorite_border,
//                     color: _isLiked ? Colors.red : null,
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: _addComment,
//                   icon: const Icon(Icons.comment),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'post.dart';
import 'like.dart';
import 'comment.dart';

// class FeedPage extends StatefulWidget {
//   const FeedPage({Key? key}) : super(key: key);
//
//   @override
//   _FeedPageState createState() => _FeedPageState();
// }
//
// class _FeedPageState extends State<FeedPage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _firestore.collection('posts').orderBy('timestamp', descending: true).snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }
//
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//
//           return ListView(
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//               return PostWidget(
//                 post: Post(
//                   id: document.id,
//                   userId: data['userId'] ?? 'Unknown',
//                   content: data['content'] ?? '',
//                   imageUrls: List<String>.from(data['imageUrls'] ?? []),
//                   userName: data['userName'] ?? '', // Fetch user's name
//                 ),
//                 refreshFeed: () {
//                   setState(() {}); // Refresh the feed when necessary
//                 }, userId: '',
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }
// class FeedPage extends StatefulWidget {
//   const FeedPage({Key? key}) : super(key: key);
//
//   @override
//   _FeedPageState createState() => _FeedPageState();
// }
//
// class _FeedPageState extends State<FeedPage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   int _currentPage = 1;
//
//   Future<List<Post>> _getPosts() async {
//     final QuerySnapshot snapshot = await _firestore
//         .collection('posts')
//         .orderBy('timestamp', descending: true)
//         .limit(10)
//         .get();
//     return snapshot.docs.map((DocumentSnapshot document) {
//       Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//       return Post(
//         id: document.id,
//         userId: data['userId'] ?? 'Unknown',
//         userName: data['userName'] ?? '',
//         content: data['content'] ?? '',
//         imageUrls: List<String>.from(data['imageUrls'] ?? []),
//         timestamp: data['timestamp']?.toDate() ?? DateTime.now(),
//       );
//     }).toList();
//   }
//
//   Future<void> _loadMorePosts() async {
//     setState(() {
//       _currentPage++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: RefreshIndicator(
//         onRefresh: () async {
//           setState(() {
//             _currentPage = 1;
//           });
//           await _loadMorePosts();
//         },
//         child: FutureBuilder<List<Post>>(
//           future: _getPosts(),
//           builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text('Error: ${snapshot.error}'),
//               );
//             }
//
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final Post post = snapshot.data![index];
//                 return PostWidget(
//                   post: post,
//                   refreshFeed: () {
//                     setState(() {}); // Refresh the feed when necessary
//                   },
//                   userId: post.userId,
//                 );
//               },
//               controller: ScrollController()..addListener(() {
//                 if (ScrollController().position.pixels == ScrollController().position.maxScrollExtent) {
//                   _loadMorePosts();
//                 }
//               }),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// class FeedPage extends StatefulWidget {
//   const FeedPage({Key? key}) : super(key: key);
//
//   @override
//   _FeedPageState createState() => _FeedPageState();
// }
//
// class _FeedPageState extends State<FeedPage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   int _currentPage = 1;
//   List<Post> _posts = [];
//
//   Future<List<Post>> _getPosts() async {
//     final QuerySnapshot snapshot = await _firestore
//         .collection('posts')
//         .orderBy('timestamp', descending: true)
//         .limit(10 * _currentPage)
//         .get();
//     return snapshot.docs.map((DocumentSnapshot document) {
//       Map<String, dynamic> data =
//       document.data()! as Map<String, dynamic>;
//       return Post(
//         id: document.id,
//         userId: data['userId'] ?? 'Unknown',
//         userName: data['userName'] ?? '',
//         content: data['content'] ?? '',
//         imageUrls: List<String>.from(data['imageUrls'] ?? []),
//         timestamp: data['timestamp']?.toDate() ?? DateTime.now(),
//       );
//     }).toList();
//   }
//
//   Future<void> _loadMorePosts() async {
//     final QuerySnapshot snapshot = await _firestore
//         .collection('posts')
//         .orderBy('timestamp', descending: true)
//         .startAfterDocument(
//         (_posts.isNotEmpty ? _posts.last.id : null) as DocumentSnapshot<Object?>)
//         .limit(1)
//         .get();
//     final List<Post> newPosts = snapshot.docs.map((DocumentSnapshot document) {
//       Map<String, dynamic> data =
//       document.data()! as Map<String, dynamic>;
//       return Post(
//         id: document.id,
//         userId: data['userId'] ?? 'Unknown',
//         userName: data['userName'] ?? '',
//         content: data['content'] ?? '',
//         imageUrls: List<String>.from(data['imageUrls'] ?? []),
//         timestamp: data['timestamp']?.toDate() ?? DateTime.now(),
//       );
//     }).toList();
//     setState(() {
//       _posts.addAll(newPosts);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: RefreshIndicator(
//         onRefresh: () async {
//           setState(() {
//             _currentPage = 1;
//           });
//           _posts = await _getPosts();
//         },
//         child: FutureBuilder<List<Post>>(
//           future: _getPosts(),
//           builder:
//               (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text('Error: ${snapshot.error}'),
//               );
//             }
//
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//
//             _posts = snapshot.data!;
//
//             return ListView.builder(
//               itemCount: _posts.length + 1, // +1 for loading older posts
//               itemBuilder: (BuildContext context, int index) {
//                 if (index == _posts.length) {
//                   // Load older posts
//                   _loadMorePosts();
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 final Post post = _posts[index];
//                 return PostWidget(
//                   post: post,
//                   refreshFeed: () {
//                     setState(() {}); // Refresh the feed when necessary
//                   },
//                   userId: post.userId,
//                 );
//               },
//               controller: ScrollController()
//                 ..addListener(() {
//                   if (ScrollController().position.pixels ==
//                       ScrollController().position.minScrollExtent) {
//                     _loadMorePosts();
//                   }
//                 }),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int _currentPage = 1;
  List<Post> _posts = [];
  bool _isLoadingMore = false;

  Future<List<Post>> _getPosts() async {
    final QuerySnapshot snapshot = await _firestore
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .limit(10 * _currentPage)
        .get();
    return snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data =
      document.data()! as Map<String, dynamic>;
      return Post(
        id: document.id,
        userId: data['userId'] ?? 'Unknown',
        userName: data['userName'] ?? '',
        content: data['content'] ?? '',
        imageUrls: List<String>.from(data['imageUrls'] ?? []),
        timestamp: data['timestamp']?.toDate() ?? DateTime.now(),
      );
    }).toList();
  }

  Future<void> _loadMorePosts() async {
    setState(() {
      _isLoadingMore = true;
    });
    final QuerySnapshot snapshot = await _firestore
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .startAfterDocument(
        (_posts.isNotEmpty ? _posts.last.id : null) as DocumentSnapshot<Object?>)
        .limit(1)
        .get();
    final List<Post> newPosts = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data =
      document.data()! as Map<String, dynamic>;
      return Post(
        id: document.id,
        userId: data['userId'] ?? 'Unknown',
        userName: data['userName'] ?? '',
        content: data['content'] ?? '',
        imageUrls: List<String>.from(data['imageUrls'] ?? []),
        timestamp: data['timestamp']?.toDate() ?? DateTime.now(),
      );
    }).toList();
    setState(() {
      _posts.addAll(newPosts);
      _isLoadingMore = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadInitialPosts();
  }

  Future<void> _loadInitialPosts() async {
    _posts = await _getPosts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            _currentPage = 1;
          });
          await _loadInitialPosts();
        },
        child: _posts.isEmpty
            ? Center(child: CircularProgressIndicator())
            : NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!_isLoadingMore &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              _loadMorePosts();
              return true;
            }
            return false;
          },
          child: ListView.builder(
            itemCount: _posts.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == _posts.length) {
                return _isLoadingMore
                    ? Center(child: CircularProgressIndicator())
                    : Container(); // Placeholder for loading indicator
              }
              final Post post = _posts[index];
              return PostWidget(
                post: post,
                refreshFeed: _loadInitialPosts,
                userId: post.userId,
              );
            },
          ),
        ),
      ),
    );
  }
}
class PostWidget extends StatefulWidget {
  final Post post;
  final Function refreshFeed;

  const PostWidget({Key? key, required this.post, required this.refreshFeed, required String userId}) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _checkIfLiked();
  }

  Future<void> _checkIfLiked() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      final likeQuery = await FirebaseFirestore.instance
          .collection('likes')
          .where('postId', isEqualTo: widget.post.id)
          .where('userId', isEqualTo: currentUser.uid)
          .get();
      setState(() {
        _isLiked = likeQuery.docs.isNotEmpty;
      });
    }
  }

  Future<void> _toggleLike() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      final like = Like(
        userId: currentUser.uid,
        postId: widget.post.id,
      );

      if (_isLiked) {
        await like.removeLike();
      } else {
        await like.addLike();
      }

      setState(() {
        _isLiked = !_isLiked;
      });

      // Refresh the feed after toggling like
      widget.refreshFeed();
    }
  }

  Future<void> _addComment() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final currentUser = _auth.currentUser;

    if (currentUser != null) {
      final commentContent = await showModalBottomSheet<String>(
        context: context,
        builder: (BuildContext context) {
          final TextEditingController controller = TextEditingController();
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: 'Write a comment...',
                      ),
                      maxLines: null,
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, controller.text.trim());
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

      if (commentContent != null && commentContent.isNotEmpty) {
        final comment = Comment(
          userId: currentUser.uid,
          postId: widget.post.id,
          content: commentContent,
          timestamp: DateTime.now(),
        );
        await comment.addComment(context);
        // Refresh the feed after adding a comment
        widget.refreshFeed();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.post.userName, // Display user's name
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.post.content.length > 50 ? widget.post.content.substring(0, 50) + "..." : widget.post.content,
            ),
            if (widget.post.content.length > 50)
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Full Content'),
                      content: Text(widget.post.content),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('View More'),
              ),
            const SizedBox(height: 8.0),
            if (widget.post.imageUrls.isNotEmpty)
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.post.imageUrls.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.network(
                        widget.post.imageUrls[index],
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                IconButton(
                  onPressed: _toggleLike,
                  icon: Icon(
                    _isLiked ? Icons.favorite : Icons.favorite_border,
                    color: _isLiked ? Colors.red : null,
                  ),
                ),
                IconButton(
                  onPressed: _addComment,
                  icon: const Icon(Icons.comment),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


