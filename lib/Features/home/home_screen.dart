import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/widgets/body_content.dart';
import 'package:portfolio/Features/home/widgets/project.dart';
import 'package:portfolio/Features/home/widgets/skills_card.dart';
import 'package:portfolio/Features/home/widgets/top_row_widget.dart';

class HomeScreen extends StatelessWidget {
  final String name = "Muhammad Hasham Khan";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Background image (can be PNG, JPG, or SVG)
          Positioned.fill(
            child: Opacity(
              opacity: 0.9 , // make it light so content is visible
              child: Image.asset(
                "assets/images/3647208.jpg", // <-- replace with your imagehmbg.jpg 
                fit: BoxFit.cover,
              ),
              // OR if using SVG:
              // child: SvgPicture.asset("assets/images/bg.svg", fit: BoxFit.cover),
            ),
          ),

          // 🔹 Foreground content (your widgets)
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                BodyContent(),
                const SizedBox(height: 40),
                SkillsCard(),          
               const SizedBox(height: 40),
                ProjectsSection(),
               const SizedBox(height: 40),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
