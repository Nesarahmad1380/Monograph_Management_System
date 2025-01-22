import 'package:flutter/material.dart';

class AddMonographPage extends StatefulWidget {
  final bool isEdit;
  final Map<String, String>? monograph;
  final int? index;

  const AddMonographPage(
      {super.key, this.isEdit = false, this.monograph, this.index});

  @override
  _AddMonographPageState createState() => _AddMonographPageState();
}

class _AddMonographPageState extends State<AddMonographPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _providerController = TextEditingController();
  final TextEditingController _instructorController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _monographInfoController =
      TextEditingController();
  final TextEditingController _facultyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && widget.monograph != null) {
      _titleController.text = widget.monograph!['title']!;
      _providerController.text = widget.monograph!['provider']!;
      _instructorController.text = widget.monograph!['instructor']!;
      _dateController.text = widget.monograph!['date']!;
      _departmentController.text = widget.monograph!['department']!;
      _monographInfoController.text = widget.monograph!['monographInfo'] ?? '';
      _facultyController.text = widget.monograph!['faculty']!;
    }
  }

  void _saveMonograph() {
    final monograph = {
      'title': _titleController.text,
      'provider': _providerController.text,
      'instructor': _instructorController.text,
      'date': _dateController.text,
      'department': _departmentController.text,
      'monographInfo': _monographInfoController.text,
      'faculty': _facultyController.text,
    };

    // Return the monograph data back to the previous screen
    Navigator.pop(context, monograph);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEdit ? 'Edit Monograph' : 'Add Monograph',
          style: const TextStyle(
              fontFamily: 'Roboto', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue, // Changed to blue accent
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTextField(
              controller: _titleController,
              label: 'Monograph Title',
              icon: Icons.book,
            ),
            _buildTextField(
              controller: _providerController,
              label: 'Provider',
              icon: Icons.business,
            ),
            _buildTextField(
              controller: _instructorController,
              label: 'Instructor',
              icon: Icons.person,
            ),
            _buildTextField(
              controller: _dateController,
              label: 'Date',
              icon: Icons.date_range,
            ),
            _buildTextField(
              controller: _departmentController,
              label: 'Department',
              icon: Icons.school,
            ),
            _buildTextField(
              controller: _monographInfoController,
              label: 'Monograph Info',
              icon: Icons.info_outline,
            ),
            _buildTextField(
              controller: _facultyController,
              label: 'Faculty',
              icon: Icons.account_balance,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveMonograph,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Changed to blue accent
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text(
                widget.isEdit ? 'Update Monograph' : 'Save Monograph',
                style: const TextStyle(
                    color: Colors.white), // Button text is now white
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontFamily: 'Roboto', fontSize: 14),
          prefixIcon: Icon(icon, color: Colors.blue), // Changed to blue accent
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
                color: Colors.blue, width: 2), // Changed to blue accent
          ),
        ),
      ),
    );
  }
}
