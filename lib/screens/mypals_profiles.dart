import 'package:edpal/screens/edit_profile.dart';
import 'package:edpal/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:edpal/screens/mypals_database.dart';
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
    fetchDatabaseList();
  }

  fetchUserInfo() async {
    User? getUser = FirebaseAuth.instance.currentUser;
    userID = getUser!.uid;
  }

  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getUsersList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = resultant;
      });
    }
  }

  updateData(String name, String email, String bio, String imageUrl, String userID) async {
    await DatabaseManager().updateUserList(name, email, bio, imageUrl, userID);
    fetchDatabaseList();
  }

  addFriend(String friendID) async {
    await DatabaseManager().addFriend(userID, friendID);
    fetchDatabaseList();
  }

  showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Pals'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Container(
            child: ListView.builder(
                itemCount: userProfilesList.length,
                itemBuilder: (context, index) {
                  return ProfileCard(
                    userData: userProfilesList[index],
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Add Friend'),
                              content: Text('Do you want to add ${userProfilesList[index]['name']} as a friend?'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    addFriend(userProfilesList[index]['id']);
                                    showSnackBar('Friend added');
                                    Navigator.pop(context);
                                  },
                                  child: Text('Add'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel'),
                                )
                              ],
                            );
                          });
                    },
                  );
                })));
  }
}

class ProfileCard extends StatelessWidget {
  final Map<String, dynamic> userData;
  final VoidCallback onTap;

  const ProfileCard({required this.userData, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Text(userData['name']),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userData['email']),
              Text(userData['bio']),
            ],
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(userData['imageUrl']),
          ),
        ),
      ),
    );
  }
}