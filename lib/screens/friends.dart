// import 'package:flutter/material.dart';
// import 'package:ic_launcher.png/screens/mypals_database.dart';
//
// class FriendsScreen extends StatefulWidget {
//   @override
//   _FriendsScreenState createState() => _FriendsScreenState();
// }
//
// class _FriendsScreenState extends State<FriendsScreen> {
//   List<Map<String, dynamic>> friendsList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchFriendsList();
//   }
//
//   fetchFriendsList() async {
//     // Fetch friends list from Firestore or any other backend
//     dynamic resultant = await DatabaseManager().getFriendsList();
//
//     if (resultant == null) {
//       print('Unable to retrieve friends list');
//     } else {
//       setState(() {
//         friendsList = resultant;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Friends'),
//         backgroundColor: Colors.lightBlueAccent,
//       ),
//       body: Container(
//         child: ListView.builder(
//           itemCount: friendsList.length,
//           itemBuilder: (context, index) {
//             return Card(
//               child: ListTile(
//                 title: Text(friendsList[index]['name']),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(friendsList[index]['email']),
//                     Text(friendsList[index]['bio']),
//                   ],
//                 ),
//                 leading: CircleAvatar(
//                   backgroundImage: NetworkImage(friendsList[index]['imageUrl']),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
