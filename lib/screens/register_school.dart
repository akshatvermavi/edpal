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



// import 'dart:developer';
// import 'dart:html';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:edpal/repository/authentication_repository/user_repository.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// import '../controllers/register_controller.dart';
// import '../models/user.dart';
// final schoolNameController =  TextEditingController();
// final addressController =  TextEditingController();
// final pinCodeController =  TextEditingController();
// final districtController =  TextEditingController();
// final stateController =  TextEditingController();
// final countryController = TextEditingController();
// final principalNameController = TextEditingController();
// final principalEmailController =  TextEditingController();
// final principalUsernameController = TextEditingController();
// final principalPasswordController = TextEditingController();
// final confirmPasswordController = TextEditingController();

// class RegisterSchoolPage extends StatefulWidget {
//   const RegisterSchoolPage({Key? key}) : super(key: key);
//   static String tag = 'register-page';
//   @override
//   _RegisterSchoolPageState createState() => _RegisterSchoolPageState();
// }
//
//
// class _RegisterSchoolPageState extends State<RegisterSchoolPage> {
//   static RegisterSchoolPage get instance =>Get.find();

  //final _formKey = GlobalKey<FormState>();
  // final schoolNameController =  TextEditingController();
  // final addressController =  TextEditingController();
  // final pinCodeController =  TextEditingController();
  // final districtController =  TextEditingController();
  // final stateController =  TextEditingController();
  // final countryController = TextEditingController();
  // final principalNameController = TextEditingController();
  // final principalEmailController =  TextEditingController();
  // final principalUsernameController = TextEditingController();
  // final principalPasswordController = TextEditingController();
  // final confirmPasswordController = TextEditingController();
  //
  // final userRepo = Get.put(UserRepository());

  // void registerUser(String email, String password)
  // {
  //   String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(email,password) as String?;
  //   if(error!=null){
  //     Get.showSnackbar(GetSnackBar(message: error.toString()));
  //
  //   }
  // }
  // Future<void> createUser(UserModel user)
  // async {
  //   //AuthenticatorAttestationResponse.instance.emailAuthentication(email);
  //   await userRepo.createUser(user);
  //   emailAuthencation(user.principalEmail);
  //
  // }
  // void emailAuthencation(String email)
  // {
  //   AuthenticationRepository.instance.emailAuthentication(email);
  // }
  // final FocusNode _schoolNameFocus = FocusNode();
  // final FocusNode _addressFocus = FocusNode();
  // final FocusNode _pinCodeFocus = FocusNode();
  // final FocusNode _districtFocus = FocusNode();
  // final FocusNode _stateFocus = FocusNode();
  // final FocusNode _countryFocus = FocusNode();
  // final FocusNode _principalNameFocus = FocusNode();
  // final FocusNode _principalEmailFocus = FocusNode();
  // final FocusNode _principalUsernameFocus = FocusNode();
  // final FocusNode _principalPasswordFocus = FocusNode();
  // final FocusNode _confirmPasswordFocus = FocusNode();

  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // String _errorMessage = '';
  // void processError(final PlatformException error) {
  //   setState(() {
  //     _errorMessage = error.message!;
  //   });
  // }

//   void createAccount() async {
//     String school = schoolNameController.text.trim();
//     String address = addressController.text.trim();
//     String pin = pinCodeController.text.trim();
//     String district = districtController.text.trim();
//     String state = stateController.text.trim();
//     String country = countryController.text.trim();
//     String name = principalNameController.text.trim();
//     String username = principalUsernameController.text.trim();
//     String email = principalEmailController.text.trim();
//     String password = principalPasswordController.text.trim();
//     String cPassword = confirmPasswordController.text.trim();
//
//
//
//     if(email == "" || password=="" || cPassword =="" || school =="" || address =="" || pin==""|| district=="" || state=="" || country=="" || username=="" || name=="")
//       {
//         log("Please fill all the details!");
//       }
//     else if(password!=cPassword)
//       {
//         log("Password do not match");
//       }
//     else{
//         // create new account
//       try{
//         UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
//         if (userCredential.user != null)
//           {
//             Navigator.pop(context);
//           }
//         // log("User Created");
//       } on FirebaseAuthException catch(ex){
//       log(ex.code.toString());
//     }
//     }
//
// }
//   void _submitRegistration() {
//     print('Registration details sent to Principal: ${principalNameController.text}, Username: ${principalUsernameController.text}');
//   }

  // final user = UserModel(
  //   email
  // )

//
// final schoolNameController =  TextEditingController();
// final addressController =  TextEditingController();
// final pinCodeController =  TextEditingController();
// final districtController =  TextEditingController();
// final stateController =  TextEditingController();
// final countryController = TextEditingController();
// final principalNameController = TextEditingController();
// final principalEmailController =  TextEditingController();
// final principalUsernameController = TextEditingController();
// final principalPasswordController = TextEditingController();
// final confirmPasswordController = TextEditingController();



