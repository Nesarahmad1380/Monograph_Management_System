import 'package:flutter/material.dart';
import 'package:monograph_management_system/Screens/MonographScreen/AddMonographPage.dart';
import 'package:monograph_management_system/Screens/MonographScreen/MonographDetails.dart';

class MonographManagementPage extends StatefulWidget {
  const MonographManagementPage({super.key});

  @override
  _MonographManagementPageState createState() =>
      _MonographManagementPageState();
}

class _MonographManagementPageState extends State<MonographManagementPage> {
  // List of monographs
  List<Map<String, String>> monographs = [];

  @override
  void initState() {
    super.initState();
    // Load initial data if any (e.g., from local storage or database)
    // For now, we'll use a sample monograph
    monographs = [
      {
        'title': 'Flutter for Beginners',
        'provider': 'Provider1',
        'instructor': 'Instructor1',
        'date': '2024-12-16',
        'department': 'Computer Science',
        'faculty': 'Engineering'
      },
      {
        'title': 'Advanced Dart Programming',
        'provider': 'Provider2',
        'instructor': 'Instructor2',
        'date': '2024-12-20',
        'department': 'Computer Science',
        'faculty': 'Engineering'
      },
    ];
  }

  void _addOrUpdateMonograph(Map<String, String> monograph, {int? index}) {
    setState(() {
      if (index != null) {
        // Update existing monograph
        monographs[index] = monograph;
      } else {
        // Add new monograph
        monographs.add(monograph);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Monograph Management',
          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: monographs.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Text(
                  monographs[index]['title']!,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  'By ${monographs[index]['instructor']}',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.grey[600],
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () {
                        // Navigate to Add Monograph Page with data for editing
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddMonographPage(
                              isEdit: true,
                              monograph: monographs[index],
                              index: index,
                            ),
                          ),
                        ).then((updatedMonograph) {
                          if (updatedMonograph != null) {
                            // Pass the updated monograph to the list
                            _addOrUpdateMonograph(updatedMonograph,
                                index: index);
                          }
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          monographs.removeAt(index);
                        });
                      },
                    ),
                  ],
                ),
                onTap: () {
                  // Navigate to Monograph Details Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MonographDetailsPage(
                        monograph: monographs[index], // Passing Map here
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMonographPage()),
          ).then((newMonograph) {
            if (newMonograph != null) {
              _addOrUpdateMonograph(newMonograph);
            }
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
