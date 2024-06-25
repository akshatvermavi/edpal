import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'password_reset.dart';
import 'register_school.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController principalEmailController = TextEditingController();
  // TextEditingController principalPasswordController = TextEditingController();
  bool isPasswordVisible = false;

  Future<void> _login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    // String principalEmail = principalEmailController.text.trim();
    // String principalPassword = principalPasswordController.text.trim();

    // if (email == "" || password == "") {
    //   log("Please fill in the details!");
    //   return;
    // }
    if (email.isEmpty || password.isEmpty) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Please fill in the details!')),
      // );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in the details!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const HomePage()));
      }
    } on FirebaseAuthException catch (ex) {
      log(ex.code.toString());

      if (ex.code == 'wrong-password') {
        _showErrorDialog('Wrong Password', 'The password you entered is incorrect.');
      } else {
        _showErrorDialog('Authentication Error', 'Please check your email or password.');
      }
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = screenWidth * 0.6; // Adjust the scaling factor as needed

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edpal Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/loginpagepics/android/drawable-hdpi/loginpageimage.png',
                width: imageWidth,
                height: imageWidth,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
              const SizedBox(height: 10),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: !isPasswordVisible,
                  ),
                  IconButton(
                    icon: Icon(
                      isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await _login();
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordResetPage()));
                },
                child: const Text('Forget Password'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterSchoolPage()));
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const SchoolRegistration()));

                },
                child: const Text("Click here if your school is not on EDPAL"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:crypto/crypto.dart';
// import 'package:ic_launcher.png/screens/main_screens.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'homepage.dart';
// import 'password_reset.dart';
// import 'register_school.dart';
// import 'register.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key});
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   String _hashPassword(String password) {
//     // Hash the password using a strong hashing algorithm like bcrypt
//     var bytes = utf8.encode(password);
//     var digest = sha256.convert(bytes);
//     return digest.toString();
//   }
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool isPasswordVisible = false;
//
//   // Future<void> _login() async {
//   //   String email = emailController.text.trim();
//   //   String password = passwordController.text.trim();
//   //
//   //   if (email == "" || password == "") {
//   //     log("Please fill in the details!");
//   //     return;
//   //   }
//   //
//   //   try {
//   //     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
//   //     if (userCredential.user != null) {
//   //       Navigator.popUntil(context, (route) => route.isFirst);
//   //       Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => HomePage()));
//   //       //Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => TabScreen()));
//   //     }
//   //   } on FirebaseAuthException catch (ex) {
//   //     log(ex.code.toString()); // Log the error code
//   //
//   //     if (ex.code == 'wrong-password') {
//   //       _showErrorDialog('Wrong Password', 'The password you entered is incorrect.');
//   //     } else {
//   //       _showErrorDialog('Authentication Error', 'Please check your email or password.');
//   //     }
//   //   } catch (e) {
//   //     log(e.toString()); // Log any other exceptions
//   //     _showErrorDialog('Error', 'An unexpected error occurred.');
//   //   }
//   //
//   // }
//   Future<void> _login() async {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//
//     if (email.isEmpty || password.isEmpty) {
//       log("Please fill in the details!");
//       return;
//     }
//
//     try {
//       QuerySnapshot principalQuery = await FirebaseFirestore.instance
//           .collection('schools')
//           .where('principalEmail', isEqualTo: email)
//           .get();
//
//       QuerySnapshot memberQuery = await FirebaseFirestore.instance
//           .collection('members')
//           .where('email', isEqualTo: email)
//           .get();
//
//       if (principalQuery.docs.isNotEmpty) {
//         DocumentSnapshot principalDoc = principalQuery.docs.first;
//         String hashedPassword = principalDoc['password'];
//
//         if (_hashPassword(password) == hashedPassword) {
//           Navigator.popUntil(context, (route) => route.isFirst);
//           Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => HomePage()));
//         } else {
//           _showErrorDialog('Authentication Failed', 'Invalid email or password.');
//         }
//       } else if (memberQuery.docs.isNotEmpty) {
//         DocumentSnapshot memberDoc = memberQuery.docs.first;
//         String hashedPassword = memberDoc['password'];
//
//         if (_hashPassword(password) == hashedPassword) {
//           Navigator.popUntil(context, (route) => route.isFirst);
//           Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => HomePage()));
//         } else {
//           _showErrorDialog('Authentication Failed', 'Invalid email or password.');
//         }
//       } else {
//         _showErrorDialog('Authentication Failed', 'Invalid email or password.');
//       }
//     } catch (e, stackTrace) {
//       log('Error during login: $e\n$stackTrace');
//       _showErrorDialog('Error', 'An unexpected error occurred.');
//     }
//   }
//
//
//
//   void _showErrorDialog(String title, String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(title),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double imageWidth = screenWidth * 0.6; // Adjust the scaling factor as needed
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edpal Login'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/loginpagepics/android/drawable-hdpi/loginpageimage.png',
//                 width: imageWidth,
//                 height: imageWidth,
//                 fit: BoxFit.contain,
//               ),
//               const SizedBox(height: 20),
//               TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
//               const SizedBox(height: 10),
//               Stack(
//                 alignment: Alignment.centerRight,
//                 children: [
//                   TextField(
//                     controller: passwordController,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                     ),
//                     obscureText: !isPasswordVisible,
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                       color: Colors.grey,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         isPasswordVisible = !isPasswordVisible;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   await _login();
//                 },
//                 child: const Text('Login'),
//               ),
//               const SizedBox(height: 10),
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordResetPage()));
//                 },
//                 child: const Text('Forget Password'),
//               ),
//               const SizedBox(height: 10),
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => SchoolRegistration()));
//                 },
//                 child: const Text("Click here if your school is not on EDPAL"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
