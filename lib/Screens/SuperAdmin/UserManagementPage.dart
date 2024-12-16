import 'package:flutter/material.dart';

class USerManagementPage extends StatefulWidget {
  const USerManagementPage({Key? key}) : super(key: key);

  @override
  _USerManagementPageState createState() => _USerManagementPageState();
}

class _USerManagementPageState extends State<USerManagementPage> {
  // Fake user list
  List<Map<String, dynamic>> users = [
    {'name': 'Nesar Ahmad', 'email': 'nesar@example.com', 'isAdmin': false},
    {'name': 'Fatima Khan', 'email': 'fatima@example.com', 'isAdmin': false},
    {'name': 'Ali Reza', 'email': 'ali@example.com', 'isAdmin': true},
    {'name': 'Zahra Mohammadi', 'email': 'zahra@example.com', 'isAdmin': false},
    {'name': 'Ahmad Sharifi', 'email': 'ahmad@example.com', 'isAdmin': false},
    {'name': 'Nesar Ahmad', 'email': 'nesar@example.com', 'isAdmin': false},
    {'name': 'Fatima Khan', 'email': 'fatima@example.com', 'isAdmin': false},
    {'name': 'Ali Reza', 'email': 'ali@example.com', 'isAdmin': true},
    {'name': 'Zahra Mohammadi', 'email': 'zahra@example.com', 'isAdmin': false},
    {'name': 'Ahmad Sharifi', 'email': 'ahmad@example.com', 'isAdmin': false},
  ];

  // Function to toggle admin status
  void toggleAdminStatus(int index) {
    setState(() {
      users[index]['isAdmin'] = !users[index]['isAdmin'];
    });
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        users[index]['isAdmin']
            ? '${users[index]['name']} is now an Admin.'
            : '${users[index]['name']} is no longer an Admin.',
      ),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(
                users[index]['isAdmin']
                    ? Icons.verified_user
                    : Icons.person_outline,
                color: users[index]['isAdmin'] ? Colors.green : Colors.grey,
                size: 30,
              ),
              title: Text(
                users[index]['name'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(users[index]['email']),
              trailing: Icon(Icons.arrow_forward, color: Colors.blueAccent),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                          '${users[index]['isAdmin'] ? "Remove Admin" : "Make Admin"}'),
                      content: Text(
                          'Do you want to ${users[index]['isAdmin'] ? "remove admin access" : "grant admin access"} for ${users[index]['name']}?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () => toggleAdminStatus(index),
                          child: Text(users[index]['isAdmin']
                              ? 'Remove Admin'
                              : 'Make Admin'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class AddMonographPage extends StatelessWidget {
  const AddMonographPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Monograph'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'This is the Add Monograph Page.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
