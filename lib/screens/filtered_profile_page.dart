import 'package:flutter/material.dart';
import 'package:edpal/screens/user_data.dart'; // Import the UserData class

class FilteredProfilePage extends StatelessWidget {
  final List<UserData> filteredUsers;

  FilteredProfilePage({required this.filteredUsers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Profiles'),
      ),
      body: ListView.builder(
        itemCount: filteredUsers.length,
        itemBuilder: (context, index) {
          UserData user = filteredUsers[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.school),
            // Add more details as needed
          );
        },
      ),
    );
  }
}
