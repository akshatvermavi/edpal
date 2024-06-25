import 'package:edpal/screens/mypals_profiles.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:edpal/screens/filtered_profile_page.dart'; // Import FilteredProfilePage
import 'package:edpal/screens/user_data.dart';

class MyPalsPage extends StatefulWidget {
  @override
  _MyPalsPageState createState() => _MyPalsPageState();
}

class _MyPalsPageState extends State<MyPalsPage> {
  bool sameSchoolFilter = false;
  bool within5KmFilter = false;
  bool sameClassFilter = false;
  bool sameCourseFilter = false;
  List<UserData> users = []; // List of user data from Firestore
  List<UserData> filteredUsers = []; // Filtered user data
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void toggleSameSchoolFilter() {
    setState(() {
      sameSchoolFilter = !sameSchoolFilter;
    });
  }

  void togglesameClassFilter() {
    setState(() {
      sameClassFilter = !sameClassFilter;
    });
  }

  void togglesameCourseFilter() {
    setState(() {
      sameCourseFilter = !sameCourseFilter;
    });
  }

  void toggleWithin5KmFilter() {
    setState(() {
      within5KmFilter = !within5KmFilter;
    });
  }

  Future<List<UserData>> filterUsers() async {
    List<UserData> filteredUsers = users;

    if (sameSchoolFilter) {
      filteredUsers = filteredUsers
          .where((user) => user.school == 'Your School Name')
          .toList();
    }
    if (sameClassFilter) {
      filteredUsers = filteredUsers
          .where((user) => user.school == 'Your Class Name')
          .toList();
    }
    if (sameCourseFilter) {
      filteredUsers = filteredUsers
          .where((user) => user.school == 'Your Course Name')
          .toList();
    }
    if (within5KmFilter) {
      filteredUsers = filteredUsers
          .where((user) => user.school == 'Your School Name')
          .toList();
    }
    // if (within5KmFilter) {
    //   // Get user's current location
    //   Position userLocation = await Geolocator.getCurrentPosition(
    //       desiredAccuracy: LocationAccuracy.high);
    //
    //   // Placeholder values for school latitude and longitude
    //   double schoolLatitude = 37.7749;
    //   double schoolLongitude = -122.4194;
    //
    //   // Filter users within 5 KM
    //   filteredUsers = filteredUsers.where((user) {
    //     double distanceInMeters = Geolocator.distanceBetween(
    //         userLocation.latitude, userLocation.longitude, schoolLatitude,
    //         schoolLongitude);
    //     double distanceInKm = distanceInMeters / 1000; // Convert meters to kilometers
    //     return distanceInKm <= 5;
    //   }).toList();
    // }

    return filteredUsers;
  }

  void submitFilters() async {
    filteredUsers = await filterUsers();
    Navigator.push(
      context,
      MaterialPageRoute(
        //builder: (context) => FilteredProfilePage(filteredUsers: filteredUsers)),
          builder: (context) => DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Pals'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search users',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(),
                ),
              ),
            ),
          ),
          Text(
            'Filters:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CheckboxListTile(
            title: Text('Same School'),
            value: sameSchoolFilter,
            onChanged: (value) {
              setState(() {
                sameSchoolFilter = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Same Class'),
            value: sameClassFilter,
            onChanged: (value) {
              setState(() {
                sameClassFilter = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Same Course'),
            value: sameCourseFilter,
            onChanged: (value) {
              setState(() {
                sameCourseFilter = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Within 5 KM'),
            value: within5KmFilter,
            onChanged: (value) {
              setState(() {
                within5KmFilter = value!;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: submitFilters,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}



