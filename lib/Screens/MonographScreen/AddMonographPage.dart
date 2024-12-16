import 'package:flutter/material.dart';

class AddMonographPage extends StatefulWidget {
  const AddMonographPage({Key? key}) : super(key: key);

  @override
  _AddMonographPageState createState() => _AddMonographPageState();
}

class _AddMonographPageState extends State<AddMonographPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _providerController = TextEditingController();
  TextEditingController _instructorController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();
  TextEditingController _monographInfoController = TextEditingController();
  TextEditingController _facultyController = TextEditingController();

  // Date Picker function
  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        _dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add/Update Monograph'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Title Field
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Monograph Title',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  hintText: 'Enter the title of the monograph',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),

            // Provider Field
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _providerController,
                decoration: InputDecoration(
                  labelText: 'Provider',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  hintText: 'Enter the provider of the monograph',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),

            // Instructor Field
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _instructorController,
                decoration: InputDecoration(
                  labelText: 'Instructor',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  hintText: 'Enter the instructor\'s name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),

            // Date Field with Date Picker
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Date',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  hintText: 'Select the date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ),
              ),
            ),

            // Department Field
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _departmentController,
                decoration: InputDecoration(
                  labelText: 'Department',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  hintText: 'Enter the department name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),

            // Monograph Information Field
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _monographInfoController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Monograph Information',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  hintText: 'Enter detailed information about the monograph',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),

            // Faculty Field
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _facultyController,
                decoration: InputDecoration(
                  labelText: 'Faculty',
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  hintText: 'Enter the faculty name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // Handle Add/Update logic
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ), // Button Color
              ),
              child: Text('Save Monograph'),
            ),
          ],
        ),
      ),
    );
  }
}
