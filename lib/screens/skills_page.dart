import 'package:flutter/material.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  final List<Map<String, dynamic>> skills = const [
    {"name": "Flutter", "color": Colors.blue},
    {"name": "Figma", "color": Colors.lightBlue},
    {"name": "Photopea", "color": Colors.orange},
    {"name": "2D animation", "color": Colors.black},
    {"name": "Networking", "color": Colors.green},
    {"name": "UI/UX Design", "color": Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skills"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Skills",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Here are some technologies and tools I excel at:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: skills.map((skill) {
                return Chip(
                  label: Text(skill["name"]),
                  backgroundColor: skill["color"].withOpacity(0.2),
                  labelStyle: TextStyle(
                    color: skill["color"],
                    fontWeight: FontWeight.bold,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
