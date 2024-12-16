import 'package:flutter/material.dart';
import 'package:monograph_management_system/Screens/userScreens/WaitingPage.dart';

class RagisterPage extends StatefulWidget {
  const RagisterPage({Key? key}) : super(key: key);

  @override
  _RagisterPageState createState() => _RagisterPageState();
}

class _RagisterPageState extends State<RagisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(),
              SizedBox(
                height: 5,
              ),
              TextField(),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WaitingPage()));
                  },
                  child: Text('Ragister'))
            ],
          ),
        ),
      ),
    );
  }
}
