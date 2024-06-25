import 'package:edpal/screens/edit_profile.dart';
import 'package:edpal/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:edpal/screens/profile_database.dart';
import 'package:edpal/screens/profile_auth.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final AuthenticationService _auth = AuthenticationService();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();
  List userProfilesList = [];

  String userID = "";

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
    fetchDatabaseList(userID);
  }

  fetchUserInfo() async {
    User? getUser = FirebaseAuth.instance.currentUser;
    userID = getUser!.uid;
    fetchDatabaseList(userID);
  }

  fetchDatabaseList(String userID) async {
    dynamic resultant = await DatabaseManager().getUserData(userID);

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = [resultant]; // Store the user's data in a list
      });
    }
  }
  updateData(String name, String email, String bio, String imageUrl, String userID) async {
    await DatabaseManager().updateUserList(name, email, bio, imageUrl, userID);
    fetchDatabaseList(userID); // Pass the userID as an argument
  }


  void logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          ElevatedButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
              fetchDatabaseList(userID);
            },
            child: Icon(
              Icons.edit,
              color: Colors.lightBlueAccent.shade400,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              logOut(context);
            },
            child: Icon(
              Icons.exit_to_app,
              color: Colors.lightBlueAccent.shade400,
            ),
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: userProfilesList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(userProfilesList[index]['imageUrl']),
                      ),
                      SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userProfilesList[index]['name'],
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              userProfilesList[index]['email'],
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 10),
                            Text(
                              userProfilesList[index]['bio'],
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

