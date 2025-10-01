import 'package:flutter/material.dart';
import 'screens/splash_page.dart';
import 'screens/home_page.dart';
import 'screens/about_page.dart';
import 'screens/projects_page.dart';
import 'screens/skills_page.dart';
import 'screens/contact_page.dart';

void main() {
  runApp(const CatfolioApp());
}

class CatfolioApp extends StatelessWidget {
  const CatfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink),
        scaffoldBackgroundColor: const Color(0xFFF6F6F6),
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashPage(),
        '/home': (_) => const HomePage(),
        '/about': (_) => const AboutPage(),
        '/projects': (_) => const ProjectsPage(),
        '/skills': (_) => const SkillsPage(),
        '/contact': (_) => const ContactPage(),
      },
    );
  }
}
