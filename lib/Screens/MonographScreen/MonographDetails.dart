import 'package:flutter/material.dart';

class MonographDetailsPage extends StatelessWidget {
  final Map<String, String> monograph;

  // Constructor to receive the monograph data
  const MonographDetailsPage({super.key, required this.monograph});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Monograph Details',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildDetailCard('Monograph Title', monograph['title']!),
            _buildDetailCard('Provider', monograph['provider']!),
            _buildDetailCard('Instructor', monograph['instructor']!),
            _buildDetailCard('Date', monograph['date']!),
            _buildDetailCard('Department', monograph['department']!),
            _buildDetailCard('Faculty', monograph['faculty']!),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard(String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.info_outline, color: Colors.blueAccent),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
