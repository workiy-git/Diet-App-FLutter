import 'package:flutter/material.dart';
import '../screens/UserProfileScreen.dart'; // Import the user profile screen file

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Ensures the screen doesn't resize to accommodate the keyboard
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF027C4F), Color(0xFF02C469)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0), // Adjust this value as needed
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserProfileScreen()), // Navigate to user profile screen
                      );
                    },
                    child: Image.asset(
                      'lib/images/login.png',
                      width: MediaQuery.of(context).size.width * 0.2, // Responsive width
                      height: MediaQuery.of(context).size.width * 0.2, // Responsive height
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01), // Responsive spacing
                  Image.asset(
                    'lib/images/nutri cal.png',
                    width: MediaQuery.of(context).size.width * 0.4, // Responsive width
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
