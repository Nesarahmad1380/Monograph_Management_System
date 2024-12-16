import 'package:flutter/material.dart';

class AddMonographPage extends StatefulWidget {
  final Map<String, String>? monograph;
  final bool isEditing;
  final Function(Map<String, String>) onSave;

  const AddMonographPage({
    Key? key,
    this.monograph,
    this.isEditing = false,
    required this.onSave,
  }) : super(key: key);

  @override
  _AddMonographPageState createState() => _AddMonographPageState();
}

class _AddMonographPageState extends State<AddMonographPage> {
  late TextEditingController _titleController;
  late TextEditingController _providerController;
  late TextEditingController _instructorController;
  late TextEditingController _dateController;
  late TextEditingController _departmentController;
  late TextEditingController _infoController;
  late TextEditingController _facultyController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.monograph?['title']);
    _providerController =
        TextEditingController(text: widget.monograph?['provider']);
    _instructorController =
        TextEditingController(text: widget.monograph?['instructor']);
    _dateController = TextEditingController(text: widget.monograph?['date']);
    _departmentController =
        TextEditingController(text: widget.monograph?['department']);
    _infoController = TextEditingController(text: widget.monograph?['info']);
    _facultyController =
        TextEditingController(text: widget.monograph?['faculty']);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _providerController.dispose();
    _instructorController.dispose();
    _dateController.dispose();
    _departmentController.dispose();
    _infoController.dispose();
    _facultyController.dispose();
    super.dispose();
  }

  void saveMonograph() {
    final monograph = {
      'title': _titleController.text,
      'provider': _providerController.text,
      'instructor': _instructorController.text,
      'date': _dateController.text,
      'department': _departmentController.text,
      'info': _infoController.text,
      'faculty': _facultyController.text,
    };
    widget.onSave(monograph);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Edit Monograph' : 'Add Monograph'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _providerController,
              decoration: InputDecoration(labelText: 'Provider'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _instructorController,
              decoration: InputDecoration(labelText: 'Instructor'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Date'),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _departmentController,
              decoration: InputDecoration(labelText: 'Department'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _infoController,
              maxLines: 5,
              decoration: InputDecoration(labelText: 'Information'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _facultyController,
              decoration: InputDecoration(labelText: 'Faculty'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveMonograph,
              child: Text(widget.isEditing ? 'Update' : 'Save'),
            ),
          ],
        ),
      ),
    );
  }
}
