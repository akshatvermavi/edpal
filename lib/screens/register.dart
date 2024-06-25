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