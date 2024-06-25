import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseManager {
  final CollectionReference profileList =
  FirebaseFirestore.instance.collection('profiles');

  final CollectionReference friendList =
  FirebaseFirestore.instance.collection('friends');

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

  Future getUsersList() async {
    List itemsList = [];

    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> addFriend(String currentUserID, String friendUserID) async {
    await friendList.doc('$currentUserID-$friendUserID').set({
      'currentUserID': currentUserID,
      'friendUserID': friendUserID,
    });
  }
}
