import 'package:flutter/material.dart';
import 'package:edpal/screens/user_data.dart';
//import 'package:edpal/screens/user_data.dart'; // Import the UserData model

class DataSearch extends SearchDelegate<String> {
  final List<UserData> filteredUsers;

  DataSearch(this.filteredUsers);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        //close(context, null);
        query = query ?? '';
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<UserData> searchResults = filteredUsers.where((user) {
      return user.school.toLowerCase().contains(query.toLowerCase()) ||
          // Add additional search criteria based on user preferences
          // For example, filtering by schools near 5km
          // You can use Geolocator to calculate distances
          // Example: Geolocator.distanceBetween(user.latitude, user.longitude, schoolLatitude, schoolLongitude) <= 5000
          false; // Placeholder for additional search conditions
    }).toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index].name),
          subtitle: Text(searchResults[index].school),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // You can provide search suggestions here based on the query
    // This can be implemented based on recent searches, popular schools, etc.
    return Container(); // Placeholder for suggestions
  }
}