import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monograph_management_system/Providers/Fontsizeprovider.dart';
import 'package:monograph_management_system/Providers/Theamprovider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeneralSettingScreen extends ConsumerStatefulWidget {
  @override
  _GeneralSettingScreenState createState() => _GeneralSettingScreenState();
}

class _GeneralSettingScreenState extends ConsumerState<GeneralSettingScreen> {
  double fontSize = 14;
  String language = 'English';

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double savedFontSize = prefs.getDouble('fontSize') ?? 14;
    String savedLanguage = prefs.getString('language') ?? 'English';

    setState(() {
      fontSize = savedFontSize;
      language = savedLanguage;
    });

    ref.read(FontSizeProvider.notifier).setFontSize(savedFontSize);
  }

  void _changeFontSize(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', value);
    ref.read(FontSizeProvider.notifier).setFontSize(value);
  }

  void _changeLanguage(String newLanguage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      language = newLanguage;
    });
    await prefs.setString('language', language);
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = ref.watch(ThemeProvider) == ThemeMode.dark;
    double fontSize = ref.watch(FontSizeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('General Settings'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personalization',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SwitchListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  'Dark Mode',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  isDarkMode ? 'Enabled' : 'Disabled',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                value: isDarkMode,
                onChanged: (value) {
                  ref.read(ThemeProvider.notifier).toggleTheme();
                },
                activeColor: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  'Font Size',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Slider(
                      divisions: 5,
                      value: fontSize,
                      min: 12,
                      max: 34,
                      onChanged: (value) {
                        _changeFontSize(value);
                      },
                      activeColor: Colors.blueAccent,
                      inactiveColor: Colors.grey[300],
                    ),
                    Text(
                      'Selected: ${fontSize.toInt()}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  'Language',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                subtitle: DropdownButton<String>(
                  value: language,
                  isExpanded: true,
                  underline: SizedBox(),
                  items: ['English', 'Spanish', 'French']
                      .map((lang) => DropdownMenuItem(
                            value: lang,
                            child: Text(lang),
                          ))
                      .toList(),
                  onChanged: (value) => _changeLanguage(value!),
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.save),
                label: Text('Save Settings'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
