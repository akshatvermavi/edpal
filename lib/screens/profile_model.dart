import 'package:flutter/cupertino.dart';
class ProfileModel extends ChangeNotifier {
  Map<String, Profile> _profiles = {};

  Map<String, Profile> get profiles => _profiles;

  void addProfile(Profile profile) {
    _profiles[profile.email] = profile;
    notifyListeners();
  }

  Profile? getProfile(String email) {
    return _profiles[email];
  }

  void updateProfile(Profile profile) {
    _profiles[profile.email] = profile;
    notifyListeners();
  }

  void removeProfile(String email) {
    _profiles.remove(email);
    notifyListeners();
  }
}
class Profile {
  String id;
  String name;
  String email;
  String bio;
  String imageUrl;

  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.bio,
    required this.imageUrl,
  });

  factory Profile.fromMap(Map<String, dynamic> data) {
    return Profile(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      bio: data['bio'],
      imageUrl: data['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'bio': bio,
      'imageUrl': imageUrl,
    };
  }
}

