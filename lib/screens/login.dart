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

import 'package:flutter/material.dart';
import 'homepage.dart';
import 'password_reset.dart';
import 'register_school.dart'; // Import the school registration page
import 'schoolregistration.dart'; // Import the school registration page

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _login() {
    // Implement login logic here
    // Redirect to homepage after successful login
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: usernameController, decoration: const InputDecoration(labelText: 'Username')),
            TextField(controller: passwordController, decoration: const InputDecoration(labelText: 'Password')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navigate to password reset page
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordResetPage()));
              },
              child: const Text('Forget Password'),
            ),
            // const SizedBox(height: 10),
            // TextButton(
            //   onPressed: () {
            //     // Navigate to school registration page
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => const SchoolRegisterPage()));
            //   },
            //   child: const Text("School Registration"),
            // ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navigate to school registration page
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterSchoolPage()));
              },
              child: const Text("Click here if your school is not on EDPAL"),
            ),

          ],
        ),
      ),
    );
  }
}

