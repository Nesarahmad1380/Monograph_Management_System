import 'package:flutter/material.dart';
import 'package:monograph_management_system/Screens/MonographScreen/MonographManagementPage.dart';
import 'package:monograph_management_system/Screens/SuperAdmin/UserManagementPage.dart';

class SuperAdminPage extends StatefulWidget {
  const SuperAdminPage({Key? key}) : super(key: key);

  @override
  _SuperAdminPageState createState() => _SuperAdminPageState();
}

class _SuperAdminPageState extends State<SuperAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Super Admin Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => USerManagementPage()));
                },
                child: Text('Manage user')),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Monographmanagemenpage()));
                },
                child: Text('Manage Monograph'))
          ],
        ),
      ),
    );
  }
}
