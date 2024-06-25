import 'package:cloud_firestore/cloud_firestore.dart';
class CurrentUserModel {
  final String id;
  final String displayName;
  final String email;
  final String photoUrl;
  final String bio;

  CurrentUserModel({
    required this.id,
    required this.displayName,
    required this.email,
    required this.photoUrl,
    required this.bio,
  });

  factory CurrentUserModel.fromDocument(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return CurrentUserModel(
      id: document.id,
      displayName: data['displayName'],
      email: data['email'],
      photoUrl: data['photoUrl'],
      bio: data['bio'],
    );
  }
}
