// // import 'package:flutter/material.dart';
// //
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Home Page'),
// //       ),
// //       body: Center(
// //         child: Text('Welcome to the Home Page!'),
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import 'about.dart';
// import 'mypals.dart';
// import 'myschool.dart';
// import 'mygroups.dart';
// import 'notes.dart';
// import 'myapplauses.dart';
// import 'profile.dart';
// import 'user_data.dart';
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //   appBar: AppBar(
//       //     title: const Text('Home Page'),
//       //   ),
//       appBar: AppBar(
//         title: Row(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 // Navigate to edpal.dart when the logo is clicked
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) =>  AboutPage()),
//                 );
//               },
//               child: Image.asset(
//                 'assets/logo/android/drawable-hdpi/edpal.png',
//                 width: 40, // Adjust the width as needed
//                 height: 40, // Adjust the height as needed
//               ),
//             ),
//             SizedBox(width: 8), // Add some spacing between logo and title
//             Text(
//               'Edpal',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverList(
//             delegate: SliverChildListDelegate([
//               // Your scrollable content goes here
//               const Center(
//                 child: Text('Welcome to the Home Page!'),
//               ),
//             ]),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             // IconButton(
//             //   icon: const Icon(Icons.info),
//             //   // icon: Image.asset('Edpal_logo/Single_logo.png', width: 24, height: 24),
//             //   onPressed: () {
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(builder: (context) => const AboutPage()),
//             //     );
//             //   },
//             // ),
//             IconButton(
//               icon: const Icon(Icons.group),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyPalsPage()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.school),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                  // MaterialPageRoute(builder: (context) => const MySchoolPage()),MemberRegistration
//                   MaterialPageRoute(builder: (context) => MemberRegistration()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.people),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const MyGroupsPage()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.notes),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) =>  NotesPage()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.favorite),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) =>  MyApplausePage()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.person),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   // MaterialPageRoute(builder: (context) => const ProfilePage(userData: null,)),
//                   MaterialPageRoute(builder: (context) => ProfilePage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'about.dart';
// import 'mypals.dart';
// import 'myschool.dart';
// import 'mygroups.dart';
// import 'notes.dart';
// import 'myapplauses.dart';
// import 'profile.dart';
// import 'user_data.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 // Navigate to edpal.dart when the logo is clicked
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => AboutPage()),
//                 );
//               },
//               child: Image.asset(
//                 'assets/logo/android/drawable-hdpi/edpal.png',
//                 width: 40,
//                 height: 40,
//               ),
//             ),
//             SizedBox(width: 8),
//             Text(
//               'Edpal',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.post_add),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => PostPage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverList(
//             delegate: SliverChildListDelegate([
//               const Center(
//                 child: Text('Welcome to the Home Page!'),
//               ),
//             ]),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               icon: Icon(Icons.group),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyPalsPage()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.school),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MemberRegistration()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.people),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyGroupsPage()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.notes),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => NotesPage()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.favorite),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyApplausePage()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.person),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ProfilePage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class PostPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Post'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Widgets for post content and image upload can be added here
//             Text('Post Content'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement logic to post data to Firebase Firestore
//                 // This could involve uploading text and images
//               },
//               child: Text('Post'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:edpal/screens/post_page.dart';
import 'package:flutter/material.dart';
import 'about.dart';
import 'mypals.dart';
import 'myschool.dart';
import 'mygroups.dart';
import 'notes.dart';
import 'myapplauses.dart';
import 'profile.dart';

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
                MaterialPageRoute(builder: (context) => ProfilePage(),),
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            // delegate: SliverChildBuilderDelegate(
            //       (BuildContext context, int index) {
            //     // Simulated feed data
            //     // You can replace this with your actual feed data
            //     return _buildFeedItem(
            //       context,
            //       // Sample data
            //       username: 'User $index',
            //       // profileImageUrl: 'assets/profile_images/user$index.jpg',
            //       // postImageUrl: 'assets/post_images/post$index.jpg', C:\Users\AKSHAT VERMA\StudioProjects\edpal\assets\ImageSets\android\drawable-hdpi\studentpng.png
            //       profileImageUrl:'assets/ImageSets/android/drawable-hdpi/studentpng.png',
            //       postImageUrl:'assets/appstore.png',
            //
            //     );
            //   },
            //   childCount: 15, // Number of feed items
            // ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  // Sample data for three different users
                  List<Map<String, dynamic>> usersData = [
                    {
                      'username': 'Vikas',
                      'profileImageUrl': 'assets/ImageSets/android/drawable-hdpi/studentpng.png',
                      'postImageUrl': 'assets/appstore.png',
                    },
                    {
                      'username': 'Gargi Versha',
                      'profileImageUrl': 'assets/garginew.jfif',
                      'postImageUrl': 'assets/gargi.jfif',
                    },
                    {
                      'username': 'Keshav',
                      'profileImageUrl': 'assets/appstore.png',
                      'postImageUrl': 'assets/ImageSets/android/drawable-hdpi/studentpng.png',
                    },
                  ];

                  // Accessing data for the current index
                  Map<String, dynamic> userData = usersData[index % usersData.length];

                  // Building the feed item
                  return Column(
                    children: [
                      _buildFeedItem(
                        context,
                        username: userData['username'],
                        profileImageUrl: userData['profileImageUrl'],
                        postImageUrl: userData['postImageUrl'],
                      ),
                      // Like and comment options
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.thumb_up),
                            onPressed: () {
                              // Add like functionality
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.comment),
                            onPressed: () {
                              // Add comment functionality
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                    },
                childCount: 15, // Number of feed items
              )

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
                  MaterialPageRoute(builder: (context) => const MyPalsPage()),
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
                  MaterialPageRoute(builder: (context) => const MyApplausePage()),
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

