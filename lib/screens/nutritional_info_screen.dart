// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:diet/screens/view_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class NutritionInfoScreen extends StatelessWidget {
  final List<Map<String, dynamic>> selectedProducts;
  final String name;
  final int age;
  final String gender;

  NutritionInfoScreen({
    required this.selectedProducts,
    required this.name,
    required this.age,
    required this.gender,
  });



  @override
  Widget build(BuildContext context) {
    // Define the product details
  // Define the product details
final Map<String, Map<String, double?>> productDetails = {
  'Cereals & Millets': {
    'energy': 85.0,
    'CHO': 17.0,
    'protein': 3.0,
    'fat': 1.0,
    'fiber': 2.0,
  },
  'Pulses': {
    'energy': 80.0,
    'CHO': 13.0,
    'protein': 6.0,
    'fat': 0.5,
    'fiber': 2.0,
  },

        'Whole Grams': {
        'energy': 75,
        'CHO': 12,
        'protein': 5,
        'fat': 0,
        'fiber': 5,
      },
        'Soyabean': {
        'energy': 75,
        'CHO': 2,
        'protein': 8,
        'fat': 4,
        'fiber': 5,
      },
        'Group A (Green Leafy Vegetables)': {
        'energy': 35,
        'CHO': 3,
        'protein': 4,
        'fat': 1,
        'fiber': 5,
      },
        'Group B (Roots & Tubers)': {
        'energy': 50,
        'CHO': 10,
        'protein': 1,
        'fat': 0,
        'fiber': 3,
      },
        'Group C (Other Vegetables)': {
        'energy': 30,
        'CHO': 4,
        'protein': 2,
        'fat': 0,
        'fiber': 4,
      },

        'Fruits': {
        'energy': 40,
        'CHO': 8,
        'protein': 1,
        'fat': 0,
        'fiber': 3,
      },
        'Nuts': {
        'energy': 85,
        'CHO': 2,
        'protein': 3,
        'fat': 7,
        'fiber': 1,
      },
        'Sugars': {
        'energy': 20,
        'CHO': 5,
        'protein': 0,
        'fat': 0,
        'fiber': 0,
      },
        'Milk,Whole,Cow': {
        'energy': 73,
        'CHO': 5,
        'protein': 3,
        'fat': 4,
        'fiber': 0,
      },
        'Skimmed Milk': {
        'energy': 29,
        'CHO': 4,
        'protein': 2.5,
        'fat': 0,
        'fiber': 0,
      },
        'Egg,poutry,whole,raw': {
        'energy': 67,
        'CHO': 0,
        'protein': 6.6,
        'fat': 4.6,
        'fiber': 0,
      },
        'Egg,Ploutry,Whole,Raw': {
        'energy': 67,
        'CHO': 0,
        'protein': 6.6,
        'fat': 4.6,
        'fiber': 0,
      },
        'Egg,Country Hen Whole,Raw': {
        'energy': 84,
        'CHO': 0,
        'protein': 6.6,
        'fat': 6.5,
        'fiber': 0,
      },
        'Animal Meat, Marine Fish&Shell Fish': {
        'energy': 75,
        'CHO': 0,
        'protein': 13,
        'fat': 2,
        'fiber': 0,
      },
        'Fat': {
        'energy': 90,
        'CHO': 0,
        'protein': 0,
        'fat': 10,
        'fiber': 0,
      },
        'Fresubin': {
        'Energy': 4.34,
        'CHO': 0.608,
        'Protein': 0.165,
        'Fat': 0.147,
        'Fibre': 0
    },
    'Fresubin DM': {
        'Energy': 4.46,
        'CHO': 0.498,
        'Protein': 0.202,
        'Fat': 0.2,
        'Fibre': 0.072
    },
    'Fresubin HP': {
        'Energy': 4.77,
        'CHO': 0.44,
        'Protein': 0.215,
        'Fat': 0.25,
        'Fibre': 0.05
    },
    'Fresubin HEPA': {
        'Energy': 3.74,
        'CHO': 0.715,
        'Protein': 0.12,
        'Fat': 0.06,
        'Fibre': 0.07
    },
    'Kabi pro': {
        'Energy': 3.65,
        'CHO': 0.45,
        'Protein': 0.42,
        'Fat': 0.03,
        'Fibre': 0.05
    },
    'Fresubin LP': {
        'Energy': 4.62,
        'CHO': 0.6,
        'Protein': 0.09,
        'Fat': 0.22,
        'Fibre': 0.06
    },
    'Fresubin Onco': {
        'Energy': 4.064,
        'CHO': 0.52,
        'Protein': 0.28,
        'Fat': 0.11,
        'Fibre': 0.06
    },
    'Kabimmune': {
        'Energy': 1.2,
        'CHO': 0.3,
        'Protein': 0,
        'Fat': 0,
        'Fibre': 0
    },
    'kabimmune Plus': {
        'Energy': 1.188,
        'CHO': 0.297,
        'Protein': 0,
        'Fat': 0,
        'Fibre': 0
    },
    'Kabi bite': {
        'Energy': 4.28,
        'CHO': 0.45,
        'Protein': 0.32,
        'Fat': 0.14,
        'Fibre': 0.031
    },
    'Kabi Mom': {
        'Energy': 3.62,
        'CHO': 0.5452,
        'Protein': 0.34,
        'Fat': 0.02,
        'Fibre': 0.05
    },
    'kabi sure kidz': {
        'Energy': 4.41,
        'CHO': 0.56,
        'Protein': 0.18,
        'Fat': 0.17,
        'Fibre': 0.01
    },
    'kabisure': {
        'Energy': 3.65,
        'CHO': 0.58,
        'Protein': 0.32,
        'Fat': 0.01,
        'Fibre': 0.02
    },
    'Similac Isomil': {
        'Energy': 4.96,
        'CHO': 0.5,
        'Protein': 0.132,
        'Fat': 0.27,
        'Fibre': 0
    },
    'pedia sure advance plus': {
        'Energy': 4.68,
        'CHO': 0.4946,
        'Protein': 0.141,
        'Fat': 0.234,
        'Fibre': 0
    },
    'pediasure dual protein': {
        'Energy': 4.68,
        'CHO': 0.4946,
        'Protein': 0.141,
        'Fat': 0.234,
        'Fibre': 0
    },
    'Horlicks diabetes plus': {
        'Energy': 3.56,
        'CHO': 0.355,
        'Protein': 0.2,
        'Fat': 0.05,
        'Fibre': 0.22
    },
    'ensure diabetes': {
        'Energy': 4.35,
        'CHO': 0.5978,
        'Protein': 0.201,
        'Fat': 0.146,
        'Fibre': 0.0518
    },
    'Resource diabetes': {
        'Energy': 4.59,
        'CHO': 0.51,
        'Protein': 0.22,
        'Fat': 0.19,
        'Fibre': 0.05
    },
    'Hinex DM': {
        'Energy': 4.56,
        'CHO': 0.506,
        'Protein': 0.228,
        'Fat': 0.202,
        'Fibre': 0.06
    },
    'Prohence D': {
        'Energy': 4.54,
        'CHO': 0.461,
        'Protein': 0.202,
        'Fat': 0.192,
        'Fibre': 0.08
    },
    'Horlicks protein plus': {
        'Energy': 3.74,
        'CHO': 0.52,
        'Protein': 0.34,
        'Fat': 0.04,
        'Fibre': 0
    },
    'Ensure plus': {
        'Energy': 4.2836,
        'CHO': 0.1896,
        'Protein': 0.588,
        'Fat': 0.1192,
        'Fibre': 0
    },
    'Resource HP': {
        'Energy': 3.72,
        'CHO': 0.417,
        'Protein': 0.452,
        'Fat': 0.028,
        'Fibre': 0
    },
    'Hinux': {
        'Energy': 3.56,
        'CHO': 0.456,
        'Protein': 0.452,
        'Fat': 0.0052,
        'Fibre': 0
    },
    'Prohence': {
        'Energy': 3.704,
        'CHO': 0.288,
        'Protein': 0.45,
        'Fat': 0.07,
        'Fibre': 0
    },
    'Ensure plus RTH': {
        'Energy': 1.2,
        'CHO': 0.101,
        'Protein': 0.06,
        'Fat': 0.06,
        'Fibre': 0.007
    },
    'Ensure diabetic care': {
        'Energy': 2.35,
        'CHO': 0.598,
        'Protein': 0.201,
        'Fat': 0.146,
        'Fibre': 0.052
    },
    'Nepro HP': {
        'Energy': 5.01,
        'CHO': 0.435,
        'Protein': 0.216,
        'Fat': 0.256,
        'Fibre': 0.027
    },
    'Nephro LP': {
        'Energy': 5.04,
        'CHO': 0.523,
        'Protein': 0.122,
        'Fat': 0.261,
        'Fibre': 0.027
    },
    'Prosure': {
        'Energy': 4.04,
        'CHO': 0.612,
        'Protein': 0.202,
        'Fat': 0.078,
        'Fibre': 0.024
    },
    'Resource dialysis': {
        'Energy': 4.34,
        'CHO': 0.473,
        'Protein': 0.27,
        'Fat': 0.163,
        'Fibre': 0.05
    },
    'Resource renal': {
        'Energy': 4.47,
        'CHO': 0.66,
        'Protein': 0.12,
        'Fat': 0.05,
        'Fibre': 0.159
    },
    'Resource high protein': {
        'Energy': 3.48,
        'CHO': 0.42,
        'Protein': 0.426,
        'Fat': 0.02,
        'Fibre': 0.05
    },
    'Resources diabetes': {
        'Energy': 4.27,
        'CHO': 0.5002,
        'Protein': 0.24,
        'Fat': 0.06,
        'Fibre': 0.159
    },
    'Pepatem junior': {
        'Energy': 1.63,
        'CHO': 0.658,
        'Protein': 0.129,
        'Fat': 0.165,
        'Fibre': 0
    },
    'Resource Fibre': {
        'Energy': 2.31,
        'CHO': 0.0892,
        'Protein': 0.003,
        'Fat': 0,
        'Fibre': 0.631
    },
    'Resource thickener': {
        'Energy': 3.06,
        'CHO': 0.62,
        'Protein': 0.01,
        'Fat': 0.27,
        'Fibre': 0
    },
    'Nestle optifast': {
        'Energy': 4,
        'CHO': 0.413,
        'Protein': 0.38,
        'Fat': 0.11,
        'Fibre': 0.06
    },
    'Nestle Resource hepatic': {
        'Energy': 4.26,
        'CHO': 0.551,
        'Protein': 0.24,
        'Fat': 0.12,
        'Fibre': 0
    },
    'Nestle resource opti': {
        'Energy': 4.29,
        'CHO': 0.56,
        'Protein': 0.2,
        'Fat': 0.15,
        'Fibre': 0.06
    },

 // Add other product details here
    };
// Initialize total nutritional values
int totalCalories = 0;
int totalCarbohydrates = 0;
int totalProtein = 0;
int totalFat = 0;
int totalFiber = 0;

// Calculate total nutritional values
for (final selectedProduct in selectedProducts) {
  final productName = selectedProduct['name'] as String?;
  final quantity = selectedProduct['quantity'] as int?;

  // Check if productName and quantity are not null
  if (productName != null && quantity != null) {
    // Fetch product details and calculate totals
    final details = productDetails[productName];
    if (details != null) {
      totalCalories += (details['energy'] ?? 0).toInt() * quantity;
      totalCarbohydrates += (details['CHO'] ?? 0).toInt() * quantity;
      totalProtein += (details['protein'] ?? 0).toInt() * quantity;
      totalFat += (details['fat'] ?? 0).toInt() * quantity;
      totalFiber += (details['fiber'] ?? 0).toInt() * quantity;
    }
  }
}


    // Calculate other derived values
    final double totalCarbsPercentage = ((totalCarbohydrates * 4) / totalCalories) * 100;
    final double totalProteinPercentage = ((totalProtein * 4) / totalCalories) * 100;
    final double totalFatPercentage = ((totalFat * 9) / totalCalories) * 100;
    final double totalNPC = totalCarbohydrates * 4 + totalFat * 9;
    final double totalN2 = totalProtein / 6.25;
    final double totalNPCN2Ratio = totalNPC / totalN2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(185, 11, 171, 83).withOpacity(0.7),
        title: Text('Nutrition Information'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "lib/images/bg4.png", // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 220, 235, 233).withOpacity(0.5),
                          blurRadius: 3,
                          spreadRadius: 1,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: DataTable(
                              columnSpacing: 16.0,
                              dataRowHeight: 58.0,
                              headingRowHeight: 60.0,
                              columns: [
                                DataColumn(label: Text('Nutrient', style: TextStyle(color: Colors.white, fontSize: 18.0))),
                                DataColumn(label: Text('Value', style: TextStyle(color: Colors.white, fontSize: 18.0))),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text('Total Calories', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                  DataCell(Text('$totalCalories', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Total Carbohydrates', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                  DataCell(Text('$totalCarbohydrates', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Total Protein', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                  DataCell(Text('$totalProtein', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Total Fat', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                  DataCell(Text('$totalFat', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Total Fiber', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                  DataCell(Text('$totalFiber', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Total Carbs Percentage', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                  DataCell(Text('${totalCarbsPercentage.toStringAsFixed(2)}%', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Total Protein Percentage', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                  DataCell(Text('${totalProteinPercentage.toStringAsFixed(2)}%', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Total Fat Percentage', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                  DataCell(Text('${totalFatPercentage.toStringAsFixed(2)}%', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Total NPC', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                  DataCell(Text('${totalNPC.toInt()}', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Total N2', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                  DataCell(Text('${totalN2.toStringAsFixed(2)}', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Total NPCN2 Ratio', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                  DataCell(Text('${totalNPCN2Ratio.toStringAsFixed(2)}', style: TextStyle(color: Colors.white, fontSize: 16.0))),
                                ]),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Navigate back to the select product screen
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 2, 187, 255),
                                textStyle: TextStyle(fontSize: 16.0),
                              ),
                              child: Text('Edit'),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                // Save functionality
                                await _saveData(context, totalCalories, totalCarbohydrates, totalProtein, totalFat, totalFiber, totalCarbsPercentage, totalProteinPercentage, totalFatPercentage, totalNPC, totalN2, totalNPCN2Ratio);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFB0E57C),
                                textStyle: TextStyle(fontSize: 16.0),
                              ),
                              child: Text('Save'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // View functionality
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ViewDataScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 0, 191, 255),
                                textStyle: TextStyle(fontSize: 16.0),
                              ),
                              child: Text('View'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
Future<void> _saveData(BuildContext context, int totalCalories, int totalCarbohydrates, int totalProtein, int totalFat, int totalFiber, double totalCarbsPercentage, double totalProteinPercentage, double totalFatPercentage, double totalNPC, double totalN2, double totalNPCN2Ratio) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  
  // Fetch existing saved data
  List<String> savedData = prefs.getStringList('savedData') ?? [];
  // Add the new data to the list
  Map<String, dynamic> newData = {
    'name': name,
    'age': age,
    'gender': gender,
    'totalCalories': totalCalories,
    'totalCarbohydrates': totalCarbohydrates,
    'totalProtein': totalProtein,
    'totalFat': totalFat,
    'totalFiber': totalFiber,
    'totalCarbsPercentage': totalCarbsPercentage,
    'totalProteinPercentage': totalProteinPercentage,
    'totalFatPercentage': totalFatPercentage,
    'totalNPC': totalNPC,
    'totalN2': totalN2,
    'totalNPCN2Ratio': totalNPCN2Ratio,
  };

  // Print out the JSON string
  String jsonString = jsonEncode(newData);
  print("JSON String: $jsonString");

  savedData.add(jsonString);

  // Save the updated list back to SharedPreferences
  await prefs.setStringList('savedData', savedData);

  // Show a Snackbar to indicate successful data saving
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Data saved successfully'),
    ),
  );
}
}