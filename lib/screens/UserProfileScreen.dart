import 'package:flutter/material.dart';
import 'select_product_screen.dart';

void main() {
  runApp(MaterialApp(
    home: UserProfileScreen(),
  ));
}

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String? _name;
  int? _age;
  String? _gender;
  String? _nameErrorMessage;
  String? _ageErrorMessage;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/bg.webp'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            child: Container(), // This empty container is necessary for the image to cover the whole screen
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.25), // Adjust top spacing
                  Container(
                    height: screenHeight * 0.5, // Adjust the value as needed
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.7), // Semi-transparent background
                      borderRadius: BorderRadius.circular(10.0), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 220, 235, 233).withOpacity(0.5), // Shadow color
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Nutritional Profile', // Your custom text here
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: screenWidth * 0.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                ],
                              ),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  _name = value;
                                  _nameErrorMessage = value.contains(RegExp(r'\d')) ? 'Numbers are not allowed' : null;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter your name',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
                                prefixIcon: Icon(Icons.person), // Icon added here
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Visibility(
                            visible: _nameErrorMessage != null,
                            child: Text(
                              _nameErrorMessage ?? '',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: _nameErrorMessage != null ? 20 : 0),
                          Container(
                            width: screenWidth * 0.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                ],
                              ),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  _age = int.tryParse(value);
                                  _ageErrorMessage = value.contains(RegExp(r'[a-zA-Z]')) ? 'Letters are not allowed' : null;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter your age',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
                                prefixIcon: Icon(Icons.calendar_today),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(height: 20),
                          Visibility(
                            visible: _ageErrorMessage != null,
                            child: Text(
                              _ageErrorMessage ?? '',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: _ageErrorMessage != null ? 20 : 0),
                          Container(
                            width: screenWidth * 0.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                ],
                              ),
                            ),
                            child: DropdownButtonFormField<String>(
                              value: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Select your gender',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
                                prefixIcon: Icon(Icons.people), // Icon added here
                              ),
                              items: <String>['Male', 'Female', 'Other']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              if (_name == null ||
                                  _name!.isEmpty ||
                                  _age == null ||
                                  _gender == null ||
                                  _gender!.isEmpty) {
                                // Show pop-up message
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Incomplete Form'),
                                      content: Text('Please fill out all fields before proceeding.'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else if (_age! < 18 || _age! > 120) {
                                // Show pop-up message for invalid age
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Invalid Age'),
                                      content: Text('Age must be between 18 and 120.'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                // Handle submit button press
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SelectProductScreen(
                                      name: _name!,
                                      age: _age!,
                                      gender: _gender!,
                                    ),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0), // Rounded corners
                              ),
                            ),
                            child: Text('Submit'),
                          ),
                        ],
                      ),
                    ),
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
