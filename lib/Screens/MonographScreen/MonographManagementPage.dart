import 'package:flutter/material.dart';
import 'package:monograph_management_system/Screens/MonographScreen/AddMonographPage.dart';

class Monographmanagemenpage extends StatefulWidget {
  const Monographmanagemenpage({Key? key}) : super(key: key);

  @override
  _MonographmanagemenpageState createState() => _MonographmanagemenpageState();
}

class _MonographmanagemenpageState extends State<Monographmanagemenpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monograph Management Page'),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddMonographPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
