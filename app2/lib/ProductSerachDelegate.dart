import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app2/serachresultpage.dart';
import 'package:flutter/widgets.dart';

class ProductSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement search results view
    return _buildBackground(
      context,
      SearchResultsList(query: query),
    );
  }

 @override
Widget buildSuggestions(BuildContext context) {
  // Implement search suggestions view
  return _buildBackground(
    context,
    Center(
      child: Text(
        'Search Suggestions for: $query',
        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      ),
    ),
  );
}

  Widget _buildBackground(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://images.pexels.com/photos/6348041/pexels-photo-6348041.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
