import 'package:flutter/material.dart';
import 'package:app2/serachresultpage.dart';

class ProductSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
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
    return SearchResultsList(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement search suggestions view
    return Center(
      child: Text('Search Suggestions for: $query'),
    );
  }
}
