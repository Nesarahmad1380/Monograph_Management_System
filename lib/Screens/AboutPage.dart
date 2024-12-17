import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monograph_management_system/Providers/Fontsizeprovider.dart';

class AboutScreen extends ConsumerStatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends ConsumerState<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    double fontSize = ref.watch(FontSizeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 16),
            _sectionHeader('Developer Information'),
            _infoTile('Name', 'Nesarahmad "Morady"'),
            _infoTile('Contact Number', '0790 457 286'),
            _infoTile('Email', 'nasarahmedmo12345@gmail.com'),
            SizedBox(height: 24),
            _sectionHeader('About the Developer'),
            Text(
              '''This app was developed by Nesarahmad "Morady", a graduate of the Computer Science Faculty at Herat University. 
During his internship at the WASSA organization, supported by UNHCR and other donors, he acquired expertise in Flutter development. 
Special thanks to WASSA and UNHCR for their invaluable support.''',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: fontSize, height: 1.5),
            ),
            SizedBox(height: 24),
            _sectionHeader('About the Application'),
            Text(
              '''The Monograph Management System is designed for universities and can be customized for all faculties./n
              it is the best way to give to new researcher a clue have finde the best reaserch title as all student run into problem 
''',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: fontSize, height: 1.5),
            ),
            SizedBox(height: 24),
            _sectionHeader('Acknowledgments'),
            Text(
              '''This application is made possible thanks to the mentorship and support of the WASSA organization, UNHCR, and all contributors who helped make this project a reality. We extend our gratitude to everyone who played a part in this journey.''',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: fontSize, height: 1.5),
            ),
            SizedBox(height: 32),
            Center(
              child: Text(
                'Thank You for Using the Monograph Management System!',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _infoTile(String label, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Flexible(
            child: Text(
              content,
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
