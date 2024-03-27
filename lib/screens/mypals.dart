// import 'package:flutter/material.dart';
// import 'user_data.dart';
// class MyPalsPage extends StatelessWidget {
//   const MyPalsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Pals'),
//       ),
//       body: const Center(
//         child: Text('This is the My Pals Page!'),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'user_data.dart';
// import 'package:geolocator/geolocator.dart';
// class Profile {
//   String name;
//   String school;
//   String course;
//   String distance;
//   String group;
//
//   Profile(this.name, this.school, this.course, this.distance, this.group);
// }
// class MyPals extends StatefulWidget {
// // const MyPalsPage({super.key});
//   @override
//   _MyPalsState createState() => _MyPalsState();
// }
//
// class _MyPalsState extends State<MyPals> {
//   // Initialize variables for filters
//   bool sameSchool = true;
//   bool sameCourse = true;
//   bool within5KM = true;
//   bool sameGroup = true;
//
//   // Mock data for user profiles
//   List<UserProfile> profiles = [
//     UserProfile("John", "Same School", "Same Course", "5 KM Away", "Group A"),
//     UserProfile("Jane", "Another School", "Same Course", "10 KM Away", "Group B"),
//     // Add more profiles as needed
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MyPals'),
//       ),
//       body: ListView.builder(
//         itemCount: profiles.length,
//         itemBuilder: (context, index) {
//           UserProfile profile = profiles[index];
//           // Apply filters
//           if ((!sameSchool || profile.school == "Same School") &&
//               (!sameCourse || profile.course == "Same Course") &&
//               (!within5KM || isWithin5KM(profile.distance)) &&
//               (!sameGroup || profile.group == "Same Group")) {
//             return ListTile(
//               title: Text(profile.name),
//               onTap: () {
//                 // Navigate to the profile page
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ProfilePage(profile)),
//                 );
//               },
//             );
//           } else {
//             // Return an empty container if the profile doesn't match filters
//             return Container();
//           }
//         },
//       ),
//     );
//   }
//
//   // Helper function to check if a distance is within 5KM
//   bool isWithin5KM(String distance) {
//     double? distanceValue = double.tryParse(distance.split(" ")[0]);
//     return distanceValue != null && distanceValue <= 5.0;
//   }
// }
//
// class UserProfile {
//   final String name;
//   final String school;
//   final String course;
//   final String distance;
//   final String group;
//
//   UserProfile(this.name, this.school, this.course, this.distance, this.group);
// }
//
// class ProfilePage extends StatelessWidget {
//   final UserProfile profile;
//
//   ProfilePage(this.profile);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text('Name: ${profile.name}'),
//           Text('School: ${profile.school}'),
//           Text('Course: ${profile.course}'),
//           Text('Distance: ${profile.distance}'),
//           Text('Group: ${profile.group}'),
//           // Add more profile details as needed
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MyPalsPage extends StatefulWidget {
  const MyPalsPage({super.key});

  @override
  _MyPalsPageState createState() => _MyPalsPageState();
}

class _MyPalsPageState extends State<MyPalsPage> {
  bool filterSameSchool = false;
  bool filterSameCourse = false;
  bool filterWithin5Km = false;
  bool filterSameGroup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pals'),
      ),
      body: Column(
        children: [
          // Filtering options
          _buildFilters(),
          // List of users based on applied filters
          Expanded(
            child: _buildUserList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Column(
      children: [
        CheckboxListTile(
          title: const Text('Same School'),
          value: filterSameSchool,
          onChanged: (value) {
            setState(() {
              filterSameSchool = value!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Same Course'),
          value: filterSameCourse,
          onChanged: (value) {
            setState(() {
              filterSameCourse = value!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Within 5 KM'),
          value: filterWithin5Km,
          onChanged: (value) {
            setState(() {
              filterWithin5Km = value!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Same Group'),
          value: filterSameGroup,
          onChanged: (value) {
            setState(() {
              filterSameGroup = value!;
            });
          },
        ),
      ],
    );
  }

  Widget _buildUserList() {
    // Implement logic to fetch and filter user data based on selected filters
    // Replace this with your actual list of users
    List<String> users = ['User 1', 'User 2', 'User 3'];

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(users[index]),
          onTap: () {
            // Navigate to the selected user's profile page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserProfilePage(userName: users[index])),
            );
          },
        );
      },
    );
  }
}

class UserProfilePage extends StatelessWidget {
  final String userName;

  const UserProfilePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
      ),
      body: Column(
        children: [
          // Profile details can be displayed here
          // Options for MESSAGE and CONNECT buttons
          _buildProfileOptions(),
        ],
      ),
    );
  }

  Widget _buildProfileOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            // Implement message functionality
          },
          child: const Text('MESSAGE'),
        ),
        ElevatedButton(
          onPressed: () {
            // Implement connect functionality
          },
          child: const Text('CONNECT'),
        ),
      ],
    );
  }
}
