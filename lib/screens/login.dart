// import 'package:flutter/material.dart';
// import 'homepage.dart';
// import 'password_reset.dart';
// import 'register_school.dart'; // Import the school registration page
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   void _login() {
//     // Implement login logic here
//     // Redirect to homepage after successful login
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(controller: usernameController, decoration: InputDecoration(labelText: 'Username')),
//             TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password')),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _login,
//               child: Text('Login'),
//             ),
//             SizedBox(height: 10),
//             TextButton(
//               onPressed: () {
//                 // Navigate to password reset page
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordResetPage()));
//               },
//               child: Text('Forget Password'),
//             ),
//             SizedBox(height: 10),
//             TextButton(
//               onPressed: () {
//                 // Navigate to school registration page
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterSchoolPage()));
//               },
//               child: Text("Click here if your school is not on EDPAL"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//


// homepage.dart

// import 'dart:developer';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'homepage.dart';
// import 'password_reset.dart';
// import 'register_school.dart'; // Import the school registration page
// import 'schoolregistration.dart'; // Import the school registration page
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   Future<void> _login() async {
//     // Implement login logic here
//     // Redirect to homepage after successful login
//     //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//
//     if(email =="" || password == "")
//       {
//         log("Please fill the details!");
//       }
//     else{
//       try{
//         UserCredential usercredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
//         if(usercredential.user != null)
//           {
//             Navigator.popUntil(context, (route) => route.isFirst);
//             Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => HomePage() ));
//
//           }
//       } on FirebaseAuthException catch(ex){
//         log(ex.code.toString());
//       }
//
//
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(controller: emailController, decoration: const InputDecoration(labelText: 'email')),
//             TextField(controller: passwordController, decoration: const InputDecoration(labelText: 'Password')),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: (){ _login();
//                 },
//               child: const Text('Login'),
//             ),
//             const SizedBox(height: 10),
//             TextButton(
//               onPressed: () {
//                 // Navigate to password reset page
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordResetPage()));
//               },
//               child: const Text('Forget Password'),
//             ),
//
//             const SizedBox(height: 10),
//             TextButton(
//               onPressed: () {
//                 // Navigate to school registration page
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterSchoolPage()));
//               },
//               child: const Text("Click here if your school is not on EDPAL"),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//

// import 'dart:developer';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'homepage.dart';
// import 'password_reset.dart';
// import 'register_school.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   Future<void> _login() async {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//
//     if (email == "" || password == "") {
//       log("Please fill the details!");
//     } else {
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
//         if (userCredential.user != null) {
//           Navigator.popUntil(context, (route) => route.isFirst);
//           Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => HomePage()));
//         }
//       } on FirebaseAuthException catch (ex) {
//         log(ex.code.toString());
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Image added here
//             Image.asset(
//               'assets/image/android/drawable-hdpi/aboutpage.jpg', // Provide the correct path to your image
//               width: 150.0, // Adjust the width as needed
//               height: 150.0, // Adjust the height as needed
//               fit: BoxFit.contain, // Adjust the BoxFit property as needed
//             ),
//             const SizedBox(height: 20),
//             TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
//             const SizedBox(height: 10),
//             TextField(
//               controller: passwordController,
//               decoration: const InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _login();
//               },
//               child: const Text('Login'),
//             ),
//             const SizedBox(height: 10),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordResetPage()));
//               },
//               child: const Text('Forget Password'),
//             ),
//             const SizedBox(height: 10),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterSchoolPage()));
//               },
//               child: const Text("Click here if your school is not on EDPAL"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// import 'dart:developer';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'homepage.dart';
// import 'password_reset.dart';
// import 'register_school.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool isPasswordVisible = false;
//
//   Future<void> _login() async {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//
//     if (email == "" || password == "") {
//       log("Please fill the details!");
//     } else {
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
//         if (userCredential.user != null) {
//           Navigator.popUntil(context, (route) => route.isFirst);
//           Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => HomePage()));
//         }
//       } on FirebaseAuthException catch (ex) {
//         log(ex.code.toString());
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/image/android/drawable-hdpi/aboutpage.jpg',
//               width: 150.0,
//               height: 150.0,
//               fit: BoxFit.contain,
//             ),
//             const SizedBox(height: 20),
//             TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
//             const SizedBox(height: 10),
//             Stack(
//               alignment: Alignment.centerRight,
//               children: [
//                 TextField(
//                   controller: passwordController,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                   ),
//                   obscureText: !isPasswordVisible,
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                     color: Colors.grey,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       isPasswordVisible = !isPasswordVisible;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _login();
//               },
//               child: const Text('Login'),
//             ),
//             const SizedBox(height: 10),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordResetPage()));
//               },
//               child: const Text('Forget Password'),
//             ),
//             const SizedBox(height: 10),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterSchoolPage()));
//               },
//               child: const Text("Click here if your school is not on EDPAL"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:developer';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'homepage.dart';
// import 'password_reset.dart';
// import 'register_school.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool isPasswordVisible = false;
//
//   Future<void> _login() async {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//
//     if (email == "" || password == "") {
//       log("Please fill the details!");
//     } else {
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
//         if (userCredential.user != null) {
//           Navigator.popUntil(context, (route) => route.isFirst);
//           Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => HomePage()));
//         }
//       } on FirebaseAuthException catch (ex) {
//         log(ex.code.toString());
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/image/android/drawable-hdpi/aboutpage.jpg',
//                 width: 150.0,
//                 height: 150.0,
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
//                 onPressed: () {
//                   _login();
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
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterSchoolPage()));
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



// import 'dart:developer';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'homepage.dart';
// import 'password_reset.dart';
// import 'register_school.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool isPasswordVisible = false;
//
//   Future<void> _login() async {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//
//     if (email == "" || password == "") {
//       log("Please fill the details!");
//     } else {
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
//         if (userCredential.user != null) {
//           Navigator.popUntil(context, (route) => route.isFirst);
//           Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => HomePage()));
//         }
//       } on FirebaseAuthException catch (ex) {
//         log(ex.code.toString());
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double imageWidth = screenWidth * 0.6; // Adjust the scaling factor as needed
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
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
//                 onPressed: () {
//                   _login();
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
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterSchoolPage()));
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



// import 'dart:developer';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'homepage.dart';
// import 'password_reset.dart';
// import 'register_school.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool isPasswordVisible = false;
//
//   Future<void> _login() async {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//
//     if (email == "" || password == "") {
//       log("Please fill in the details!");
//       return;
//     }
//
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
//       if (userCredential.user != null) {
//         Navigator.popUntil(context, (route) => route.isFirst);
//         Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => HomePage()));
//       }
//     } on FirebaseAuthException catch (ex) {
//       log(ex.code.toString());
//
//       if (ex.code == 'wrong-password') {
//         _showErrorDialog('Wrong Password', 'The password you entered is incorrect.');
//       } else {
//         _showErrorDialog('Authentication Error', 'please check password or email.');
//       }
//     }
//   }
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
//         title: const Text('Login'),
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
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterSchoolPage()));
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
  bool isPasswordVisible = false;

  Future<void> _login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email == "" || password == "") {
      log("Please fill in the details!");
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => HomePage()));
      }
    } on FirebaseAuthException catch (ex) {
      log(ex.code.toString());

      if (ex.code == 'wrong-password') {
        _showErrorDialog('Wrong Password', 'The password you entered is incorrect.');
      } else {
        _showErrorDialog('Authentication Error', 'An error occurred during authentication.');
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
        title: const Text('Login'),
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
                    decoration: InputDecoration(
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterSchoolPage()));
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
