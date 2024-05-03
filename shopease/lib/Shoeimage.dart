
import 'package:flutter/material.dart';
class ShoeImage extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;
  final Function()? onLikePressed;
  final Function()? onCommentPressed;
  final List<String> comments;

  ShoeImage({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.onLikePressed,
    this.onCommentPressed,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 150.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Text(
            name,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            '\$$price',
            style: TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: onLikePressed,
              ),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: onCommentPressed,
              ),
            ],
          ),
          SizedBox(height: 8.0),
          if (comments.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Comments:',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: comments.map((comment) => Text(comment)).toList(),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
