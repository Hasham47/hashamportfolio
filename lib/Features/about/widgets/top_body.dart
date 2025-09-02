import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black, // background
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          const Text(
            "About Me",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 8),
          // Subtitle
          const Text(
            "User Interface And User Experience And Also Video Editing",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white70,
              decoration: TextDecoration.none,

            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          // Row for image and summary
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Side Image
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/mypic.jpg", // 🔹 replace with your image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 30),

              // Right Side Summary
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "A Flutter developer, the modern-day craftsman of mobile experiences, "
"navigates the evolving world of apps, shaping ideas into reality through "
"clean architecture and elegant code. With each widget and controller, "
"they build digital journeys where design meets functionality."
"From converting Figma designs into seamless UIs to integrating APIs, "
"handling backend data, and managing state with Provider and GetX, their skills "
"bridge creativity with engineering precision. Debugging, optimizing, and "
"crafting reusable code are part of their daily pursuit of excellence."
"Having worked closely with advanced AI to refine skills, explore concepts, "
"and build projects, they embody the spirit of continuous learning. Each project "
"is not just an application, but a reflection of growth, adaptability, "
"and the relentless drive to transform complex ideas into simple, beautiful solutions.",                 
                      style: TextStyle(
                        color: Colors.white70,
                        decoration: TextDecoration.none,
                        fontSize: 25,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),

                    // Download CV Button
                    ElevatedButton.icon(
                      onPressed: () {
                        // TODO: add download logic
                      },
                      icon: const Icon(Icons.download, color: Colors.white),
                      label: const Text(
                        "Download CV",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
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
