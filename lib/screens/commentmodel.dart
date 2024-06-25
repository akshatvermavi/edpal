class Comment {
  final String userId; // ID of the user who commented
  final String postId; // ID of the post that was commented on
  final String content; // Content of the comment
  final DateTime timestamp; // Timestamp of the comment

  Comment({
    required this.userId,
    required this.postId,
    required this.content,
    required this.timestamp,
  });

  // Convert Comment object to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'postId': postId,
      'content': content,
      'timestamp': timestamp,
    };
  }
}