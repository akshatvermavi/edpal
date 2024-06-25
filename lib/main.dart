
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edpal/screens/edit_profile.dart';
import 'package:edpal/screens/homepage.dart';
import 'package:edpal/screens/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:edpal/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:edpal/screens/newprofilemodel.dart';
import 'package:permission_handler/permission_handler.dart';

// void addNewUser() {
//   // Create a new user with a first and last name
//   final user = <String, dynamic>{
//     "first": "Ada",
//     "last": "Lovelace",
//     "born": 1815
//   };
//
//   // Access Firestore instance
//   FirebaseFirestore db = FirebaseFirestore.instance;
//
//   // Add a new document with a generated ID to the "users" collection
//   db.collection("users").add(user).then((DocumentReference doc) {
//     print('DocumentSnapshot added with ID: ${doc.id}');
//   }).catchError((error) {
//     print('Error adding document: $error');
//   });
// }

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  // Initialize Firestore instance
  FirebaseFirestore db = FirebaseFirestore.instance;
  //WidgetsFlutterBinding.ensureInitialized();
  await Permission.storage.request();
  //WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();
  // FirebaseFirestore.instance
  //     .collection('profiles')
  //     .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
  //     .get()
  //     .then((querySnapshot) {
  //   querySnapshot.docs.forEach((result) {
  //     final profile = Profile(
  //       id: result.id,
  //       name: result.data()['name'],
  //       email: result.data()['email'],
  //       bio: result.data()['bio'],
  //       imageUrl: result.data()['imageUrl'],
  //     );
  //     var profileModel;
  //     profileModel.addProfile(profile);
  //   });
  // });

  // Create a new user with a first and last name
  final user = <String, dynamic>{
    // "schoolName": "Dav",
    // "address": "abad",
    // "principalName": "abha",
    // "principalEmail": "akshatvermavii@gmail.com",
    // "principalUserName":"admin",
    //"principalPassword":""
  };
  // final currentUserModel = CurrentUserModel(
  //   id: 'your_id',
  //   displayName: 'Your Name',
  //   email: 'your_email@example.com',
  //   photoUrl: 'your_photo_url',
  //   bio: 'Your Bio',
  // );

  // Add a new document with a generated ID to the "users" collection
  db.collection("users").add(user).then((DocumentReference doc) {
    print('DocumentSnapshot added with ID: ${doc.id}');

    // Verify data by fetching and printing all documents in the "users" collection
    db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }).catchError((error) {
    print('Error adding document: $error');
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Initialize currentUserModel with appropriate data
  // final currentUserModel = CurrentUserModel(
  //   id: 'your_id',
  //   displayName: 'Your Name',
  //   email: 'your_email@example.com',
  //   photoUrl: 'your_photo_url',
  //   bio: 'Your Bio',
  // );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edpal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (FirebaseAuth.instance.currentUser != null) ? const HomePage() :  const LoginPage(),
    );
  }
}