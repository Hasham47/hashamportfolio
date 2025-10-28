import 'package:flutter/material.dart';
import 'package:portfolio/Features/ContacteMe/contact_me.dart';
import 'package:portfolio/Features/about/about.dart';
import 'package:portfolio/Features/home/home_screen.dart';
import 'package:portfolio/Features/projects/project.dart';

class TopNavScreen extends StatefulWidget {
  const TopNavScreen({super.key});

  @override
  State<TopNavScreen> createState() => _TopNavScreenState();
}

class _TopNavScreenState extends State<TopNavScreen> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    ProjectScreen(),
    ContactMe(),
    About(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Let the body go behind header for style
      body: Stack(
        children: [
          // The selected screen
          screens[currentIndex],

          // ✅ Transparent Rounded Top Navigation Bar
          Positioned(
            top: 20,
            left: 400,
            right: 400,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 4, 116, 141).withOpacity(0.8),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(Icons.home_rounded, "Home", 0),
                  _buildNavItem(Icons.work_outline_rounded, "Projects", 1),
                  _buildNavItem(Icons.phone_rounded, "Contact", 2),
                  _buildNavItem(Icons.person_outline_rounded, "About", 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 233, 236, 236).withOpacity(0.2)
              : const Color.fromARGB(0, 13, 153, 90),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? const Color.fromARGB(255, 227, 229, 206)
                  : const Color.fromARGB(255, 7, 227, 227),
            ),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? const Color.fromARGB(255, 61, 76, 81)
                    : const Color.fromARGB(255, 255, 254, 252),
                fontWeight:
                    isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
