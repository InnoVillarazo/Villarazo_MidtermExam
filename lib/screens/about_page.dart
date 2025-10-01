import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Me")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("About Me",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child:
                  Image.asset("assets/me.jpg", height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            const Text("📍 Agusan del Sur, Philippines"),
            const Text("🎂 03.18.2002"),
            const Text("💻 Information Technology"),
            const Text("👨‍🎓 Student by Day | Sleeping by Night"),
            const SizedBox(height: 20),
            const Text("Who am I?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text(
              "I am Inno Marco Villarazo, a 4th-year IT student with a strong passion for exploring the latest in technology. "
              "Throughout my academic journey, I have gained hands-on experience in software development, database management, and web technologies.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
