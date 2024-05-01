// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'MainScreen.dart'; // Import MainScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(202, 124, 175, 76),
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => MainScreen()), // Navigate to MainScreen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background color to green
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 100.0), // Adjust the top padding as needed
          child: Image.asset(
            'lib/images/file.png', // Replace 'splash_image.png' with your image asset path
            width: 500, // Adjust the width as needed
            height: 500, // Adjust the height as needed
          ),
        ),
      ),
    );
  }
}
