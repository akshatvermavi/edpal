
import 'package:flutter/material.dart';

class MyGroupsPage extends StatelessWidget {
  const MyGroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Groups'),
      ),
      body: Column(
        children: [
          // Search bar
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // List of groups
          Expanded(
            child: _buildGroupList(context),
          ),
        ],
      ),
    );
  }

  Widget _buildGroupList(BuildContext context) {
    // Replace this with your actual list of groups
    List<String> groups = ['Group 1', 'Group 2', 'Group 3'];

    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(groups[index]),
          onTap: () {
            // Handle tapping on a group item
            // You can navigate to a page displaying discussions for the selected group
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GroupDiscussionsPage(groupName: groups[index])),
            );
          },
        );
      },
    );
  }
}

class GroupDiscussionsPage extends StatelessWidget {
  final String groupName;

  const GroupDiscussionsPage({super.key, required this.groupName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groupName),
      ),
      body: Column(
        children: [
          // Placeholder for ongoing discussions (you can replace it with your actual data)
          Expanded(
            child: Center(
              child: Text('Ongoing discussions in $groupName'),
            ),
          ),
          // Placeholder for ads (you can replace it with your actual ads)
          Container(
            height: 50, // Adjust the height as needed
            color: Colors.grey[300],
            child: const Center(
              child: Text('Ads'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add applause functionality here
          // For example, you can show a dialog or perform any other action
          _showApplauseDialog(context);
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }

  void _showApplauseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Applause'),
          content: const Text('Give applause to this discussion?'),
          actions: [
            TextButton(
              onPressed: () {
                // Perform action when applause is given
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}

