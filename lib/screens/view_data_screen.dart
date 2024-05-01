import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // Add this import statement

class ViewDataScreen extends StatefulWidget {
  @override
  _ViewDataScreenState createState() => _ViewDataScreenState();
}

class _ViewDataScreenState extends State<ViewDataScreen> {
  late List<String> _savedData;
  late TextEditingController _searchController;
  List<String> _filteredData = [];

  @override
  void initState() {
    super.initState();
    _loadSavedData();
    _searchController = TextEditingController();
  }

  Future<void> _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedData = prefs.getStringList('savedData') ?? [];
      _filteredData = _savedData;
    });
  }

  Future<void> _deleteData(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedData.removeAt(index);
      prefs.setStringList('savedData', _savedData);
      _filteredData = _savedData;
    });
  }

  void _filterData(String query) {
    setState(() {
      _filteredData = _savedData.where((data) {
        final Map<String, dynamic> parsedData = _parseJson(data);
        if (parsedData.isEmpty) return false;

        // Handle nullable boolean values properly
        final bool nameMatch = parsedData['name']?.toString().toLowerCase().contains(query.toLowerCase()) ?? false;
        final bool ageMatch = parsedData['age']?.toString().toLowerCase().contains(query.toLowerCase()) ?? false;
        final bool genderMatch = parsedData['gender']?.toString().toLowerCase().contains(query.toLowerCase()) ?? false;
        
        return nameMatch || ageMatch || genderMatch;
      }).toList();
    });
  }

  Map<String, dynamic> _parseJson(String jsonString) {
    print('Parsing JSON: $jsonString');
    try {
      return Map<String, dynamic>.from(jsonDecode(jsonString));
    } catch (e) {
      print('Error parsing JSON: $e');
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(185, 11, 171, 83).withOpacity(0.7),
        title: Text('Data List'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/images/bg5.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                onChanged: _filterData,
                decoration: InputDecoration(
                  hintText: 'Search by name, age, or gender',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.all(8),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                  itemCount: _filteredData.length,
                  itemBuilder: (context, index) {
                    final Map<String, dynamic> data = _parseJson(_filteredData[index]);
                    if (data.isEmpty) return SizedBox.shrink();

                    final String name = data['name'] != null ? data['name'].toString() : '';
                    final String gender = data['gender'] != null ? data['gender'].toString() : '';
                    final String age = data['age'] != null ? data['age'].toString() : '';

                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
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
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text('Name: $name', style: TextStyle(color: Colors.white, fontSize: 16.0)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text('Gender: $gender', style: TextStyle(color: Colors.white, fontSize: 16.0)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text('Age: $age', style: TextStyle(color: Colors.white, fontSize: 16.0)),
                          ),
                          DataTable(
                            columns: [
                              DataColumn(label: Text('Attribute', style: TextStyle(color: Colors.white))),
                              DataColumn(label: Text('Value', style: TextStyle(color: Colors.white))),
                            ],
                            rows: data.entries.map((entry) {
                              if (entry.key != 'name' && entry.key != 'gender' && entry.key != 'age') {
                                final value = entry.value is num ? (entry.value as num).toStringAsFixed(2) : entry.value;
                                return DataRow(cells: [
                                  DataCell(Text(entry.key, style: TextStyle(color: Colors.white))),
                                  DataCell(Text(value.toString(), style: TextStyle(color: Colors.white))),
                                ]);
                              }
                              return null;
                            }).whereType<DataRow>().toList(),
                          ),
                          SizedBox(height: 8.0),
                          ElevatedButton(
                            onPressed: () => _deleteData(index),
                            child: Text('Delete'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
