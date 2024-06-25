
class Post {
  final String id;
  final String userId;
  final String userName; // Add user's name
  final String content;
  final List<String> imageUrls;

  Post({
    required this.id,
    required this.userId,
    required this.userName, // Initialize user's name
    required this.content,
    required this.imageUrls, required timestamp,
  });

  // Add the 'userName' field to the 'toMap' method if needed
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'content': content,
      'imageUrls': imageUrls,
    };
  }
}


