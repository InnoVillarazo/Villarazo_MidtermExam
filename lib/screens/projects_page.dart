import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../services/cat_service.dart';
import 'package:flutter/foundation.dart'; // for kIsWeb

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  // Projects with descriptions
  final List<Map<String, String>> projects = [
    {
      "name": "Wine-Festival-Schedule",
      "description":
          "A schedule app for wine festivals, helping attendees plan their visits."
    },
    {
      "name": "Davies-Burger",
      "description":
          "A restaurant ordering app with a digital menu and order tracking."
    },
    {
      "name": "Fashion-Blog",
      "description":
          "A stylish blog platform to share fashion trends and articles."
    },
    {
      "name": "Financial-Tracker-app",
      "description":
          "An app to track personal finances, expenses, and savings goals."
    },
  ];

  final Map<int, String?> catUrls = {};
  final Map<int, bool> isLoading = {};

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < projects.length; i++) {
      _loadCat(i);
    }
  }

  Future<void> _loadCat(int index) async {
    setState(() => isLoading[index] = true);
    final url = await CatService.getRandomCat();
    setState(() {
      catUrls[index] = url;
      isLoading[index] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Projects"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project["name"]!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  if (isLoading[index] == true)
                    const Center(
                        child:
                            CircularProgressIndicator(color: Colors.pinkAccent))
                  else if (catUrls[index] != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: catUrls[index]!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        httpHeaders:
                            kIsWeb ? {} : {"x-api-key": CatService.apiKey},
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(
                                color: Colors.pinkAccent),
                        errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 50),
                      ),
                    )
                  else
                    const Text('Could not load cat image 😿'),
                  const SizedBox(height: 10),
                  Text(
                    project["description"]!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
