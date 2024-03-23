import 'package:app2/login.dart';
import 'package:flutter/material.dart';
import 'package:app2/signup.dart';

class UserProfilePage extends StatelessWidget {
  final String? username; // Pass the username if logged in

  UserProfilePage({this.username});

  @override
  Widget build(BuildContext context) {
    if (username != null) {
      // User is logged in, display user profile
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
                'Welcome, $username!', // Display username
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            // Display user information or options to edit profile, etc.
          ],
        ),
      );
    } else {
      // User is not logged in, display login/signup options
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
                'Login or Sign Up',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to login page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to sign up page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
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
}
