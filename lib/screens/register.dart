// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'login.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// Future<void> registerUser(String email, String password) async {
//   try {
//     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     // Handle successful registration
//   } catch (e) {
//     // Handle registration failure
//   }
// }
//
// Future<void> submitRequest(String principalEmail, String schoolName, String studentName,String password) async {
//   final cloudFunctionUrl = 'https://edpal.page.link/register'; // Replace with your Cloud Function URL
//
//   try {
//     final response = await http.post(
//       Uri.parse(cloudFunctionUrl),
//       body: {
//         'principalEmail': principalEmail,
//         'schoolName': schoolName,
//         'studentName': studentName,
//         'password':password,
//       },
//     );
//
//     if (response.statusCode == 200) {
//       print('Request submitted successfully!');
//     } else {
//       print('Failed to submit request. Status code: ${response.statusCode}');
//     }
//   } catch (error) {
//     print('Error submitting request: $error');
//   }
// }
//
//
// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});
//
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   TextEditingController principalNameController = TextEditingController();
//    TextEditingController passwordController = TextEditingController();
//   TextEditingController studentNameController = TextEditingController();
//   // TextEditingController lastNameController = TextEditingController();
//   TextEditingController principalEmailController = TextEditingController();
//
//
//   // You may need to implement email verification logic with OTP
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Register'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(controller: principalEmailController, decoration: const InputDecoration(labelText: 'Principal Email')),
//
//             TextField(controller: principalNameController, decoration: const InputDecoration(labelText: 'School Name')),
//
//             TextField(controller: studentNameController, decoration: const InputDecoration(labelText: 'Student Name')),
//             TextField(controller: passwordController, decoration: const InputDecoration(labelText: 'Password')),
//             // TextField(controller: lastNameController, decoration: const InputDecoration(labelText: 'Last Name')),
//
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement registration logic here
//                 // Redirect to login page after successful registration
//
//                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
//               },
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
//
// class SubmissionForm extends StatefulWidget {
//   @override
//   _SubmissionFormState createState() => _SubmissionFormState();
// }
//
// class _SubmissionFormState extends State<SubmissionForm> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Submission Form'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _submitForm(context);
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _submitForm(BuildContext context) {
//     // Create a dynamic link with parameters
//     String dynamicLink = '/registration?email=${emailController.text}&name=${nameController.text}&password=${passwordController.text}';
//
//     // Navigate to registrationpage.dart with the dynamic link
//     Navigator.pushNamed(context, dynamicLink);
//   }
// }


// import 'package:flutter/material.dart';
//
// class SubmissionForm extends StatefulWidget {
//   @override
//   _SubmissionFormState createState() => _SubmissionFormState();
// }
//
// class _SubmissionFormState extends State<SubmissionForm> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Submission Form'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _submitForm(context);
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _submitForm(BuildContext context) {
//     // Create a dynamic link with parameters
//     // String dynamicLink = '/registr_school?email=${emailController.text}&name=${nameController.text}&password=${passwordController.text}';
//     //
//     // // Navigate to registrationpage.dart with the dynamic link
//     // Navigator.pushNamed(context, dynamicLink);
//     String dynamicLink =
//         '/registration?email=${emailController.text}&name=${nameController.text}&password=${passwordController.text}';
//
//     // Navigate to registration page with the dynamic link
//     Navigator.pushReplacementNamed(context, '/registration', arguments: {
//       'email': emailController.text,
//       'name': nameController.text,
//       'password': passwordController.text,
//     });
//   }
// }

//
// import 'package:edpal/screens/auth.dart';
import 'package:edpal/screens/register_school.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

final Uri _url = Uri.parse('https://flutter.dev');
class _RegisterPageState extends State<RegisterPage> {
  TextEditingController principalEmailController = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();

  //url loncher code
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
  // You may need to implement email verification logic with OTP

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: schoolNameController, decoration: const InputDecoration(labelText: 'Principal Name')),
            TextField(controller: studentNameController, decoration: const InputDecoration(labelText: 'Student Name')),
            TextField(controller: principalEmailController, decoration: const InputDecoration(labelText: 'Principal Email')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () { //_launchUrl;
                // Implement registration logic here
                // Redirect to login page after successful registration
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () { //_launchUrl;
              // Implement registration logic here signupUser()
              // Redirect to login page after successful registration
              //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
               // Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterSchoolPage()));
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterFormWidget()));
                Navigator.push(context, MaterialPageRoute(builder: (context) =>const SchoolRegistration()));
              },
              child: const Text('Principal Window'),
            ),
          ],
        ),
      ),
    );

  }

}

// import 'package:flutter/material.dart';
// import 'login.dart';
//
// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});
//
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//
//   // You may need to implement email verification logic with OTP
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Register'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(controller: usernameController, decoration: const InputDecoration(labelText: 'Username')),
//             TextField(controller: passwordController, decoration: const InputDecoration(labelText: 'Password')),
//             TextField(controller: firstNameController, decoration: const InputDecoration(labelText: 'First Name')),
//             TextField(controller: lastNameController, decoration: const InputDecoration(labelText: 'Last Name')),
//             TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement registration logic here
//                 // Redirect to login page after successful registration
//                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
//               },
//               child: const Text('Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }