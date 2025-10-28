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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // 🔹 Background Image
            Positioned.fill(
              child: Image.asset(
               "assets/images/3647208.jpg", // 🔹 replace with your bg image
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
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: ProjectsSection(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
