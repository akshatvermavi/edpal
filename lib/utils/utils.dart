// import 'dart:convert';
// import 'package:flutter/material.dart';
// // ignore: depend_on_referenced_packages
// import 'package:http/http.dart' as http;
//
// void showSnackBar(BuildContext context, String text) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(text),
//     ),
//   );
// }
//
// void httpErrorHandle({
//   required http.Response response,
//   required BuildContext context,
//   required VoidCallback onSuccess,
// }) async {
//   switch (response.statusCode) {
//     case 200:
//       onSuccess();
//       break;
//     case 400:
//       showSnackBar(context, jsonDecode(response.body)['msg']);
//       break;
//     case 500:
//       showSnackBar(context, jsonDecode(response.body)['error']);
//       break;
//     default:
//       showSnackBar(context, response.body);
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:/fluttertoast.dart';
//
// class Utils {
//
//
//   void toastMessage(String message){
//     Fluttertoast.showToast(
//         msg: message,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0
//     );
//   }
// }
// import 'package:flutter/material.dart';
//   class Utils {
//   static void showToast(BuildContext context, String message) {
//   final scaffold = ScaffoldMessenger.of(context);
//   scaffold.showSnackBar(
//   SnackBar(
//   content: Text(message),
//   duration: Duration(seconds: 2),
//   ),
//   );
//   }
//   }


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
class Utils {
  void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
pickImage(ImageSource source) async {
  final ImagePicker imagePicker=ImagePicker();
  XFile? file= await imagePicker.pickImage(source: source);
  if(file!=null){
    return await file.readAsBytes();
  }
  print('No image selected');
}

showSnackBar(String content,BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
  Text(content),
  ),);
}

//
// void showSnackBar(BuildContext context, String text) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(text),
//     ),
//   );
// }
//
// void httpErrorHandle({
//   required http.Response response,
//   required BuildContext context,
//   required VoidCallback onSuccess,
// }) async {
//   switch (response.statusCode) {
//     case 200:
//       onSuccess();
//       break;
//     case 400:
//       showSnackBar(context, jsonDecode(response.body)['msg']);
//       break;
//     case 500:
//       showSnackBar(context, jsonDecode(response.body)['error']);
//       break;
//     default:
//       showSnackBar(context, response.body);
//   }
// }
