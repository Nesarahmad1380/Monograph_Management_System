import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:monograph_management_system/Screens/AboutPage.dart';
import 'package:monograph_management_system/Screens/MonographScreen/AddMonographPage.dart';
import 'package:monograph_management_system/Screens/MonographScreen/MonographDetails.dart';
import 'package:monograph_management_system/Screens/Privacypolicy.dart';
import 'package:monograph_management_system/Screens/SettingPage.dart';
import 'package:monograph_management_system/Screens/userScreens/LoginPage.dart';
import 'package:share_plus/share_plus.dart';

class ViewMonographPage extends StatefulWidget {
  const ViewMonographPage({super.key});

  @override
  _ViewMonographPageState createState() => _ViewMonographPageState();
}

class _ViewMonographPageState extends State<ViewMonographPage> {
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
        title: const Text('View Monographs'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ListView(
                children: const [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.school,
                      color: Colors.blueAccent,
                      size: 40,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Monograph Management',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Your academic tool',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.blueAccent),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GeneralSettingScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.blueAccent),
              title: const Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip, color: Colors.blueAccent),
              title: const Text('Privacy Policy'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.share, color: Colors.blueAccent),
              title: const Text('Share'),
              onTap: () {
                Share.share(
                  'Check out the Monograph Management System: https://github.com/Nesarahmad1380/Monograph_Management_System.git',
                  subject: 'Monograph Management System',
                );
              },
            ),
            Divider(
              thickness: 1,
              color: Colors.grey[300],
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.redAccent),
              ),
              onTap: () async {
                // Sign out from Firebase
                await FirebaseAuth.instance.signOut();

                // Navigate to the login page and remove all previous routes
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
            ),
          ],
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
                    fontSize: 18,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Instructor: ${monographs[index]['instructor']}',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Date: ${monographs[index]['date']}',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Department: ${monographs[index]['department']}',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  // Navigate to Monograph Details Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MonographDetailsPage(
                        monograph: monographs[index],
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
