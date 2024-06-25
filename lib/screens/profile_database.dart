import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference profileList =
  FirebaseFirestore.instance.collection('profiles');

  Future<void> createUserData(
      String name, String email, String bio,String imageUrl, String uid) async {
    return await profileList
        .doc(uid)
        .set({'name': name, 'email': email, 'bio': bio, 'imageUrl':imageUrl });
  }

  Future updateUserList( String name, String email, String bio,String imageUrl, String uid) async {
    return await profileList.doc(uid).update({
      'name': name, 'email': email, 'bio': bio,
      'imageUrl': imageUrl,
    });
  }

  Future getUserData(String userID) async {
    try {
      DocumentSnapshot snapshot = await profileList.doc(userID).get();
      if (snapshot.exists) {
        return snapshot.data();
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }



}