// import 'dart:developer';
// import 'dart:html';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:edpal/repository/authentication_repository/user_repository.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// import '../controllers/register_controller.dart';
// import '../models/user.dart';
// import './material.dart';
// class UserModel {
//   final String schoolName;
//   final String address;
//   final String pinCode;
//   final String district;
//   final String state;
//   final String country;
//   final String principalName;
//   final String principalUserName;
//   final String principalEmail;
//   // Add other properties as needed
//
//   UserModel({
//     required this.schoolName,
//     required this.address,
//     required this.pinCode,
//     required this.district,
//     required this.state,
//     required this.country,
//     required this.principalName,
//     required this.principalUserName,
//     required this.principalEmail,
//     // Add other properties as needed
//   });
// }
//
//
//   class RegisterFormWidget extends StatelessWidget{
//     const RegisterFormWidget({
//       Key? key,
//   }) : super(key:key);
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(RegisterController());
//     final _formKey = GlobalKey<FormState>();
//
//     double minBoxWidth = 2.0 * MediaQuery.of(context).devicePixelRatio;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('School Registration'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   constraints: BoxConstraints(minWidth: minBoxWidth),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         buildTextField(
//                           controller: controller.schoolNameController,
//                           labelText: 'School Name',
//                         ),
//                         buildTextField(
//                           controller: controller.addressController,
//                           labelText: 'School Address',
//                         ),
//                         buildTextField(
//                           controller: controller.pinCodeController,
//                           labelText: 'Pin Code',
//                           //keyboardType: TextInputType.number,
//                           //maxLength: ,
//                         ),
//                         buildTextField(
//                           controller: controller.districtController,
//                           labelText: 'District',
//                         ),
//                         buildTextField(
//                           controller: controller.stateController,
//                           labelText: 'State',
//                         ),
//                         buildTextField(
//                           controller: controller.countryController,
//                           labelText: 'Country',
//                         ),
//                         buildTextField(
//                           controller: controller.principalNameController,
//                           labelText: 'Principal Name',
//                         ),
//                         buildTextField(
//                           controller: controller.principalEmailController,
//                           labelText: 'Email',
//                         ),
//                         buildTextField(
//                           controller: controller.principalUsernameController,
//                           labelText: 'Principal Username',
//                         ),
//                         buildTextField(
//                           controller: controller.principalPasswordController,
//                           labelText: 'Password',
//                           obscureText: true,
//                         ),
//                         buildTextField(
//                           controller: controller.confirmPasswordController,
//                           labelText: 'Confirm Password',
//                           obscureText: true,
//                         ),
//                         const SizedBox(height: 20),
//                         // ElevatedButton(
//                         //   onPressed: () {
//                         //     if (_formKey.currentState!.validate()) {
//                         //       // If all fields are valid, submit the form
//                         //       //RegisterController.instance.registerUser(controller.principalEmailController.text.trim(),controller.principalPasswordController.text.trim());
//                         //       final user = UserModel(
//                         //             schoolName: controller.schoolNameController.text.trim(),
//                         //             address: controller.addressController.text.trim(),
//                         //             pinCode: controller.pinCodeController.text.trim(),
//                         //             district: controller.districtController.text.trim(),
//                         //             state: controller.stateController.text.trim(),
//                         //             country: controller.countryController.text.trim(),
//                         //             principalName: controller.principalNameController.text.trim(),
//                         //             principalUserName: controller.principalUsernameController.text.trim(),
//                         //             principalEmail: controller.principalEmailController.text.trim(),
//                         //             //principalPassword: controller.principalPasswordController.text.trim()
//                         //
//                         //       );
//                         //       RegisterController.instance.createUser(user);
//                         //     }
//                         //   },
//                         //   child: const Text('Submit'),
//                         // ),
//                         ElevatedButton(
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               // If all fields are valid, submit the form
//                               final user = UserModel(
//                                 schoolName: controller.schoolNameController.text.trim(),
//                                 address: controller.addressController.text.trim(),
//                                 pinCode: controller.pinCodeController.text.trim(),
//                                 district: controller.districtController.text.trim(),
//                                 state: controller.stateController.text.trim(),
//                                 country: controller.countryController.text.trim(),
//                                 principalName: controller.principalNameController.text.trim(),
//                                 principalUserName: controller.principalUsernameController.text.trim(),
//                                 principalEmail: controller.principalEmailController.text.trim(),
//                                  // principalPassword: controller.principalPasswordController.text.trim()
//                             );
//                               RegisterController.instance.createUser(user);
//                             }
//                           },
//                           child: const Text('Submit'),
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

  //   Widget buildTextField({
  //     required TextEditingController controller,
  //     required String labelText,
  //     TextInputType keyboardType = TextInputType.text,
  //     int? maxLength,
  //     bool obscureText = false,
  //   }) {
  //     return TextField(
  //       controller: controller,
  //       decoration: InputDecoration(
  //         labelText: labelText,
  //       ),
  //       style: TextStyle(fontSize: 14.0),
  //       keyboardType: keyboardType,
  //       maxLength: maxLength,
  //       obscureText: obscureText,
  //     );
  //   }
  // }


