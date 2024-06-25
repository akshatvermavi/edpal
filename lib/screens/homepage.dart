import 'package:edpal/screens/chat.dart';
import 'package:edpal/screens/feed.dart';
import 'package:edpal/screens/my_applauses.dart';
import 'package:edpal/screens/post_page.dart';
import 'package:edpal/screens/profile_model.dart';
import 'package:edpal/screens/second.dart';
import 'package:flutter/material.dart';
import 'about.dart';
import 'mypals.dart';
import 'myschool.dart';
import 'mygroups.dart';
import 'notes.dart';
import 'profile.dart';
import 'package:edpal/main.dart';

const IconData person_pin_circle_rounded = IconData(0xf006d, fontFamily: 'MaterialIcons');
class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                // Navigate to edpal.dart when the logo is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
              child: Image.asset(
                'assets/logo/android/drawable-hdpi/edpal.png',
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Edpal',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                //MaterialPageRoute(builder: (context) => ProfilePage(user:null,)),
                MaterialPageRoute(builder:(context) => DashboardScreen()),
                //MaterialPageRoute(builder: (context) => ProfilePage(profile: Profile(name: 'Guest', email: 'guest@example.com', imageUrl: 'https://via.placeholder.com/150', bio: 'I am a guest user.', id: '',)),),
              );
            },
          ),
        ],
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: FeedPage(), // Display the FeedPage here
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.person_pin_circle_rounded),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPalsPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.school),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MemberRegistration()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.people),
              onPressed: () {
                Navigator.push(
                  context,
                  //MaterialPageRoute(builder: (context) => const MyGroupsPage()), ChatScreen
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.notes),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen(url: '',)),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => MyApplauses()),
                  //MaterialPageRoute(builder: (context) => ActivityFeedPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.post_add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostPage()),
                  //MaterialPageRoute(builder: (context) => PostService()),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
    );
  }

  Widget _buildFeedItem(BuildContext context, {required String username, required String profileImageUrl, required String postImageUrl}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(profileImageUrl),
                radius: 20,
              ),
              const SizedBox(width: 8),
              Text(
                username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              postImageUrl,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width, // Adjust the width as needed
              height: 200, // Adjust the height as needed
            ),
          ),
        ],
      ),
    );
  }
}


