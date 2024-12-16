import 'package:flutter/material.dart';

class MonographDetails extends StatefulWidget {
  const MonographDetails({Key? key}) : super(key: key);

  @override
  _MonographDetailsState createState() => _MonographDetailsState();
}

class _MonographDetailsState extends State<MonographDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mongraph Details'),
      ),
      body: Center(
        child: ListView(
          children: [
            Text('Monograph title:'),
            SizedBox(
              height: 2,
            ),
            Text('Provided by :'),
            SizedBox(
              height: 2,
            ),
            Text('Instructor :'),
            SizedBox(
              height: 2,
            ),
            Text('Data :'),
            SizedBox(
              height: 2,
            ),
            Text('Monograph information :'),
            SizedBox(
              height: 2,
            ),
            Text('Department : '),
            SizedBox(
              height: 2,
            ),
            Text('Faculty : ')
          ],
        ),
      ),
    );
  }
}
