import 'package:flutter/material.dart';

class SkillsCard extends StatelessWidget {
  const SkillsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Services',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 112, 251, 251),
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          'I am a passionate Flutter developer providing the following services',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 235, 93, 80),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),

        // ✅ Grid of Skill Cards
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1,
          children: const [
            SkillItem(
              imagePath: "assets/images/app.png",
              title: "App Design",
              desc: "Designing app layouts and wireframes based on Figma & design files.",
              color: Colors.deepOrange,
            ),
            SkillItem(
              imagePath: "assets/images/uiux.png",
              title: "UI/UX Developmentt",
              desc: "Creating beautiful, responsive, and user-friendly app interfaces.",
              color: Colors.blueAccent,
            ),
            SkillItem(
              imagePath: "assets/images/api.png",
              title: "Api Integration",
              desc: "Connecting apps with REST APIs for dynamic and real-time data.",
              color: Colors.greenAccent,
            ),
            SkillItem(
              imagePath: "assets/images/fire.png",
              title: "Database Handling",
              desc: "Implementing Firebase ,local storage with SQLite Sharepreference & GetStorage.",
              color: Colors.deepOrange,
            ),
            SkillItem(
              imagePath: "assets/images/state.png",
              title: "State Management",
              desc: "Managing app data flow using Provider, GetX.",
              color: Colors.blueAccent,
            ),
            SkillItem(
              imagePath: "assets/images/archet.png",
              title: "Clean Architecture",
              desc: "Writing maintainable, scalable, and reusable code structures..",
              color: Colors.greenAccent,
            ),
          ],
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}

class SkillItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String desc;
  final Color color;

  const SkillItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.desc,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 399,
      height: 322,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              imagePath,
              // height: 400,
              // width: 250,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
