// import 'package:flutter/material.dart';
//
// class RegisterSchoolPage extends StatefulWidget {
//   const RegisterSchoolPage({Key? key}) : super(key: key);
//
//   @override
//   _RegisterSchoolPageState createState() => _RegisterSchoolPageState();
// }
//
// class _RegisterSchoolPageState extends State<RegisterSchoolPage> {
//   TextEditingController schoolNameController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController pinCodeController = TextEditingController();
//   TextEditingController districtController = TextEditingController();
//   TextEditingController stateController = TextEditingController();
//   TextEditingController countryController = TextEditingController();
//   TextEditingController principalNameController = TextEditingController();
//   TextEditingController principalUsernameController = TextEditingController();
//   TextEditingController principalPasswordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//
//   void _submitRegistration() {
//     // Implement school registration logic here
//     // Send email to the principal with registration details
//     // This is a dummy function; in reality, you'd send emails and store registration data
//     print('Registration details sent to Principal: ${principalNameController.text}, Username: ${principalUsernameController.text}');
//     // You might want to navigate to a confirmation page or show a snackbar
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('School Registration'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(controller: schoolNameController, decoration: const InputDecoration(labelText: 'School Name')),
//             TextField(controller: addressController, decoration: const InputDecoration(labelText: 'School Address')),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(controller: pinCodeController, decoration: const InputDecoration(labelText: 'Pin Code')),
//                 ),
//                 Expanded(
//                   child: TextField(controller: districtController, decoration: const InputDecoration(labelText: 'District')),
//                 ),
//                 Expanded(
//                   child: TextField(controller: stateController, decoration: const InputDecoration(labelText: 'State')),
//                 ),
//                 Expanded(
//                   child: TextField(controller: countryController, decoration: const InputDecoration(labelText: 'Country')),
//                 ),
//               ],
//             ),
//             TextField(controller: principalNameController, decoration: const InputDecoration(labelText: 'Principal Name')),
//             TextField(controller: principalUsernameController, decoration: const InputDecoration(labelText: 'Principal Username')),
//             TextField(controller: principalPasswordController, decoration: const InputDecoration(labelText: 'Password')),
//             TextField(controller: confirmPasswordController, decoration: const InputDecoration(labelText: 'Confirm Password')),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _submitRegistration,
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
//
// class RegisterSchoolPage extends StatefulWidget {
//   const RegisterSchoolPage({Key? key}) : super(key: key);
//
//   @override
//   _RegisterSchoolPageState createState() => _RegisterSchoolPageState();
// }
//
// class _RegisterSchoolPageState extends State<RegisterSchoolPage> {
//   TextEditingController schoolNameController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController pinCodeController = TextEditingController();
//   TextEditingController districtController = TextEditingController();
//   TextEditingController stateController = TextEditingController();
//   TextEditingController countryController = TextEditingController();
//   TextEditingController principalNameController = TextEditingController();
//   TextEditingController principalUsernameController = TextEditingController();
//   TextEditingController principalPasswordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//
//   void _submitRegistration() {
//     // Implement school registration logic here
//     // Send email to the principal with registration details
//     // This is a dummy function; in reality, you'd send emails and store registration data
//     print('Registration details sent to Principal: ${principalNameController.text}, Username: ${principalUsernameController.text}');
//     // You might want to navigate to a confirmation page or show a snackbar
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('School Registration'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10.0),
//             border: Border.all(color: Colors.grey),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextField(controller: schoolNameController, decoration: const InputDecoration(labelText: 'School Name')),
//                 TextField(controller: addressController, decoration: const InputDecoration(labelText: 'School Address')),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextField(controller: pinCodeController, decoration: const InputDecoration(labelText: 'Pin Code')),
//                     ),
//                     Expanded(
//                       child: TextField(controller: districtController, decoration: const InputDecoration(labelText: 'District')),
//                     ),
//                     Expanded(
//                       child: TextField(controller: stateController, decoration: const InputDecoration(labelText: 'State')),
//                     ),
//                     Expanded(
//                       child: TextField(controller: countryController, decoration: const InputDecoration(labelText: 'Country')),
//                     ),
//                   ],
//                 ),
//                 TextField(controller: principalNameController, decoration: const InputDecoration(labelText: 'Principal Name')),
//                 TextField(controller: principalUsernameController, decoration: const InputDecoration(labelText: 'Principal Username')),
//                 TextField(controller: principalPasswordController, decoration: const InputDecoration(labelText: 'Password')),
//                 TextField(controller: confirmPasswordController, decoration: const InputDecoration(labelText: 'Confirm Password')),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _submitRegistration,
//                   child: const Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
//
// class RegisterSchoolPage extends StatefulWidget {
//   const RegisterSchoolPage({Key? key}) : super(key: key);
//
//   @override
//   _RegisterSchoolPageState createState() => _RegisterSchoolPageState();
// }
//
// class _RegisterSchoolPageState extends State<RegisterSchoolPage> {
//   TextEditingController schoolNameController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController pinCodeController = TextEditingController();
//   TextEditingController districtController = TextEditingController();
//   TextEditingController stateController = TextEditingController();
//   TextEditingController countryController = TextEditingController();
//   TextEditingController principalNameController = TextEditingController();
//   TextEditingController principalUsernameController = TextEditingController();
//   TextEditingController principalPasswordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//
//   void _submitRegistration() {
//     print('Registration details sent to Principal: ${principalNameController.text}, Username: ${principalUsernameController.text}');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('School Registration'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               border: Border.all(color: Colors.grey),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextField(controller: schoolNameController, decoration: const InputDecoration(labelText: 'School Name')),
//                   TextField(controller: addressController, decoration: const InputDecoration(labelText: 'School Address')),
//                   TextField(controller: pinCodeController, keyboardType: TextInputType.number, maxLength: 6, decoration: const InputDecoration(labelText: 'Pin Code')),
//                   Row(
//                     children: [
//                       Expanded(child: TextField(controller: districtController, decoration: const InputDecoration(labelText: 'District'))),
//                       Expanded(child: TextField(controller: stateController, decoration: const InputDecoration(labelText: 'State'))),
//                       Expanded(child: TextField(controller: countryController, decoration: const InputDecoration(labelText: 'Country'))),
//                     ],
//                   ),
//                   TextField(controller: principalNameController, decoration: const InputDecoration(labelText: 'Principal Name')),
//                   TextField(controller: principalUsernameController, decoration: const InputDecoration(labelText: 'Principal Username')),
//                   TextField(controller: principalPasswordController, decoration: const InputDecoration(labelText: 'Password')),
//                   TextField(controller: confirmPasswordController, decoration: const InputDecoration(labelText: 'Confirm Password')),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _submitRegistration,
//                     child: const Text('Submit'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class RegisterSchoolPage extends StatefulWidget {
//   const RegisterSchoolPage({Key? key}) : super(key: key);
//
//   @override
//   _RegisterSchoolPageState createState() => _RegisterSchoolPageState();
// }
//
// class _RegisterSchoolPageState extends State<RegisterSchoolPage> {
//   TextEditingController schoolNameController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController pinCodeController = TextEditingController();
//   TextEditingController districtController = TextEditingController();
//   TextEditingController stateController = TextEditingController();
//   TextEditingController countryController = TextEditingController();
//   TextEditingController principalNameController = TextEditingController();
//   TextEditingController principalUsernameController = TextEditingController();
//   TextEditingController principalPasswordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//
//   void _submitRegistration() {
//     print('Registration details sent to Principal: ${principalNameController.text}, Username: ${principalUsernameController.text}');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('School Registration'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   border: Border.all(color: Colors.grey),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       TextField(controller: schoolNameController, decoration: const InputDecoration(labelText: 'School Name')),
//                       TextField(controller: addressController, decoration: const InputDecoration(labelText: 'School Address')),
//                       TextField(controller: pinCodeController, keyboardType: TextInputType.number, maxLength: 6, decoration: const InputDecoration(labelText: 'Pin Code')),
//                       Row(
//                         children: [
//                           Expanded(child: TextField(controller: districtController, decoration: const InputDecoration(labelText: 'District'))),
//                           Expanded(child: TextField(controller: stateController, decoration: const InputDecoration(labelText: 'State'))),
//                           Expanded(child: TextField(controller: countryController, decoration: const InputDecoration(labelText: 'Country'))),
//                         ],
//                       ),
//                       TextField(controller: principalNameController, decoration: const InputDecoration(labelText: 'Principal Name')),
//                       TextField(controller: principalUsernameController, decoration: const InputDecoration(labelText: 'Principal Username')),
//                       TextField(controller: principalPasswordController, decoration: const InputDecoration(labelText: 'Password')),
//                       TextField(controller: confirmPasswordController, decoration: const InputDecoration(labelText: 'Confirm Password')),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _submitRegistration,
//                 child: const Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class RegisterSchoolPage extends StatefulWidget {
  const RegisterSchoolPage({Key? key}) : super(key: key);

  @override
  _RegisterSchoolPageState createState() => _RegisterSchoolPageState();
}


