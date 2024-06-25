
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class Comment {
  final String userId;
  final String postId;
  final String content;
  final DateTime timestamp;
  final String? senderId;

  Comment({
    required this.userId,
    required this.postId,
    required this.content,
    required this.timestamp,
    this.senderId,
  });
  factory Comment.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Comment(
      userId: data['userId'],
      postId: data['postId'],
      content: data['content'],
      timestamp: (data['timestamp'] as Timestamp).toDate(),
      senderId: data['senderId'],
    );
  }
  // Add a comment to Firestore
  Future<void> addComment(BuildContext context) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final currentUser = _auth.currentUser;

    if (currentUser != null) {
      final commentData = {
        'actionType': 'comment',
        'content': content,
        'postId': postId,
        'senderId': currentUser.uid,
        'timestamp': FieldValue.serverTimestamp(),
      };

      final userCommentsRef = _firestore.collection('comments').doc(userId).collection('posts').doc(postId).collection('comments');

      await userCommentsRef.add(commentData);
    }
  }

  Future<void> showCommentDialog(BuildContext context) async {
    final TextEditingController _commentController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return KeyboardActions(
          config: KeyboardActionsConfig(
            actions: [
              KeyboardActionsItem(
                focusNode: FocusNode(),
                toolbarButtons: [
                      (node) {
                    return GestureDetector(
                      onTap: () {
                        _commentController.clear();
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    );
                  },
                      (node) {
                    return GestureDetector(
                      onTap: () async {
                        final comment = Comment(
                          userId: FirebaseAuth.instance.currentUser!.uid,
                          postId: postId,
                          content: _commentController.text.trim(),
                          timestamp: DateTime.now(),
                          senderId: senderId,
                        );
                        await comment.addComment(context);
                        _commentController.clear();
                        Navigator.pop(context);
                      },
                      child: const Text('Post'),
                    );
                  },
                ],
              ),
            ],
          ),
          child: AlertDialog(
            title: const Text('Add Comment'),
            content: TextField(
              controller: _commentController,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Write a comment...',
              ),
            ),
          ),
        );
      },
    );
  }
}
