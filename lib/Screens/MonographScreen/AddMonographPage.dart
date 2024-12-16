import 'package:flutter/material.dart';

class AddMonographPage extends StatefulWidget {
  const AddMonographPage({Key? key}) : super(key: key);

  @override
  _AddMonographPageState createState() => _AddMonographPageState();
}

class _AddMonographPageState extends State<AddMonographPage> {
  TextEditingController _titlecontrolar = TextEditingController();
  TextEditingController _providercontrolar = TextEditingController();
  TextEditingController _instructorcontrolar = TextEditingController();
  TextEditingController _datecontrolar = TextEditingController();
  TextEditingController _departmentcontrolar = TextEditingController();
  TextEditingController _monographinformationcontrolar =
      TextEditingController();
  TextEditingController _facultycontrolar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add monograph page'),
      ),
      body: ListView(
        children: [
          TextField(
            controller: _titlecontrolar,
            decoration: InputDecoration(hintText: 'Enter the title'),
          ),
          SizedBox(
            height: 3,
          ),
          TextField(
            controller: _providercontrolar,
            decoration: InputDecoration(hintText: 'Enter the Provider'),
          ),
          SizedBox(
            height: 3,
          ),
          TextField(
            controller: _instructorcontrolar,
            decoration: InputDecoration(hintText: 'Enter the instructor'),
          ),
          SizedBox(
            height: 3,
          ),
          TextField(
            controller: _datecontrolar,
            decoration: InputDecoration(hintText: 'Enter the Date'),
          ),
          SizedBox(
            height: 3,
          ),
          TextField(
            controller: _departmentcontrolar,
            decoration: InputDecoration(hintText: 'Enter the Department'),
          ),
          SizedBox(
            height: 3,
          ),
          TextField(
            controller: _monographinformationcontrolar,
            maxLines: 5,
            decoration:
                InputDecoration(hintText: 'Enter Monograph information'),
          ),
          SizedBox(
            height: 3,
          ),
          TextField(
            controller: _facultycontrolar,
            decoration: InputDecoration(hintText: 'Enter the faculty'),
          ),
          SizedBox(
            height: 3,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Add '))
        ],
      ),
    );
  }
}
