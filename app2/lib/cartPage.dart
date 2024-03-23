import 'package:flutter/material.dart';
import 'package:app2/main.dart';

class CartPage extends StatelessWidget {
  final List<SearchResult> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartItems[index].name),
            subtitle: Text('\$${cartItems[index].price.toStringAsFixed(2)}'),
            leading: Image.network(
              cartItems[index].imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            // Implement additional features or actions for each cart item as needed
          );
        },
      ),
    );
  }
}
