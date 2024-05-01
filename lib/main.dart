import 'package:flutter/material.dart';
import 'package:diet/screens/splash_screen.dart'; // Assuming 'diet' is your project name and 'screens' is the directory where splash_screen.dart is located

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Splash Screen Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(), // Use your splash screen here
    );
  }
}
