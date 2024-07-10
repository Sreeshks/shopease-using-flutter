#Welcome to shopease 
import 'package:flutter/material.dart';

import 'package:shopease/splash.dart';

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
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
      ),
      home: splashscreen(), // Display the splash screen initially
    );
  }
}

