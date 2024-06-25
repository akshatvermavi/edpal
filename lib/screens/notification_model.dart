
import 'package:cloud_firestore/cloud_firestore.dart';

class MyNotification {
  final String id;
  final String userId;
  final String postId;
  final String actionType;
  final String? content;
  final String? senderId;
  final DateTime timestamp;

  MyNotification({
    required this.id,
    required this.userId,
    required this.postId,
    required this.actionType,
    this.content,
    this.senderId,
    required this.timestamp,
  });

  factory MyNotification.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MyNotification(
      id: doc.id,
      userId: data['userId'],
      postId: data['postId'],
      actionType: data['actionType'],
      content: data['content'],
      senderId: data['senderId'],
      timestamp: (data['timestamp'] as Timestamp).toDate(),
    );
  }
}