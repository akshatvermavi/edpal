// import 'package:flutter/material.dart';
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: Center(
//         child: Text('Welcome to the Home Page!'),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'about.dart';
import 'mypals.dart';
import 'myschool.dart';
import 'mygroups.dart';
import 'notes.dart';
import 'myapplauses.dart';
import 'profile.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Home Page'),
    //   ),
    appBar: AppBar(
      title: Row(
        children: [
          GestureDetector(
          onTap: () {
      // Navigate to edpal.dart when the logo is clicked
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  AboutPage()),
            );
          },
          child: Image.asset(
            'assets/logo/android/drawable-hdpi/edpal.png',
            width: 40, // Adjust the width as needed
            height: 40, // Adjust the height as needed
          ),
          ),
          SizedBox(width: 8), // Add some spacing between logo and title
          Text(
            'Edpal',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              // Your scrollable content goes here
              const Center(
                child: Text('Welcome to the Home Page!'),
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // IconButton(
            //   icon: const Icon(Icons.info),
            //   // icon: Image.asset('Edpal_logo/Single_logo.png', width: 24, height: 24),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => const AboutPage()),
            //     );
            //   },
            // ),
            IconButton(
              icon: const Icon(Icons.group),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyPalsPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.school),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MySchoolPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.people),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyGroupsPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.notes),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotesPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApplausesPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