// import 'package:flutter/material.dart';
//
// class RegistrationPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Extract parameters from the route
//     final Map<String, dynamic>? args =
//     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
//
//     // Check if args is null, or any required parameter is missing
//     if (args == null ||
//         args['email'] == null ||
//         args['name'] == null ||
//         args['sname'] == null ||
//         args['password'] == null
//         ) {
//       // Handle the error or redirect to an error page
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Error'),
//         ),
//         body: Center(
//           child: Text('Invalid parameters provided.'),
//         ),
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registration Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Email: ${args['email']}'),
//             Text('Name: ${args['name']}'),
//             Text('StudentName: ${args['sname']}'),
//             Text('Password: ${args['password']}'),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:developer';
// import 'dart:html';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:edpal/repository/authentication_repository/user_repository.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// import '../controllers/register_controller.dart';
// import '../models/user.dart';
// import './material.dart';
//
//
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
//
// import '../services/auth_services.dart';
// import '../utils/utils.dart';
//
// // use % instead os absolute values
// // finzie icon is not visible
// // not scrollable
// class Signup extends StatefulWidget {
//   @override
//   State<Signup> createState() => _SignupState();
// }
//
// class _SignupState extends State<Signup> {
//   final TextEditingController schoolNameController = TextEditingController();
//
//   final TextEditingController addressController = TextEditingController();
//
//   final TextEditingController pinCodeController = TextEditingController();
//
//   final TextEditingController districtController = TextEditingController();
//
//   final TextEditingController stateController = TextEditingController();
//
//   final TextEditingController countryController = TextEditingController();
//
//   final TextEditingController principalNameController = TextEditingController();
//
//   final TextEditingController principalEmailController = TextEditingController();
//
//   final TextEditingController principalUserNameController = TextEditingController();
//
//   final TextEditingController principalPasswordController = TextEditingController();
//
//   final TextEditingController confirmPasswordController = TextEditingController();
//
//   final AuthService authService = AuthService();
//
//   void signupUser() {
//     AuthService().signUpUser(
//       context: context,
//       schoolName: schoolNameController.text,
//       address: addressController.text,
//       pinCode: pinCodeController.text,
//       district: districtController.text,
//       state: stateController.text,
//       country: countryController.text,
//       principalName: principalNameController.text,
//       principalEmail: principalEmailController.text,
//       principalUserName: principalUserNameController.text,
//       principalPassword: principalPasswordController.text,
//     );
//   }
//
//   bool _isHidden = true;
//
//   void _togglePasswordView() {
//     setState(() {
//       _isHidden = !_isHidden;
//     });
//   }
//
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Text(
//               'Welcome!',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 0.02),
//             TextField(
//               controller:  schoolNameController,
//               decoration: const InputDecoration(
//                 labelText: 'School Name',
//               ),
//             ),
//             const SizedBox(height: 0.01),
//             TextField(
//               controller: addressController,
//               decoration: const InputDecoration(
//                 labelText: 'School Address',
//               ),
//             ),
//             const SizedBox(height: 0.01),
//             TextField(
//               controller: pinCodeController,
//               decoration: const InputDecoration(
//                 labelText: 'Pin Code',
//               ),
//             ),
//             const SizedBox(height: 0.01),
//             TextField(
//               controller: districtController,
//               decoration: const InputDecoration(
//                 labelText: 'District',
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 0.01),
//             TextField(
//               controller: stateController,
//               decoration: const InputDecoration(
//                 labelText: 'State',
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 0.01),
//             TextField(
//               controller: countryController,
//               decoration: const InputDecoration(
//                 labelText: 'Country',
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 0.01),
//             TextField(
//               controller: principalNameController,
//               decoration: const InputDecoration(
//                 labelText: 'Principal Name',
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 0.01),
//             TextField(
//               controller: principalEmailController,
//               decoration: const InputDecoration(
//                 labelText: 'Principal Email',
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 0.01),
//             TextField(
//               controller: principalUserNameController,
//               decoration: const InputDecoration(
//                 labelText: 'Principal User Name',
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 0.01),
//             TextField(
//               controller: principalPasswordController,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 0.01),
//             TextField(
//               controller: confirmPasswordController,
//               decoration: const InputDecoration(
//                 labelText: 'Confirm Password',
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 0.02),
//             ElevatedButton(
//               onPressed: () {
//                 // Sign up logic
//                 if (schoolNameController.text == '' ||
//                     addressController.text == '' ||
//                     pinCodeController.text == '' ||
//                     districtController.text == '' ||
//                     stateController.text == '' ||
//                     countryController.text == ''||
//                     principalNameController.text == '' ||
//                     principalEmailController.text == '' ||
//                     principalPasswordController.text == '' ||
//                     confirmPasswordController.text == '') {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Please enter all fields')));
//                 } else if (principalPasswordController.text !=
//                     confirmPasswordController.text) {
//                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                       content:
//                       Text('Password and Confirm Password don\'t match')));
//                 } else if (!EmailValidator.validate(principalEmailController.text)) {
//                   showSnackBar(context, 'Please enter a valid email');
//                 } else {
//                   signupUser();
//                 }
//               },
//               child: const Text('Sign up'),
//             ),
//             const SizedBox(height: 0.01),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text('Already have an account?'),
//                 TextButton(
//                   onPressed: () {
//                     // Navigate to sign-in screen
//                     Navigator.pushNamedAndRemoveUntil(
//                         context, "login", (route) => false);
//                   },
//                   child: const Text('Sign in'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


