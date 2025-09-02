import 'package:flutter/material.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SkillDetailCard(
          title: "Flutter Development",
          summary: "Building cross-platform mobile apps with smooth UI and efficient state management.",
          experience: "E-commerce app, Weather app, Resume Builder app",
          imagePath: "assets/images/flutter.png",
          isImageLeft: true,
        ),
        SkillDetailCard(
          title: "Video Editing",
          summary: "Editing professional-quality videos with transitions, effects, and sound design.",
          experience: "YouTube content, freelance projects",
          imagePath: "assets/images/app.png",
          isImageLeft: false,
        ),
        SkillDetailCard(
          title: "UI/UX Design",
          summary: "Designing user-friendly interfaces with modern trends, wireframes, and prototypes.",
          experience: "Portfolio website, client projects",
          imagePath: "assets/images/uiux.png",
          isImageLeft: true,
        ),
      ],
    );
  }
}

class SkillDetailCard extends StatelessWidget {
  final String title;
  final String summary;
  final String experience;
  final String imagePath;
  final bool isImageLeft;

  const SkillDetailCard({
    super.key,
    required this.title,
    required this.summary,
    required this.experience,
    required this.imagePath,
    this.isImageLeft = true,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // 🔹 On small screens -> stack vertically (Column)
    final isMobile = screenWidth < 600;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade900.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildImage(),
                const SizedBox(height: 16),
                buildText(),
              ],
            )
          : Row(
              children: [
                if (isImageLeft) buildImage(),
                const SizedBox(width: 20),
                Expanded(child: buildText()),
                if (!isImageLeft) ...[
                  const SizedBox(width: 20),
                  buildImage(),
                ],
              ],
            ),
    );
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePath,
        width: 120,
        height: 120,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.orangeAccent,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          summary,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Used in: $experience",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