// class PostPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Post'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Widgets for post content and image upload can be added here
//             Text('Post Content'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement logic to post data to Firebase Firestore
//                 // This could involve uploading text and images
//               },
//               child: Text('Post'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:edpal/screens/post_page.dart';
// import 'package:flutter/material.dart';
// import 'about.dart';
// import 'mypals.dart';
// import 'myschool.dart';
// import 'mygroups.dart';
// import 'notes.dart';
// import 'myapplauses.dart';
// import 'profile.dart';
// import 'user_data.dart';
//
// // const IconData person_pin_circle_rounded = IconData(0xf006d, fontFamily: 'MaterialIcons');
// // class HomePage extends StatelessWidget {
// //   const HomePage({Key? key}) : super(key: key);
// class PostState {
//   bool isLiked;
//
//   PostState({this.isLiked = false});
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   // Define postStates list
//   late List<PostState> postStates;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize postStates list
//     postStates = List.generate(25, (index) => PostState());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 // Navigate to edpal.dart when the logo is clicked
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => AboutPage()),
//                 );
//               },
//               child: Image.asset(
//                 'assets/logo/android/drawable-hdpi/edpal.png',
//                 width: 40,
//                 height: 40,
//               ),
//             ),
//             SizedBox(width: 8),
//             Text(
//               'Edpal',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.post_add),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => PostPage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//                   (BuildContext context, int index) {
//                 // Sample data for three different users
//                 List<Map<String, dynamic>> usersData = [
//                   {
//                     'username': 'Vikas',
//                     'profileImageUrl': 'assets/ImageSets/android/drawable-hdpi/studentpng.png',
//                     'postImageUrl': 'assets/appstore.png',
//                   },
//                   {
//                     'username': 'Gargi Versha',
//                     'profileImageUrl': 'assets/garginew.jfif',
//                     'postImageUrl': 'assets/gargi.jfif',
//                   },
//                   {
//                     'username': 'Keshav',
//                     'profileImageUrl': 'assets/appstore.png',
//                     'postImageUrl': 'assets/ImageSets/android/drawable-hdpi/studentpng.png',
//                   },
//                 ];
//
//                 // Accessing data for the current index
//                 Map<String, dynamic> userData = usersData[index % usersData.length];
//
//                 // Building the feed item
//                 return Column(
//                   children: [
//                     _buildFeedItem(
//                       context,
//                       username: userData['username'],
//                       profileImageUrl: userData['profileImageUrl'],
//                       postImageUrl: userData['postImageUrl'],
//                     ),
//                     // Like and comment options
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         IconButton(
//                           icon: Icon(
//                             postStates[index].isLiked ? Icons.thumb_up : Icons.thumb_up_alt,
//                             color: postStates[index].isLiked ? Colors.blue : null,
//                           ),
//                           onPressed: () {
//                             // Toggle like state
//                             setState(() {
//                               postStates[index].isLiked = !postStates[index].isLiked;
//                             });
//                           },
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.comment),
//                           onPressed: () {
//                             // Add comment functionality
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 );
//               },
//               childCount: 25, // Number of feed items
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               icon: Icon(Icons.person_pin_circle_rounded),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyPalsPage()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.school),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MemberRegistration()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.people),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyGroupsPage()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.notes),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => NotesPage()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.favorite),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyApplausePage()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.person),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ProfilePage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildFeedItem(BuildContext context, {required String username, required String profileImageUrl, required String postImageUrl}) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               CircleAvatar(
//                 backgroundImage: AssetImage(profileImageUrl),
//                 radius: 20,
//               ),
//               SizedBox(width: 8),
//               Text(
//                 username,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 8),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8.0),
//             child: Image.asset(
//               postImageUrl,
//               fit: BoxFit.cover,
//               width: MediaQuery.of(context).size.width, // Adjust the width as needed
//               height: 200, // Adjust the height as needed
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class AboutPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Your AboutPage implementation
//     return Container();
//   }
// }
//
// class PostPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Your PostPage implementation
//     return Container();
//   }
// }
//
// class MyPalsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Your MyPalsPage implementation
//     return Container();
//   }
// }
//
// class MemberRegistration extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Your MemberRegistration implementation
//     return Container();
//   }
// }
//
// class MyGroupsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Your MyGroupsPage implementation
//     return Container();
//   }
// }
//
// class NotesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Your NotesPage implementation
//     return Container();
//   }
// }
//
// class MyApplausePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Your MyApplausePage implementation
//     return Container();
//   }
// }
//
// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Your ProfilePage implementation
//     return Container();
//   }
// }
