
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class SchoolRegistration extends StatefulWidget {
  const SchoolRegistration({super.key});

  @override
  _SchoolRegistrationState createState() => _SchoolRegistrationState();
}

class _SchoolRegistrationState extends State<SchoolRegistration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _schoolNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _principalNameController = TextEditingController();
  final TextEditingController _principalEmailController = TextEditingController();
  final TextEditingController _principalUsernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Hash the password
      String hashedPassword = _hashPassword(_passwordController.text);

      // Check if the email is already registered
      bool emailExists = await _checkEmailExists(_principalEmailController.text);
      if (emailExists) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email already registered. Please use a different email.')),
        );
        return;
      }

      // Save form data to Firestore
      try {
        // Add school data to Firestore
        DocumentReference schoolRef = await FirebaseFirestore.instance.collection('schools').add({
          'schoolName': _schoolNameController.text,
          'address': _addressController.text,
          'principalName': _principalNameController.text,
          'principalEmail': _principalEmailController.text,
          'principalUsername': _principalUsernameController.text,
          'password': hashedPassword,
          'verified': false, // School is not verified initially
        });

        // Send verification email to principal
        await _sendVerificationEmail(_principalEmailController.text);

        // Navigate to login screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );

        // Display success message
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('School registration successful! Verification email sent to principal.')),
        // );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('School registration successful! Verification email sent to principal.'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (error) {
        // Error handling
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Failed to register school: $error')),
        // );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to register school: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _sendVerificationEmail(String email) async {
    // Send verification email to the principal
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    }
  }

  String _hashPassword(String password) {
    // Hash the password using a strong hashing algorithm like bcrypt
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<bool> _checkEmailExists(String email) async {
    // Check if the provided email exists in the database
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('schools')
        .where('principalEmail', isEqualTo: email)
        .get();
    return query.docs.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Registration'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _schoolNameController,
                  decoration: const InputDecoration(labelText: 'School Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the school name';
                    }
                    return null;
                  },
                ),
                // Other form fields...
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _principalNameController,
                  decoration: const InputDecoration(labelText: 'Principal Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the principal name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _principalEmailController,
                  decoration: const InputDecoration(labelText: 'Principal Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the principal email';
                    }
                    // You may want to add email format validation here
                    return null;
                  },
                ),
                TextFormField(
                  controller: _principalUsernameController,
                  decoration: const InputDecoration(labelText: 'Principal Username'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the principal username';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },

                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                // TextFormField(
                //   controller: _passwordController,
                //   decoration: const InputDecoration(labelText: 'Password'),
                //   obscureText: true, // This line hides the password
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter a password';
                //     }
                //     return null;
                //   },
                // ),
                // TextFormField(
                //   controller: _confirmPasswordController,
                //   decoration: const InputDecoration(labelText: 'Confirm Password'),
                //   obscureText: true, // This line hides the password
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please confirm your password';
                //     }
                //     if (value != _passwordController.text) {
                //       return 'Passwords do not match';
                //     }
                //     return null;
                //   },
                // ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

