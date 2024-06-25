import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String title;
  final String content;
  final String userId;
  final String userEmail; // Add user email property

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.userId,
    required this.userEmail, // Include user email in the constructor
  });

  // Factory method to create a Post instance from a Firestore document snapshot
  factory Post.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Post(
      id: snapshot.id,
      title: data['title'],
      content: data['content'],
      userId: data['userId'],
      userEmail: data['userEmail'], // Populate user email from the snapshot data
    );
  }

  // Convert a Post instance to a Map for Firestore storage
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'userId': userId,
      'userEmail': userEmail, // Include user email in the map
    };
  }
}
