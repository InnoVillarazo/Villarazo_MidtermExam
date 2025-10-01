import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  final List<Map<String, dynamic>> contacts = const [
    {
      "type": "Email",
      "value": "ivillarazo_210000001127@uic.edu.ph",
      "icon": Icons.email,
    },
    {
      "type": "Phone",
      "value": "09292306800 | 09920309107",
      "icon": Icons.phone,
    },
    {
      "type": "GitHub",
      "value": "github.com/InnoVillarazo",
      "icon": Icons.code,
    },
    {
      "type": "Facebook",
      "value": "facebook.com/innomarco.villarazo",
      "icon": Icons.facebook,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Information"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Get in Touch",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Here’s how you can reach me:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ...contacts.map((contact) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.symmetric(vertical: 8),
                elevation: 3,
                child: ListTile(
                  leading: Icon(contact["icon"], color: Colors.pinkAccent),
                  title: Text(contact["type"]),
                  subtitle: Text(contact["value"]),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