//firebase/firestore-send-email@0.1.30
// import 'package:flutter/material.dart';
// import 'package:email_validator/email_validator.dart';
// import '../services/auth_services.dart';
// import '../utils/utils.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// class RegisterSchool extends StatefulWidget {
//   const RegisterSchool({super.key});
//
//   @override
//   State<RegisterSchool> createState() => _RegisterSchoolState();
// }
//
// class _RegisterSchoolState extends State<RegisterSchool> {
//   final TextEditingController schoolNameController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController pinCodeController = TextEditingController();
//   final TextEditingController districtController = TextEditingController();
//   final TextEditingController stateController = TextEditingController();
//   final TextEditingController countryController = TextEditingController();
//   final TextEditingController principalNameController = TextEditingController();
//   final TextEditingController principalEmailController = TextEditingController();
//   final TextEditingController principalUserNameController = TextEditingController();
//   final TextEditingController principalPasswordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final AuthService authService = AuthService();
//   bool _isHidden = true;
//
//   void _togglePasswordView() {
//     setState(() {
//       _isHidden = !_isHidden;
//     });
//   }
//
//   void signupUser() {
//     AuthService().signUpUser(
//       context: context,
//       schoolName: schoolNameController.text,
//       address: addressController.text,
//       pinCode: pinCodeController.text,
//       district: districtController.text,
//       state: stateController.text,
//       country: countryController.text,
//       principalName: principalNameController.text,
//       principalEmail: principalEmailController.text,
//       principalUserName: principalUserNameController.text,
//       principalPassword: principalPasswordController.text,
//     );
//   }
//   // bool _isHidden = true;
//   //
//   // void _togglePasswordView() {
//   //   setState(() {
//   //     _isHidden = !_isHidden;
//   //   });
//   // }
//   //
//   // GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register School'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//                children: [
//               //   const Text(
//               //     'Welcome!',
//               //     style: TextStyle(
//               //       fontSize: 24,
//               //       fontWeight: FontWeight.bold,
//               //     ),
//               //   ),
//                 const SizedBox(height: 16.0),
//                 TextField(
//                   controller: schoolNameController,
//                   decoration: const InputDecoration(
//                     labelText: 'School Name',
//                   ),
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextField(
//                   controller: addressController,
//                   decoration: const InputDecoration(
//                     labelText: 'School Address',
//                   ),
//                 ),
//                 // ... other form fields
//                  TextField(
//                    controller: pinCodeController,
//                    decoration: const InputDecoration(
//                      labelText: 'Pin Code',
//                    ),
//                    keyboardType: TextInputType.number,
//                    // Add any other relevant properties or validations
//                  ),
//                  const SizedBox(width: 14.0), // Add some spacing between the fields
//                  Row(
//                    children: [
//                      Expanded(
//                        child: TextField(
//                          controller: districtController,
//                          decoration: InputDecoration(labelText: 'District'),
//                          style: TextStyle(fontSize: 14.0),
//                        ),
//                      ),
//                      Expanded(
//                        child: TextField(
//                          controller: stateController,
//                          decoration: InputDecoration(labelText: 'State'),
//                          style: TextStyle(fontSize: 14.0),
//                        ),
//                      ),
//                      Expanded(
//                        child: TextField(
//                          controller: countryController,
//                          decoration: InputDecoration(labelText: 'Country'),
//                          style: TextStyle(fontSize: 14.0),
//                        ),
//                      ),
//                    ],
//                  ),
//                 // ... other form fields
//                 const SizedBox(height: 16.0),
//                 TextField(
//                   controller: principalNameController,
//                   decoration: const InputDecoration(
//                     labelText: 'Principal Name',
//                   ),
//                 ),
//                 // ... other form fields'
//                 const SizedBox(height: 14.0),
//                 TextField(
//                   controller: principalEmailController,
//                   decoration: const InputDecoration(
//                     labelText: 'Principal Email',
//                   ),
//                 ),
//                 // ... other form fields
//
//                 const SizedBox(height: 14.0),
//                 TextField(
//                   controller: principalUserNameController,
//                   decoration: const InputDecoration(
//                     labelText: 'Username',
//                   ),
//                 ),
//                 // ... other form fields
//                  const SizedBox(height: 14.0),
//                  TextField(
//                    controller: principalPasswordController,
//                    decoration: const InputDecoration(
//                      labelText: 'Password',
//                    ),
//                  ),
//                 const SizedBox(height: 14.0),
//                 TextField(
//                   controller: confirmPasswordController,
//                   decoration: const InputDecoration(
//                     labelText: 'Confirm Password',
//                   ),
//                 ),
//                 // ... other form fiel \
//                  const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState?.validate() ?? false) {
//                       if (schoolNameController.text == '' ||
//                           addressController.text == '' ||
//                           pinCodeController.text == '' ||
//                           districtController.text == '' ||
//                           stateController.text == '' ||
//                           countryController.text == ''||
//                           principalNameController.text == '' ||
//                           principalEmailController.text == '' ||
//                           principalPasswordController.text == '' ||
//                           confirmPasswordController.text == '') {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text('Please enter all fields')));
//                       } else if (principalPasswordController.text !=
//                           confirmPasswordController.text) {
//                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                             content:
//                             Text('Password and Confirm Password don\'t match')));
//                       } else if (!EmailValidator.validate(principalEmailController.text)) {
//                         showSnackBar(context, 'Please enter a valid email');
//                       } else {
//                         signupUser();
//                       }
//                     }
//                   },
//                   child: const Text('Sign up'),
//                 ),
//                 const SizedBox(height: 14.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text('Already have an account?'),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushNamedAndRemoveUntil(
//                             context, "login", (route) => false);
//                       },
//                       child: const Text('Sign in'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


//upar wala code use krna

// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// class RegisterSchoolPage extends StatefulWidget {
//   const RegisterSchoolPage({Key? key}) : super(key: key);
//
//   @override
//   _RegisterSchoolPageState createState() => _RegisterSchoolPageState();
// }
//
//
// class _RegisterSchoolPageState extends State<RegisterSchoolPage> {
//   TextEditingController schoolNameController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController pinCodeController = TextEditingController();
//   TextEditingController districtController = TextEditingController();
//   TextEditingController stateController = TextEditingController();
//   TextEditingController countryController = TextEditingController();
//   TextEditingController principalNameController = TextEditingController();
//   TextEditingController principalEmailController = TextEditingController();
//   TextEditingController principalUsernameController = TextEditingController();
//   TextEditingController principalPasswordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   void createAccount() async {
//     String school = schoolNameController.text.trim();
//     String address = addressController.text.trim();
//     String pin = pinCodeController.text.trim();
//     String district = districtController.text.trim();
//     String state = stateController.text.trim();
//     String country = countryController.text.trim();
//     String name = principalNameController.text.trim();
//     String username = principalUsernameController.text.trim();
//     String email = principalEmailController.text.trim();
//     String password = principalPasswordController.text.trim();
//     String cPassword = confirmPasswordController.text.trim();
//
//     if(email == "" || password=="" || cPassword =="" || school =="" || address =="" || pin==""|| district=="" || state=="" || country=="" || username=="" || name=="")
//     {
//       log("Please fill all the details!");
//     }
//     else if(password!=cPassword)
//     {
//       log("Password do not match");
//     }
//     else{
//       // create new account
//       try{
//         UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
//         if (userCredential.user != null)
//         {
//           Navigator.pop(context);
//         }
//         // log("User Created");
//       } on FirebaseAuthException catch(ex){
//         log(ex.code.toString());
//       }
//     }
//
//   }
//   void _submitRegistration() {
//     print('Registration details sent to Principal: ${principalNameController.text}, Username: ${principalUsernameController.text}');
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     double minBoxWidth = 2.0 * MediaQuery.of(context).devicePixelRatio;
//
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
//                 constraints: BoxConstraints(minWidth: minBoxWidth),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   border: Border.all(color: Colors.grey),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       TextField(
//                         controller: schoolNameController,
//                         decoration: InputDecoration(labelText: 'School Name'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       TextField(
//                         controller: addressController,
//                         decoration: InputDecoration(labelText: 'School Address'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       TextField(
//                         controller: pinCodeController,
//                         keyboardType: TextInputType.number,
//                         maxLength: 6,
//                         decoration: InputDecoration(labelText: 'Pin Code'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: TextField(
//                               controller: districtController,
//                               decoration: InputDecoration(labelText: 'District'),
//                               style: TextStyle(fontSize: 14.0),
//                             ),
//                           ),
//                           Expanded(
//                             child: TextField(
//                               controller: stateController,
//                               decoration: InputDecoration(labelText: 'State'),
//                               style: TextStyle(fontSize: 14.0),
//                             ),
//                           ),
//                           Expanded(
//                             child: TextField(
//                               controller: countryController,
//                               decoration: InputDecoration(labelText: 'Country'),
//                               style: TextStyle(fontSize: 14.0),
//                             ),
//                           ),
//                         ],
//                       ),
//                       TextField(
//                         controller: principalNameController,
//                         decoration: InputDecoration(labelText: 'Principal Name'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       TextField(
//                         controller: principalEmailController,
//                         decoration: InputDecoration(labelText: 'Email'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       TextField(
//                         controller: principalUsernameController,
//                         decoration: InputDecoration(labelText: 'Principal Username'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       TextField(
//                         controller: principalPasswordController,
//                         decoration: InputDecoration(labelText: 'Password'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       TextField(
//                         controller: confirmPasswordController,
//                         decoration: InputDecoration(labelText: 'Confirm Password'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 //onPressed: _submitRegistration,
//                 onPressed: (){
//                   createAccount();
//                 },
//                 child: const Text('Submit'),
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
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// class RegisterSchoolPage extends StatefulWidget {
//   const RegisterSchoolPage({Key? key}) : super(key: key);
//
//   @override
//   _RegisterSchoolPageState createState() => _RegisterSchoolPageState();
// }
//
//
// class _RegisterSchoolPageState extends State<RegisterSchoolPage> {
//   TextEditingController schoolNameController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController pinCodeController = TextEditingController();
//   TextEditingController districtController = TextEditingController();
//   TextEditingController stateController = TextEditingController();
//   TextEditingController countryController = TextEditingController();
//   TextEditingController principalNameController = TextEditingController();
//   TextEditingController principalEmailController = TextEditingController();
//   TextEditingController principalUsernameController = TextEditingController();
//   TextEditingController principalPasswordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   void createAccount() async {
//     String school = schoolNameController.text.trim();
//     String address = addressController.text.trim();
//     String pin = pinCodeController.text.trim();
//     String district = districtController.text.trim();
//     String state = stateController.text.trim();
//     String country = countryController.text.trim();
//     String name = principalNameController.text.trim();
//     String username = principalUsernameController.text.trim();
//     String email = principalEmailController.text.trim();
//     String password = principalPasswordController.text.trim();
//     String cPassword = confirmPasswordController.text.trim();
//
//     if(email == "" || password=="" || cPassword =="" || school =="" || address =="" || pin==""|| district=="" || state=="" || country=="" || username=="" || name=="")
//     {
//       log("Please fill all the details!");
//     }
//     else if(password!=cPassword)
//     {
//       log("Password do not match");
//     }
//     else{
//       // create new account
//       try{
//         UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
//         if (userCredential.user != null)
//         {
//           Navigator.pop(context);
//         }
//         // log("User Created");
//       } on FirebaseAuthException catch(ex){
//         log(ex.code.toString());
//       }
//     }
//
//   }
//   void _submitRegistration() {
//     print('Registration details sent to Principal: ${principalNameController.text}, Username: ${principalUsernameController.text}');
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     double minBoxWidth = 2.0 * MediaQuery.of(context).devicePixelRatio;
//
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
//                 constraints: BoxConstraints(minWidth: minBoxWidth),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   border: Border.all(color: Colors.grey),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       TextField(
//                         controller: schoolNameController,
//                         decoration: InputDecoration(labelText: 'School Name'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       TextField(
//                         controller: addressController,
//                         decoration: InputDecoration(labelText: 'School Address'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       // TextField(
//                       //   controller: pinCodeController,
//                       //   keyboardType: TextInputType.number,
//                       //   maxLength: 6,
//                       //   decoration: InputDecoration(labelText: 'Pin Code'),
//                       //   style: TextStyle(fontSize: 14.0),
//                       // ),
//                       // Row(
//                       //   children: [
//                       //     Expanded(
//                       //       child: TextField(
//                       //         controller: districtController,
//                       //         decoration: InputDecoration(labelText: 'District'),
//                       //         style: TextStyle(fontSize: 14.0),
//                       //       ),
//                       //     ),
//                       //     Expanded(
//                       //       child: TextField(
//                       //         controller: stateController,
//                       //         decoration: InputDecoration(labelText: 'State'),
//                       //         style: TextStyle(fontSize: 14.0),
//                       //       ),
//                       //     ),
//                       //     Expanded(
//                       //       child: TextField(
//                       //         controller: countryController,
//                       //         decoration: InputDecoration(labelText: 'Country'),
//                       //         style: TextStyle(fontSize: 14.0),
//                       //       ),
//                       //     ),
//                       //   ],
//                       // ),
//                       TextField(
//                         controller: principalNameController,
//                         decoration: InputDecoration(labelText: 'Principal Name'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       TextField(
//                         controller: principalEmailController,
//                         decoration: InputDecoration(labelText: 'Email'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       TextField(
//                         controller: principalUsernameController,
//                         decoration: InputDecoration(labelText: 'Principal Username'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       TextField(
//                         controller: principalPasswordController,
//                         decoration: InputDecoration(labelText: 'Password'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       TextField(
//                         controller: confirmPasswordController,
//                         decoration: InputDecoration(labelText: 'Confirm Password'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 //onPressed: _submitRegistration,
//                 onPressed: (){
//                   createAccount();
//                 },
//                 child: const Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//
// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
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
//   TextEditingController principalNameController = TextEditingController();
//   TextEditingController principalEmailController = TextEditingController();
//   TextEditingController principalUsernameController = TextEditingController();
//   TextEditingController principalPasswordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//
//   Future<void> createAccount() async {
//     String email = principalEmailController.text.trim();
//     String password = principalPasswordController.text.trim();
//     String cPassword = confirmPasswordController.text.trim();
//
//     if (email.isEmpty ||
//         password.isEmpty ||
//         cPassword.isEmpty ||
//         schoolNameController.text.isEmpty ||
//         addressController.text.isEmpty ||
//         principalNameController.text.isEmpty ||
//         principalUsernameController.text.isEmpty) {
//       log("Please fill all the details!");
//       return;
//     }
//
//     if (password != cPassword) {
//       log("Passwords do not match");
//       return;
//     }
//
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       if (userCredential.user != null) {
//         Navigator.pop(context);
//       }
//     } on FirebaseAuthException catch (ex) {
//       log("Error creating user: ${ex.message}");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double minBoxWidth = 2.0 * MediaQuery.of(context).devicePixelRatio;
//
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
//                 constraints: BoxConstraints(minWidth: minBoxWidth),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   border: Border.all(color: Colors.grey),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       TextField(
//                         controller: schoolNameController,
//                         decoration: InputDecoration(labelText: 'School Name'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       TextField(
//                         controller: addressController,
//                         decoration: InputDecoration(labelText: 'School Address'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       TextField(
//                         controller: principalNameController,
//                         decoration: InputDecoration(labelText: 'Principal Name'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       TextField(
//                         controller: principalEmailController,
//                         decoration: InputDecoration(labelText: 'Email'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       TextField(
//                         controller: principalUsernameController,
//                         decoration: InputDecoration(labelText: 'Principal Username'),
//                         style: TextStyle(fontSize: 14.0),
//                       ),
//                       TextField(
//                         controller: principalPasswordController,
//                         decoration: InputDecoration(labelText: 'Password'),
//                         style: TextStyle(fontSize: 14.0),
//                         obscureText: true,
//                       ),
//                       TextField(
//                         controller: confirmPasswordController,
//                         decoration: InputDecoration(labelText: 'Confirm Password'),
//                         style: TextStyle(fontSize: 14.0),
//                         obscureText: true,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: createAccount,
//                 child: const Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class SchoolRegistration extends StatefulWidget {
//   @override
//   _SchoolRegistrationState createState() => _SchoolRegistrationState();
// }
//
// class _SchoolRegistrationState extends State<SchoolRegistration> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _schoolNameController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _principalNameController = TextEditingController();
//   final TextEditingController _principalEmailController = TextEditingController();
//   final TextEditingController _principalUsernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//
//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       // Save form data to Firestore
//       FirebaseFirestore.instance.collection('schools').add({
//         'schoolName': _schoolNameController.text,
//         'address': _addressController.text,
//         'principalName': _principalNameController.text,
//         'principalEmail': _principalEmailController.text,
//         'principalUsername': _principalUsernameController.text,
//         // You may want to hash or encrypt the password before storing it in the database
//         'password': _passwordController.text,
//       }).then((value) {
//         // Success, do something if needed
//         print('School registered successfully!');
//       }).catchError((error) {
//         // Error handling, do something if needed
//         print('Failed to register school: $error');
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('School Registration'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 TextFormField(
//                   controller: _schoolNameController,
//                   decoration: InputDecoration(labelText: 'School Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the school name';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _addressController,
//                   decoration: InputDecoration(labelText: 'Address'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the address';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _principalNameController,
//                   decoration: InputDecoration(labelText: 'Principal Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the principal name';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _principalEmailController,
//                   decoration: InputDecoration(labelText: 'Principal Email'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the principal email';
//                     }
//                     // You may want to add email format validation here
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _principalUsernameController,
//                   decoration: InputDecoration(labelText: 'Principal Username'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the principal username';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(labelText: 'Password'),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a password';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _confirmPasswordController,
//                   decoration: InputDecoration(labelText: 'Confirm Password'),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please confirm your password';
//                     }
//                     if (value != _passwordController.text) {
//                       return 'Passwords do not match';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20.0),
//                 ElevatedButton(
//                   onPressed: _submitForm,
//                   child: Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'dart:convert';
// import 'package:crypto/crypto.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class SchoolRegistration extends StatefulWidget {
//   @override
//   _SchoolRegistrationState createState() => _SchoolRegistrationState();
// }
//
// class _SchoolRegistrationState extends State<SchoolRegistration> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _schoolNameController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _principalNameController = TextEditingController();
//   final TextEditingController _principalEmailController = TextEditingController();
//   final TextEditingController _principalUsernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//
//   void _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       // Hash the password
//       String hashedPassword = _hashPassword(_passwordController.text);
//
//       // Save form data to Firestore
//       try {
//         await FirebaseFirestore.instance.collection('schools').add({
//           'schoolName': _schoolNameController.text,
//           'address': _addressController.text,
//           'principalName': _principalNameController.text,
//           'principalEmail': _principalEmailController.text,
//           'principalUsername': _principalUsernameController.text,
//           'password': hashedPassword,
//         });
//
//         // Send email verification to the principal email
//         await _sendEmailVerification(_principalEmailController.text);
//
//         // Navigate to success screen or display a success message
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('School registered successfully!')),
//         );
//       } catch (error) {
//         // Error handling
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to register school: $error')),
//         );
//       }
//     }
//   }
//
//   String _hashPassword(String password) {
//     // Hash the password using a strong hashing algorithm like bcrypt
//     var bytes = utf8.encode(password);
//     var digest = sha256.convert(bytes);
//     return digest.toString();
//   }
//
//   Future<void> _sendEmailVerification(String email) async {
//     // Send email verification to the provided email address
//     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('School Registration'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 TextFormField(
//                   controller: _schoolNameController,
//                   decoration: InputDecoration(labelText: 'School Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the school name';
//                     }
//                     return null;
//                   },
//                 ),
//                 // Other form fields...
//                 TextFormField(
//                   controller: _addressController,
//                   decoration: InputDecoration(labelText: 'Address'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the address';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _principalNameController,
//                   decoration: InputDecoration(labelText: 'Principal Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the principal name';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _principalEmailController,
//                   decoration: InputDecoration(labelText: 'Principal Email'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the principal email';
//                     }
//                     // You may want to add email format validation here
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _principalUsernameController,
//                   decoration: InputDecoration(labelText: 'Principal Username'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the principal username';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(labelText: 'Password'),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a password';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _confirmPasswordController,
//                   decoration: InputDecoration(labelText: 'Confirm Password'),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please confirm your password';
//                     }
//                     if (value != _passwordController.text) {
//                       return 'Passwords do not match';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20.0),
//                 ElevatedButton(
//                   onPressed: _submitForm,
//                   child: Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//


// import 'dart:convert';
// import 'package:crypto/crypto.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import 'login.dart';
// import 'package:edpal/screens/member_registration.dart';
//
// class SchoolRegistration extends StatefulWidget {
//   @override
//   _SchoolRegistrationState createState() => _SchoolRegistrationState();
// }
//
// class _SchoolRegistrationState extends State<SchoolRegistration> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _schoolNameController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _principalNameController = TextEditingController();
//   final TextEditingController _principalEmailController = TextEditingController();
//   final TextEditingController _principalUsernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//
//   void _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       // Hash the password
//       String hashedPassword = _hashPassword(_passwordController.text);
//
//       // Check if the email is already registered
//       bool emailExists = await _checkEmailExists(_principalEmailController.text);
//       if (emailExists) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Email already registered. Please use a different email.')),
//         );
//         return;
//       }
//
//       // Save form data to Firestore
//       try {
//         await FirebaseFirestore.instance.collection('schools').add({
//           'schoolName': _schoolNameController.text,
//           'address': _addressController.text,
//           'principalName': _principalNameController.text,
//           'principalEmail': _principalEmailController.text,
//           'principalUsername': _principalUsernameController.text,
//           'password': hashedPassword,
//         });
//
//         // Navigate to login screen for the principal
//         Navigator.pushReplacement(
//           context,
//           // MaterialPageRoute(builder: (context) => LoginPage()),
//             MaterialPageRoute(builder: (context) =>MemberRegistration(schoolId: '',)),
//         );
//
//         // Display success message
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('School registered successfully!')),
//         );
//       } catch (error) {
//         // Error handling
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to register school: $error')),
//         );
//       }
//     }
//   }
//
//   String _hashPassword(String password) {
//     // Hash the password using a strong hashing algorithm like bcrypt
//     var bytes = utf8.encode(password);
//     var digest = sha256.convert(bytes);
//     return digest.toString();
//   }
//
//   Future<bool> _checkEmailExists(String email) async {
//     // Check if the provided email exists in the database
//     QuerySnapshot query = await FirebaseFirestore.instance
//         .collection('schools')
//         .where('principalEmail', isEqualTo: email)
//         .get();
//     return query.docs.isNotEmpty;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('School Registration'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 TextFormField(
//                   controller: _schoolNameController,
//                   decoration: InputDecoration(labelText: 'School Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the school name';
//                     }
//                     return null;
//                   },
//                 ),
//                 // Other form fields...
//                 TextFormField(
//                   controller: _addressController,
//                   decoration: InputDecoration(labelText: 'Address'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the address';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _principalNameController,
//                   decoration: InputDecoration(labelText: 'Principal Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the principal name';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _principalEmailController,
//                   decoration: InputDecoration(labelText: 'Principal Email'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the principal email';
//                     }
//                     // You may want to add email format validation here
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _principalUsernameController,
//                   decoration: InputDecoration(labelText: 'Principal Username'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the principal username';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(labelText: 'Password'),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a password';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _confirmPasswordController,
//                   decoration: InputDecoration(labelText: 'Confirm Password'),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please confirm your password';
//                     }
//                     if (value != _passwordController.text) {
//                       return 'Passwords do not match';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20.0),
//                 ElevatedButton(
//                   onPressed: _submitForm,
//                   child: Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PrincipalLogin extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Principal Login'),
//       ),
//       body: Center(
//         child: Text('Principal Login Screen'),
//       ),
//     );
//   }
// }



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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('School registration successful! Verification email sent to principal.')),
        );
      } catch (error) {
        // Error handling
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to register school: $error')),
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

