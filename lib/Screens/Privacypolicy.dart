import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              _sectionHeader('Introduction'),
              const Text(
                'Welcome to the Monograph Management System! Your privacy is important to us. '
                'This Privacy Policy explains how we collect, use, and protect your information when '
                'you use our app. By using this app, you agree to the practices outlined in this policy.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 24),
              _sectionHeader('Data Collection'),
              const Text(
                'We may collect the following types of data:\n\n'
                '- Personal information: such as your name, email address, or phone number, if provided.\n'
                '- Usage data: including app preferences and settings to enhance user experience.\n\n'
                'We collect this information to ensure the functionality of the app and to provide a '
                'personalized experience. If we collect any sensitive information, it will be handled with the '
                'utmost care and in compliance with applicable laws.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 24),
              _sectionHeader('Data Usage'),
              const Text(
                'The data we collect is used to:\n\n'
                '- Improve app functionality and user experience.\n'
                '- Analyze usage trends to make informed updates.\n'
                '- Communicate with users for support or updates, if necessary.\n\n'
                'We do not sell or share your data with third parties without your explicit consent.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 24),
              _sectionHeader('Your Rights'),
              const Text(
                'You have the right to:\n\n'
                '- Access, modify, or delete your personal information stored in the app.\n'
                '- Opt out of any data collection features.\n\n'
                'If you wish to exercise these rights, please contact us at the provided email address below.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 24),
              _sectionHeader('Contact Us'),
              const Text(
                'If you have any questions or concerns about this Privacy Policy, feel free to reach out:\n\n'
                'Email: nasarahmaedmo12345@gmail.com\n'
                'Phone: +93 790 457 286\n'
                'Phone: +93 78 17 14 886\n\n'
                'We are here to address your concerns and ensure your privacy is respected.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 32),
              const Center(
                child: Text(
                  'Thank you for trusting Monograph Management System.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}
