import 'package:flutter/material.dart';
import 'package:monograph_management_system/Screens/MonographScreen/ViewMonographPage.dart';
import 'package:monograph_management_system/Screens/userScreens/RagisterPage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController _emailcontrolar = TextEditingController();
  TextEditingController _passwordcontrolar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailcontrolar,
              decoration: InputDecoration(hintText: 'Enter Email'),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: _passwordcontrolar,
              decoration: InputDecoration(hintText: 'Enter Password'),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewMonographPage()));
                },
                child: Text('Login')),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewMonographPage()));
                },
                child: Text('Continue as Student')),
            SizedBox(
              height: 3,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RagisterPage()));
                },
                child: Text('Go to Ragister page')),
          ],
        ),
      )),
    );
  }
}
