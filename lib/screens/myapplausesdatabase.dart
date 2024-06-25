
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edpal/screens/comment.dart';
class DatabaseManager {
  final CollectionReference commentList =
  FirebaseFirestore.instance.collection('comments');
  Future<List<Comment>> getComments() async {
    try {
      QuerySnapshot snapshot = await commentList.get();
      return snapshot.docs.map((doc) => Comment.fromSnapshot(doc)).toList();
    } catch (e) {
      print("Error getting comments: $e");
      return []; // Return empty list in case of error
    }
  }
  Future<void> createComment(
      String userId, String postId, String content, String senderId) async {
    try {
      await commentList
          .doc(userId)
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .add({
        'actionType': 'comment',
        'content': content,
        'postId': postId,
        'senderId': senderId,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error adding comment: $e");
    }
  }

  Future<void> updateComment(
      String userId,
      String postId,
      String commentId,
      String content,
      String senderId,
      String timestamp) async {
    try {
      await commentList
          .doc(userId)
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .update({
        'content': content,
        'senderId': senderId,
        'timestamp': timestamp,
      });
    } catch (e) {
      print("Error updating comment: $e");
    }
  }

  Future<Map<String, dynamic>?> getComment(
      String userId, String postId, String commentId) async {
    try {
      DocumentSnapshot snapshot = await commentList
          .doc(userId)
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .get();

      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      print("Error getting comment: $e");
      return null;
    }
  }
}
