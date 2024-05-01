// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:diet/screens/nutritional_info_screen.dart';
import 'package:flutter/material.dart';

class SelectProductScreen extends StatefulWidget {
  final String name;
  final int age;
  final String gender;

  SelectProductScreen({required this.name, required this.age, required this.gender});

  @override
  _SelectProductScreenState createState() => _SelectProductScreenState();
}

class _SelectProductScreenState extends State<SelectProductScreen> {
  String? _selectedCategory;
  List<String> _foodProducts = [
    'Cereals & Millets',
    'Pulses',
    'Whole Grams',
    'Soyabean',
    'Fruits',
    'Nuts',
    'Sugars',
    'Milk,Whole,Cow',
    'Skimmed Milk',
    'Egg,Ploutry,Whole,Raw',
    'Egg,Country Hen Whole,Raw',
    'Animal Meat, Marine Fish&Shell Fish',
    'Fat'
  ];
  List<String> _supplementProducts = [
    'Fresubin',
    'Fresubin DM',
    'Fresubin HP',
    'Fresubin HEPA',
    'Kabi pro',
    'Fresubin LP',
    'Fresubin Onco',
    'Kabimmune',
    'kabimmune Plus',
    'Kabi bite',
    'Kabi Mom',
    'kabi sure kidz',
    'kabisure',
    'Similac Isomil',
    'Pedia sure advance plus',
    'Pediasure dual protein',
    'Horlicks diabetes plus',
    'Ensure diabetes',
    'Resource diabetes',
    'Hinex DM',
    'Prohence D',
    'Horlicks protein plus',
    'Ensure plus',
    'Resource HP',
    'Hinux',
    'Prohence',
    'Ensure plus',
    'Ensure peptide',
    'Ensure plus RTH',
    'Ensure diabetic care',
    'Nepro HP',
    'Nephro LP',
    'Prosure',
    'Resource dialysis',
    'Resource renal',
    'Resource high protein',
    'Resources diabetes',
    'Pepatem junior',
    'Resource Fibre',
    'Resource thickener',
    'Nestle optifast',
    'Nestle Resource hepatic',
    'Nestle resource opti'
  ];
  String? _selectedProduct;
  double? _productWeight;
  List<String> _selectedProducts = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _countController = TextEditingController();

  @override
  void dispose() {
    _countController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(185, 11, 171, 83).withOpacity(0.7),
        title: Text('Select Product'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/images/bg3.png"), // Replace "lib/images/tf.jpg" with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                   color: Color.fromARGB(255, 85, 118, 51).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 220, 235, 233).withOpacity(0.3),
                      spreadRadius: screenWidth * 0.015,
                      blurRadius: screenWidth * 0.15,
                      offset: Offset(0, screenWidth * 0.05),
                    ),
                  ],
                ),
                child:Row(
  children: [
    Expanded(
      flex: 6,
      child: Text(
        '${widget.name}',
        style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.white),
      ),
    ),
    Expanded(
      flex: 2, // Change the flex value to 2 for the age field
      child: Text(
        '${widget.age}',
        style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.white),
      ),
    ),
    Expanded(
      flex: 3,
      child: Text(
        '${widget.gender}',
        style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.white),
      ),
    ),
  ],
),

              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 220, 235, 233).withOpacity(0.3),
                      spreadRadius: screenWidth * 0.015,
                      blurRadius: screenWidth * 0.15,
                      offset: Offset(0, screenWidth * 0.05),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DropdownButtonFormField<String>(
                      value: _selectedCategory,
                      hint: Text('Select Category', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                      style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white),
                      dropdownColor: Color.fromARGB(255, 85, 118, 51),
                      items: ['Food', 'Supplements'].map((String category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(
                            category,
                            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedCategory = value;
                          _selectedProduct = null;
                        });
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    if (_selectedCategory != null) // Only show if category is selected
                      SingleChildScrollView(
                        child: DropdownButtonFormField<String>(
                          value: _selectedProduct,
                          hint: Text('Select Product', style: TextStyle(color: Colors.white)),
                          style: TextStyle(fontSize: screenWidth * 0.04, color: Color.fromARGB(255, 255, 255, 255)),
                          dropdownColor: Color.fromARGB(255, 85, 118, 51),
                          items: _selectedCategory == 'Food'
                              ? _foodProducts.map((String product) {
                                  return DropdownMenuItem<String>(
                                    value: product,
                                    child: Text(
                                      product,
                                      style: TextStyle(color: const Color.fromARGB(255, 255, 252, 252)),
                                    ),
                                  );
                                }).toList()
                              : _supplementProducts.map((String product) {
                                  return DropdownMenuItem<String>(
                                    value: product,
                                    child: Text(
                                      product,
                                      style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                                    ),
                                  );
                                }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              _selectedProduct = value;
                            });
                          },
                        ),
                      ),
                    SizedBox(height: screenHeight * 0.02),
                    TextFormField(
                      controller: _countController, // Assign the controller here
                      decoration: InputDecoration(
                        labelText: 'Enter Quantity',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.02),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) {
                        setState(() {
                          _productWeight = double.tryParse(value);
                        });
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    if (_selectedProduct != null && _productWeight != null)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedProducts.add('$_selectedProduct - $_productWeight ');
                            _selectedProduct = null;
                            _productWeight = null;
                            _countController.clear(); // Clear the text field
                            FocusScope.of(context).unfocus(); // Dismiss the keyboard
                          });
                        },
                        child: Text('Add $_selectedProduct'),
                      ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(99, 220, 235, 233).withOpacity(0.3),
                        spreadRadius: screenWidth * 0.015,
                        blurRadius: screenWidth * 0.025,
                        offset: Offset(0, screenWidth * 0.03),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: _selectedProducts.length,
                    itemBuilder: (context, index) {
                      final product = _selectedProducts[index];
                      List<String> parts = product.split(' - ');
                      String productName = parts[0];
                      String productWeight = parts[1];
                      return Card(
                        color: Colors.black.withOpacity(0.7),
                        child: ListTile(
                          title: Text(
                            productName,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Quantity: ${double.parse(productWeight).truncate() == double.parse(productWeight) ? double.parse(productWeight).toInt() : productWeight}',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.remove, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                _selectedProducts.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
  width: double.maxFinite, // Set the width to occupy the entire available space
  child: ElevatedButton(
    onPressed: () {
      if (_selectedProducts.isEmpty) {
        // If no product is selected, show a pop-up message
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("No Product Selected"),
              content: Text("Please select at least one product before submitting."),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      } else {
        List<Map<String, dynamic>> formattedProducts = _selectedProducts.map((product) {
          List<String> parts = product.split(' - ');
          String productName = parts[0];
          double productQuantity = double.tryParse(parts[1].replaceAll(' g', '')) ?? 0.0;
          return {
            'name': productName,
            'quantity': productQuantity.toInt(), // Convert double to int
          };
        }).toList();

      Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => NutritionInfoScreen(
      selectedProducts: formattedProducts,
      name: widget.name,
      age: widget.age,
      gender: widget.gender,
    ),
  ),
);

      }
    },
    child: Text('Submit'),
  ),
),

            ],
          ),
        ),
      ),
    );
  }
}
