import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monograph_management_system/Providers/Theamprovider.dart';
import 'package:monograph_management_system/Screens/SplashScreen.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(ThemeProvider);

    return MaterialApp(
      title: 'Attendance App',
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: themeMode, // Use theme mode from provider
      routes: {
        '/': (context) => splashscreen(),
      }, // Your home page
    );
  }
}