class _RegisterSchoolPageState extends State<RegisterSchoolPage> {
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController principalNameController = TextEditingController();
  TextEditingController principalEmailController = TextEditingController();
  TextEditingController principalUsernameController = TextEditingController();
  TextEditingController principalPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  void createAccount() async {
    String school = schoolNameController.text.trim();
    String address = addressController.text.trim();
    String pin = pinCodeController.text.trim();
    String district = districtController.text.trim();
    String state = stateController.text.trim();
    String country = countryController.text.trim();
    String name = principalNameController.text.trim();
    String username = principalUsernameController.text.trim();
    String email = principalEmailController.text.trim();
    String password = principalPasswordController.text.trim();
    String cPassword = confirmPasswordController.text.trim();

    if(email == "" || password=="" || cPassword =="" || school =="" || address =="" || pin==""|| district=="" || state=="" || country=="" || username=="" || name=="")
      {
        log("Please fill all the details!");
      }
    else if(password!=cPassword)
      {
        log("Password do not match");
      }
    else{
        // create new account
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null)
          {
            Navigator.pop(context);
          }
        // log("User Created");
      } on FirebaseAuthException catch(ex){
      log(ex.code.toString());
    }
    }

}
  void _submitRegistration() {
    print('Registration details sent to Principal: ${principalNameController.text}, Username: ${principalUsernameController.text}');
  }



  @override
  Widget build(BuildContext context) {
    double minBoxWidth = 2.0 * MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      appBar: AppBar(
        title: const Text('School Registration'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(minWidth: minBoxWidth),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: schoolNameController,
                        decoration: InputDecoration(labelText: 'School Name'),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      TextField(
                        controller: addressController,
                        decoration: InputDecoration(labelText: 'School Address'),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      TextField(
                        controller: pinCodeController,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        decoration: InputDecoration(labelText: 'Pin Code'),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: districtController,
                              decoration: InputDecoration(labelText: 'District'),
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: stateController,
                              decoration: InputDecoration(labelText: 'State'),
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: countryController,
                              decoration: InputDecoration(labelText: 'Country'),
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                      TextField(
                        controller: principalNameController,
                        decoration: InputDecoration(labelText: 'Principal Name'),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      TextField(
                        controller: principalEmailController,
                        decoration: InputDecoration(labelText: 'Email'),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      TextField(
                        controller: principalUsernameController,
                        decoration: InputDecoration(labelText: 'Principal Username'),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      TextField(
                        controller: principalPasswordController,
                        decoration: InputDecoration(labelText: 'Password'),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      TextField(
                        controller: confirmPasswordController,
                        decoration: InputDecoration(labelText: 'Confirm Password'),
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                //onPressed: _submitRegistration,
                onPressed: (){
                  createAccount();
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
