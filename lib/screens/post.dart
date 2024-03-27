
class Post {
  final String userId; // ID of the user who posted
  final String content; // Content of the post
  final List<String> imageUrls; // URLs of images attached to the post

  Post({
    required this.userId,
    required this.content,
    required this.imageUrls,
  });

  // Convert Post object to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'content': content,
      'imageUrls': imageUrls,
    };
  }
}
