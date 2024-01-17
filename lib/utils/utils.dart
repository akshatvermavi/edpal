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
