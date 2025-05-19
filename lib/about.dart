import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About This App")),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/icons/logo.png",
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Epileptic Seizure Recognition",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "This app uses Artificial Intelligence (AI) to help recognize epileptic seizures from EEG data. "
              "It aims to assist patients, caregivers, and healthcare professionals by providing a supportive tool for early seizure detection.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "Key Features:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const BulletPoint(text: "AI-powered seizure recognition"),
            const BulletPoint(text: "Interactive web-based analysis"),
            const BulletPoint(text: "Fast and user-friendly interface"),
            const BulletPoint(text: "Free and accessible to all"),
            const SizedBox(height: 30),
            const Text(
              "Disclaimer:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "This app is not a substitute for professional medical advice. Always consult a healthcare provider for diagnosis and treatment.",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const Text(
              "Developer Contact",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ContactItem(
              icon: Icons.person,
              label: "Developer",
              value: "Susmitha Suraj",
            ),
            ContactItem(
              icon: Icons.email,
              label: "Email",
              value: "susmithasuraj235@gmail.com",
              isLink: true,
            ),
          ],
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Text("• ", style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isLink;
  final String? link;

  const ContactItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.isLink = false,
    this.link,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle:
          isLink
              ? Text(
                value,
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              )
              : Text(value),
    );
  }
}
