import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Like {
  final String userId;
  final String postId;

  Like({
    required this.userId,
    required this.postId,
  });

  // Add a like to Firestore
  Future<void> addLike() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      final likeData = {
        'actionType': 'like',
        'postId': postId,
        'senderId': currentUser.uid,
        'timestamp': FieldValue.serverTimestamp(),
      };

      final userLikesRef = _firestore.collection('likes').doc(userId).collection('posts').doc(postId).collection('likes');

      await userLikesRef.add(likeData);

      // Add notifications...
      final postDoc = await _firestore.collection('posts').doc(postId).get();
      final postOwnerUserId = postDoc.data()?['userId'];
      if (postOwnerUserId != null) {
        await _firestore.collection('notifications').add({
          'userId': postOwnerUserId,
          'postId': postId,
          'actionType': 'like',
          'senderId': currentUser.uid,
          'timestamp': FieldValue.serverTimestamp(),
        });

        // Add a notification for the current user if they liked their own post
        if (postOwnerUserId == currentUser.uid) {
          await _firestore.collection('notifications').add({
            'userId': currentUser.uid,
            'postId': postId,
            'actionType': 'like',
            'senderId': currentUser.uid,
            'timestamp': FieldValue.serverTimestamp(),
          });
        }
      }
    }
  }

  // Remove a like from Firestore
  Future<void> removeLike() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      final userLikesRef = _firestore.collection('likes').doc(userId).collection('posts').doc(postId).collection('likes');
      final likeQuery = await userLikesRef.where('senderId', isEqualTo: currentUser.uid).get();

      if (likeQuery.docs.isNotEmpty) {
        final likeDocId = likeQuery.docs.first.id;
        await userLikesRef.doc(likeDocId).delete();

        // Remove notification for the post owner
        final postDoc = await _firestore.collection('posts').doc(postId).get();
        final postOwnerUserId = postDoc.data()?['userId'];
        if (postOwnerUserId != null) {
          final notificationQuery = await _firestore.collection('notifications').where('userId', isEqualTo: postOwnerUserId).where('postId', isEqualTo: postId).where('actionType', isEqualTo: 'like').where('senderId', isEqualTo: currentUser.uid).get();
          if (notificationQuery.docs.isNotEmpty) {
            final notificationDocId = notificationQuery.docs.first.id;
            await _firestore.collection('notifications').doc(notificationDocId).delete();
          }
        }
      }
    }
  }
}

