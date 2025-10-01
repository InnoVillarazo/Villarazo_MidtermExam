import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../services/cat_service.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? catUrl;
  bool isLoading = false;

  Future<void> _loadCat() async {
    setState(() => isLoading = true);
    final url = await CatService.getRandomCat();
    setState(() {
      catUrl = url;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catfolio",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              );
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.pinkAccent),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
                title: const Text("Home"),
                onTap: () => Navigator.pushNamed(context, '/home')),
            ListTile(
                title: const Text("About me"),
                onTap: () => Navigator.pushNamed(context, '/about')),
            ListTile(
                title: const Text("Projects"),
                onTap: () => Navigator.pushNamed(context, '/projects')),
            ListTile(
                title: const Text("Skills"),
                onTap: () => Navigator.pushNamed(context, '/skills')),
            ListTile(
                title: const Text("Contact Information"),
                onTap: () => Navigator.pushNamed(context, '/contact')),
          ],
        ),
      ),
      body: Center(
        // Center the entire content
        child: SingleChildScrollView(
          // Optional: scroll if screen is small
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // horizontal center
            mainAxisAlignment: MainAxisAlignment.center, // vertical center
            children: [
              const Text(
                "Hello, I’m a Cat Enthusiast 🐾",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Welcome to my purr-fect portfolio! Meow Meow",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                onPressed: _loadCat,
                icon: const Icon(Icons.pets),
                label: const Text("Random Cat"),
              ),
              const SizedBox(height: 20),
              if (isLoading)
                const CircularProgressIndicator(color: Colors.pink)
              else if (catUrl != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: catUrl!,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    httpHeaders: kIsWeb ? {} : {"x-api-key": CatService.apiKey},
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(color: Colors.pink),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      size: 50,
                      color: Colors.red,
                    ),
                  ),
                )
              else
                const Text("Press the button to see a cat!"),
            ],
          ),
        ),
      ),
    );
  }
}
