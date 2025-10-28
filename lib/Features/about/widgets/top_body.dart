import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 🔹 Title
          const Text(
            "About Me",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: Colors.cyanAccent,
              decoration: TextDecoration.none,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 10),

          // 🔹 Subtitle
          const Text(
            "UI/UX Designer • Flutter Developer • Cross Plateform",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
              decoration: TextDecoration.none,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),

          // 🔹 Row Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left: Profile Image with glow
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                        color: Colors.cyanAccent.withOpacity(0.5), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyanAccent.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      "assets/images/mypic.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 40),

              // Right: Text Section
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "I'm Muhammad Hasham Khan — a dedicated Flutter developer who enjoys crafting beautiful, functional, and efficient applications. "
                      "I turn complex problems into simple, elegant solutions, always focusing on user experience and performance. "
                      "My expertise spans from UI/UX design and animations to API integration, Firebase, and clean architecture.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        height: 1.6,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.justify,
                    ),

                    const SizedBox(height: 30),

                    // 🔹 Futuristic Line Separator
                    Container(
                      height: 2,
                      width: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.cyanAccent,
                            Colors.purpleAccent.withOpacity(0.7)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 🔹 Skills Section
                    Wrap(
                      spacing: 15,
                      runSpacing: 10,
                      children: const [
                        _SkillChip("Flutter"),
                        _SkillChip("Firebase"),
                        _SkillChip("REST APIs"),
                        _SkillChip("UI/UX Design"),
                        _SkillChip("Provider & GetX"),
                        _SkillChip("Video Editing"),
                        _SkillChip("Responsive Web UI"),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // 🔹 Download CV Button
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.download, color: Colors.white),
                      label: const Text(
                        "Download CV",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyanAccent.withOpacity(0.2),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: const BorderSide(color: Colors.cyanAccent),
                        ),
                        elevation: 8,
                        shadowColor: Colors.cyanAccent.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Small futuristic skill chip widget
class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color.fromARGB(255, 246, 123, 215).withOpacity(0.5)),
        color: Colors.white.withOpacity(0.05),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 255, 24, 159).withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white70, fontSize: 13),
      ),
    );
  }
}
