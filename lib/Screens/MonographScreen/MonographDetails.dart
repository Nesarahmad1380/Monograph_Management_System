import 'package:flutter/material.dart';

class MonographDetailsPage extends StatelessWidget {
  final String
      monograph; // Placeholder for monograph details. Replace with actual data model.

  MonographDetailsPage({required this.monograph});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monograph Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildDetailRow('Monograph Title:', monograph),
            _buildDetailRow('Provider:', 'Provider Info'),
            _buildDetailRow('Instructor:', 'Instructor Info'),
            _buildDetailRow('Date:', 'Date Info'),
            _buildDetailRow(
                'Monograph Information:', 'Detailed Monograph Info'),
            _buildDetailRow('Department:', 'Department Info'),
            _buildDetailRow('Faculty:', 'Faculty Info'),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text('$title ', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
