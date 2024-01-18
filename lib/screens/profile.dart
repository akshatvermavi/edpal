//
// import 'package:edpal/screens/login.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'dart:developer';
// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});
//
//
//
//   void logOut() async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.popUntil(context, (route) => route.isFirst);
//     Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => LoginPage()
//     ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//         actions: [
//           OutlinedButton.icon(
//             onPressed: () {
//               logOut();
//             },
//             icon: Icon(Icons.exit_to_app),
//             label: Text("Logout"),
//           ), // Add a closing parenthesis here
//         ],
//       ),
//       body: const Center(
//         child: Text('This is the Profile Page!'),
//       ),
//     );
//   }
// }



import 'package:edpal/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  void logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          OutlinedButton.icon(
            onPressed: () {
              logOut(context); // Pass the context to the logOut method
            },
            icon: Icon(Icons.exit_to_app),
            label: Text("Logout"),
          ),
        ],
      ),
      body: const Center(
        child: Text('This is the Profile Page!'),
      ),
    );
  }
}
