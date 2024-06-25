import 'package:firebase_auth/firebase_auth.dart';
import 'package:edpal/screens/profile_database.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}