import 'package:flutter/material.dart';

import 'package:shopease/productdetailspage.dart';
import 'package:shopease/Shoeimage.dart';

class SearchResultsList extends StatelessWidget {
  final String query;

  SearchResultsList({required this.query});

  @override
  Widget build(BuildContext context) {
    // Placeholder data for search results
    List<SearchResult> searchResults = [
      SearchResult(
        name: 'Nike Air Force',
        location: 'Thrissur',
        size: 100,
        stock: 40,
        shopName: 'Sports Emporium',
        price: 90.0,
        imageUrl:
            'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      SearchResult(
        name: 'Nike Air Max',
        location: 'vakkunathann',
        size: 9,
        stock: 30,
        shopName: 'Sneaker Outlet',
        price: 110.0,
        imageUrl:
            'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
    ];
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://1.bp.blogspot.com/-3JUBo6Gwta4/XR5G-0ochnI/AAAAAAAAAMs/NnZWq5HVk6YRrengexZv3zt2w3ncQ9dGQCLcBGAs/s1600/GPS.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
    // Filter search results based on query
    List<SearchResult> filteredResults = searchResults
        .where(
            (result) => result.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredResults.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigate to product details screen or dialog
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetailsPage(product: filteredResults[index]),
              ),
            );
          },
          child: ShoeImage(
            imageUrl: filteredResults[index].imageUrl,
            name: filteredResults[index].name,
            price: filteredResults[index].price,
            comments: [],
          ),
        );
      },
    );
  }
}

class SearchResult {
  final String name;
  final String location;
  final int size;
  final int stock;
  final String shopName;
  final double price;
  final String imageUrl;

  SearchResult({
    required this.name,
    required this.location,
    required this.size,
    required this.stock,
    required this.shopName,
    required this.price,
    required this.imageUrl,
  });
}
