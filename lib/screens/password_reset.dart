import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utils/utils.dart';
class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({super.key});

  @override
  _PasswordResetPageState createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  //TextEditingController emailController = TextEditingController();
  final emailController =TextEditingController();
  final auth = FirebaseAuth.instance ;

  // void _sendPasswordResetEmail() {
  //   // Implement sending password reset email logic here
  //   // This is a dummy function; in reality, you'd send an email with a reset link
  //   print('Password reset email sent to ${emailController.text}');
  //   // You might want to navigate to a confirmation page or show a snackbar
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Reset'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 20),
            ElevatedButton(
              // onPressed: _sendPasswordResetEmail,
              child: const Text('Send Password Reset'),
              onPressed: (){
                auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value){
                  Utils().toastMessage('We have sent you email to recover password, please check email');
                }).onError((error, stackTrace){
                  Utils().toastMessage(error.toString());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}