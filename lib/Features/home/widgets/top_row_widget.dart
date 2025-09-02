import 'package:flutter/material.dart';
import 'package:portfolio/Features/ContacteMe/contact_me.dart';
import 'package:portfolio/Features/about/about.dart';
import 'package:portfolio/Features/home/home_screen.dart';
import 'package:portfolio/Features/projects/project.dart';

class TopRowWidget extends StatelessWidget {
  const TopRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Image.asset(
            'assets/images/mlogo.png',
            height: 80,
          ),

          // Navigation
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              navItem(context, 'Home',  HomeScreen()),
              navItem(context, 'Projects',  ProjectScreen()), // Replace later with Projects screen
              navItem(context, 'Contact',  ContactMe()), // Replace later with Contact screen
              navItem(context, 'About',  About()),
            ],
          ),

          // Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 248, 200, 70),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Resume",
              style: TextStyle(
                color: Color.fromARGB(255, 21, 21, 21),
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget navItem(BuildContext context, String label, Widget screen) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => screen,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // Slide from right
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 22,
            color: Color.fromARGB(255, 238, 145, 23),
           decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
