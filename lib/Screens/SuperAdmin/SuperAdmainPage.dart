import 'package:flutter/material.dart';
import 'package:monograph_management_system/Screens/MonographScreen/MonographManagementPage.dart';
import 'package:monograph_management_system/Screens/SuperAdmin/UserManagementPage.dart';

class SuperAdminPage extends StatefulWidget {
  const SuperAdminPage({super.key});

  @override
  _SuperAdminPageState createState() => _SuperAdminPageState();
}

class _SuperAdminPageState extends State<SuperAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Super Admin Dashboard',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Welcome, Super Admin!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Use the options below to manage users and monographs:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading:
                    const Icon(Icons.group, color: Colors.blueAccent, size: 30),
                title: const Text(
                  'Manage Users',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                subtitle: const Text('Add, update, or remove users.'),
                trailing:
                    const Icon(Icons.arrow_forward, color: Colors.blueAccent),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const USerManagementPage()));
                },
              ),
            ),
            const SizedBox(height: 15),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading:
                    const Icon(Icons.book, color: Colors.blueAccent, size: 30),
                title: const Text(
                  'Manage Monographs',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                subtitle: const Text('View or manage monograph records.'),
                trailing:
                    const Icon(Icons.arrow_forward, color: Colors.blueAccent),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MonographManagementPage()));
                },
              ),
            ),
            const Spacer(),
            const Text(
              '© 2024 Monograph Management System',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
