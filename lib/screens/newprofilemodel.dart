import 'package:edpal/screens/profile_model.dart';
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