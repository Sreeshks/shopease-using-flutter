
import 'package:flutter/material.dart';
import 'package:app2/productdetailspage.dart';
import 'package:app2/cartPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopease',
      theme: ThemeData(
        primaryColor: Colors.yellow,
        scaffoldBackgroundColor: const Color.fromARGB(
            255, 255, 255, 255), // Set background color to black
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  int likesCount = 0;
  List<String> comments = [];
  // Define a list to hold the items added to the cart
  List<SearchResult> cartItems = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow,
            title: Row(
              children: [
                // Shopping cart icon with item count
                Stack(
                  children: [
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        // Open cart page or show cart items
                        _openCartPage(context);
                      },
                    ),
                    // Display count of items in the cart
                    cartItems.isNotEmpty
                        ? Positioned(
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 10,
                              child: Text(
                                '${cartItems.length}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
                SizedBox(width: 8.0),
                FadeTransition(
                  opacity: _animation,
                  child: Text('Shopease'),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: ProductSearchDelegate(),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  // Navigate to profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserProfilePage()),
                  );
                },
              ),
            ],
          ),
          body: Container(
            // Use Container to set background color
            color: Colors.black,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'New Arrivals',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ShoeImage(
                    imageUrl:
                        'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    name: 'Nike Air Force',
                    price: 90.0,
                    onLikePressed: () {
                      setState(() {
                        likesCount++;
                      });
                    },
                    onCommentPressed: () {
                      _showCommentDialog(context);
                    },
                    comments: comments,
                  ),
                  SizedBox(height: 8.0),
                  ShoeImage(
                    imageUrl:
                        'https://th.bing.com/th/id/OIP.gGNGx_B8rwwfboUhq1O_ZwHaC-?rs=1&pid=ImgDetMain',
                    name: 'REEBOK ',
                    price: 90.0,
                    onLikePressed: () {
                      setState(() {
                        likesCount++;
                      });
                    },
                    onCommentPressed: () {
                      _showCommentDialog(context);
                    },
                    comments: comments,
                  ),
                  // Add more shoe images as needed
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Function to open cart page or show cart items
  void _openCartPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartPage(cartItems: cartItems)),
    );
  }

  // Function to show comment dialog
  void _showCommentDialog(BuildContext context) {
    TextEditingController commentController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
  
        return AlertDialog(
          title: Text("Add a Comment"),
          content: TextField(
            controller: commentController,
            decoration: InputDecoration(hintText: "Enter your comment"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                String comment = commentController.text;
                if (comment.isNotEmpty) {
                  setState(() {
                    comments.add(comment);
                  });
                  commentController.clear();
                  Navigator.of(context).pop(); // Close the dialog
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter a comment.'),
                    ),
                  );
                }
              },
              child: Text("Post"),
            ),
          ],
        );
              
      },
    );

  }
}

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Contact Information:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Email: sreeshksureshh@gmail.com',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Phone: 8129690147',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement login functionality
                  },
                  child: Text('Login'),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Implement signup functionality
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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

