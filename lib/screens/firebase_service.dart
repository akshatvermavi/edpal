import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static Future<DocumentSnapshot> fetchDocument(String documentPath) async {
    if (documentPath.isNotEmpty) {
      // Access Firestore document
      DocumentSnapshot documentSnapshot =
      await FirebaseFirestore.instance.doc(documentPath).get();

      // Return document snapshot
      return documentSnapshot;
    } else {
      // Handle empty document path
      throw ArgumentError('Document path is empty');
    }
  }
}
