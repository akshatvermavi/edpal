
import 'package:flutter/material.dart';
import 'package:edpal/screens/comment.dart'; // Import your Comment model
import 'package:edpal/screens/myapplausesdatabase.dart'; // Import your DatabaseManager

class MyApplauses extends StatefulWidget {
  @override
  _MyApplausesState createState() => _MyApplausesState();
}

class _MyApplausesState extends State<MyApplauses> {
  final DatabaseManager _db = DatabaseManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Applauses'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: FutureBuilder<List<Comment>>(
        future: _getComments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final comments = snapshot.data ?? [];
            if (comments.isEmpty) {
              return Center(child: Text('No comments found.'));
            } else {
              return ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.comment),
                        title: Text(
                          '${comment.senderId} added a comment on your post',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '"${comment.content}"',
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }

  Future<List<Comment>> _getComments() async {
    try {
      final comments = await _db.getComments();
      return comments;
    } catch (e) {
      print("Error fetching comments: $e");
      return []; // Return empty list in case of error
    }
  }
}
