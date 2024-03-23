import 'package:flutter/material.dart';
import 'package:app2/Shoeimage.dart';
import 'package:app2/cartPage.dart';
import 'package:app2/Userprofile.dart';
import 'package:app2/ProductSerachDelegate.dart';
import 'package:app2/serachresultpage.dart';

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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
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
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    'https://th.bing.com/th/id/OIP.RCRS68NxoU-fPSRPhi2SKAHaDf?w=1920&h=904&rs=1&pid=ImgDetMain',
                    fit: BoxFit.cover,
                  ),
                ),
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
                                  backgroundColor: const Color.fromARGB(255, 234, 234, 234),
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
                backgroundColor: Colors.transparent, // Set app bar background color to transparent
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
              SliverToBoxAdapter(
                child: Container(
                  color: Color.fromARGB(255, 255, 25, 0),
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
                              'https://cdn.zouton.com/images/originals/stores/Converseimage03_1604117037.png',
                          name: 'CONVERSE ',
                          price: 1800.0,
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
                              'https://cdn.zouton.com/images/originals/blog/BANNER31_1604740200.png',
                          name: 'ADIDAS ',
                          price: 3400.0,
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
                              'https://th.bing.com/th/id/OIP.BSU0t0J4vjOn2odb1GsNFQHaFj?rs=1&pid=ImgDetMain',
                          name: 'Nike Air Force',
                          price: 1190.0,
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
                          price: 2000.0,
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
              ),
            ],
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


         
