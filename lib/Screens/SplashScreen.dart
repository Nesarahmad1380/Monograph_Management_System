import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monograph_management_system/Screens/userScreens/LoginPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Loginpage()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/Heratcomputersciencelogo.PNG'),
                const Text(
                  'Welcome to Monograph Management System',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const Text('v 0.0.1',
                    style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
