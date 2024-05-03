// Inside the build method of SearchResultsList widget
import 'package:flutter/material.dart';
import 'package:shopease/serachresultpage.dart';
// New screen or dialog to display product details
class ProductDetailsPage extends StatelessWidget {
  final SearchResult product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Location: ${product.location}',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Size: ${product.size}',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Stock: ${product.stock}',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Shop Name: ${product.shopName}',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add to cart functionality
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
