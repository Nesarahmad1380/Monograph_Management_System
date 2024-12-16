import 'package:flutter/material.dart';

import 'AddMonographPage.dart';

class MonographManagementPage extends StatefulWidget {
  const MonographManagementPage({Key? key}) : super(key: key);

  @override
  _MonographManagementPageState createState() =>
      _MonographManagementPageState();
}

class _MonographManagementPageState extends State<MonographManagementPage> {
  List<Map<String, String>> monographs = [
    {
      'title': 'Artificial Intelligence',
      'provider': 'John Doe',
      'instructor': 'Dr. Smith',
      'date': '2024-12-01',
      'department': 'Computer Science',
      'info': 'A comprehensive study on AI advancements.',
      'faculty': 'Engineering'
    },
    {
      'title': 'Blockchain Technology',
      'provider': 'Jane Doe',
      'instructor': 'Dr. Brown',
      'date': '2024-11-15',
      'department': 'Information Systems',
      'info': 'Understanding blockchain and its applications.',
      'faculty': 'Management'
    },
  ];

  // Function to handle edit or delete
  void handleEdit(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddMonographPage(
          monograph: monographs[index],
          isEditing: true,
          onSave: (updatedMonograph) {
            setState(() {
              monographs[index] = updatedMonograph;
            });
          },
        ),
      ),
    );
  }

  void handleDelete(int index) {
    setState(() {
      monographs.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Monograph deleted successfully!'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monograph Management'),
        backgroundColor: Colors.blueAccent,
      ),
      body: monographs.isEmpty
          ? Center(
              child: Text(
                'No monographs available. Add a new one!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: monographs.length,
              itemBuilder: (context, index) {
                final monograph = monographs[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(
                      monograph['title']!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(monograph['department']!),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'Edit') handleEdit(index);
                        if (value == 'Delete') handleDelete(index);
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(value: 'Edit', child: Text('Edit')),
                        PopupMenuItem(value: 'Delete', child: Text('Delete')),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddMonographPage(
                onSave: (newMonograph) {
                  setState(() {
                    monographs.add(newMonograph);
                  });
                },
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
