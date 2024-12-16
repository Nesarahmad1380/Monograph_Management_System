import 'package:flutter/material.dart';

class USerManagementPage extends StatefulWidget {
  const USerManagementPage({Key? key}) : super(key: key);

  @override
  _USerManagementPageState createState() => _USerManagementPageState();
}

class _USerManagementPageState extends State<USerManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management Page'),
      ),
      body: Center(
        child: Column(),
      ),
    );
  }
}
