import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/widgets/project.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent, // make appbar see-through
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/hmbg.jpg"), // 🔹 your appbar bg image
              fit: BoxFit.cover,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Back to Home",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // 🔹 Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/hmbg.jpg", // 🔹 replace with your bg image
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Foreground Content
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                ProjectsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
