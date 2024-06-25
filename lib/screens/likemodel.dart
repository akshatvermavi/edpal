class Like {
  final String userId; // ID of the user who liked the post
  final String postId; // ID of the post that was liked

  Like({
    required this.userId,
    required this.postId,
  });

  // Convert Like object to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'postId': postId,
    };
  }
}