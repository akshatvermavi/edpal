// import 'package:flutter/material.dart';
//
// class MyApplausesPage extends StatelessWidget {
//   const MyApplausesPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Applauses'),
//       ),
//       body: const Center(
//         child: Text('This is the My Applauses Page!'),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
//
// class MyApplausePage extends StatefulWidget {
//   @override
//   _MyApplausePageState createState() => _MyApplausePageState();
// }
//
// class _MyApplausePageState extends State<MyApplausePage> {
//   List<Applause> myApplauses = []; // Assuming Applause is a custom class
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Applause'),
//       ),
//       body: ListView.builder(
//         itemCount: myApplauses.length,
//         itemBuilder: (context, index) {
//           return ApplauseCard(applause: myApplauses[index]);
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Code to navigate to the page where the user can request applause
//           // You might use Navigator.push for this
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class ApplauseCard extends StatelessWidget {
//   final Applause applause;
//
//   ApplauseCard({required this.applause});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           ListTile(
//             title: Text(applause.senderName), // Assuming senderName is a property of Applause
//             subtitle: Text(applause.message), // Assuming message is a property of Applause
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.thumb_up),
//                 onPressed: () {
//                   // Code to handle the like button click
//                   // You might update the like count in the database and update the UI accordingly
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Applause {
//   String senderName;
//   String message;
//
//   Applause({required this.senderName, required this.message});
// }


import 'package:flutter/material.dart';

class MyApplausePage extends StatefulWidget {
  const MyApplausePage({super.key});

  @override
  _MyApplausePageState createState() => _MyApplausePageState();
}

class _MyApplausePageState extends State<MyApplausePage> {
  List<Applause> myApplauses = [
    Applause(senderName: 'Teacher1', message: 'Great work!'),
    Applause(senderName: 'Student1', message: 'Well done!'),
    // Add more sample data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Applause'),
      ),
      body: ListView.builder(
        itemCount: myApplauses.length,
        itemBuilder: (context, index) {
          return ApplauseCard(applause: myApplauses[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Code to navigate to the page where the user can request applause
          // You might use Navigator.push for this
          // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => RequestApplausePage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ApplauseCard extends StatelessWidget {
  final Applause applause;

  const ApplauseCard({super.key, required this.applause});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            title: Text(applause.senderName),
            subtitle: Text(applause.message),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () {
                  // Code to handle the like button click
                  // You might update the like count in the database and update the UI accordingly
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Applause {
  String senderName;
  String message;

  Applause({required this.senderName, required this.message});
}
