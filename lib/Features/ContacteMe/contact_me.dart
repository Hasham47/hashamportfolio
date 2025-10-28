import 'package:flutter/material.dart';
import 'package:portfolio/Features/ContacteMe/widgets/main_content.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({super.key});

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                ContactMainContent(),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
