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
      appBar: AppBar(title: Text('General Settings')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Dark Mode'),
              value: isDarkMode,
              onChanged: (value) {
                ref.read(ThemeProvider.notifier).toggleTheme();
              },
            ),
            ListTile(
              title: Text('Font Size'),
              subtitle: Slider(
                divisions: 5,
                value: fontSize,
                min: 12,
                max: 34,
                onChanged: (value) {
                  _changeFontSize(value);
                },
              ),
            ),
            ListTile(
              title: Text('Language'),
              subtitle: DropdownButton<String>(
                value: language,
                items: ['English', 'Spanish', 'French']
                    .map((lang) => DropdownMenuItem(
                          value: lang,
                          child: Text(lang),
                        ))
                    .toList(),
                onChanged: (value) => _changeLanguage(value!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
