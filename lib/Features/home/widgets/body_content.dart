import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:  Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Row(
        children: [
          // Left side: Text content
          Expanded(
            flex: 5,
            child: _buildTextContent(),
          ),

          const SizedBox(width: 40),

          // Right side: Image content
          Expanded(
            flex: 5,
            child: _buildImageContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Assalam o Alaikum, I'm",
          style: TextStyle(
            fontSize: 38,
            color: const Color.fromARGB(255, 244, 245, 246),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Muhammad Hasham Khan",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 151, 121, 220),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Text(
              "I am a ",
              style: TextStyle(fontSize: 24, color: const Color.fromARGB(255, 241, 239, 239)),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('Flutter Developer',
                    textStyle: TextStyle(
                        fontSize: 50,
                        color: const Color.fromARGB(255, 219, 213, 67),
                        fontWeight: FontWeight.bold)),
                TyperAnimatedText('Mobile App Designer',
                    textStyle: TextStyle(
                        fontSize: 50,
                        color: const Color.fromARGB(255, 79, 239, 84),
                        fontWeight: FontWeight.bold)),
                TyperAnimatedText('UI/UX Enthusiast',
                    textStyle: TextStyle(
                        fontSize: 50,
                        color: const Color.fromARGB(255, 255, 184, 78),
                        fontWeight: FontWeight.bold)),
              ],
              repeatForever: true,
              pause: const Duration(milliseconds: 1000),
              isRepeatingAnimation: true,
            ),
          ],
        ),
        const SizedBox(height: 30),
        Text(
          "I specialize in building beautiful mobile apps using Flutter, "
          "with a strong focus on design and performance. "
          "I love turning ideas into reality through clean code.",
          style: TextStyle(
            fontSize: 30,
            color: const Color.fromARGB(255, 32, 188, 205),
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildImageContent() {
    return Container(
      // Replace with your actual image path or network URL
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
        image: DecorationImage(
          image: AssetImage('assets/images/nobghmp.png'), // <-- Your image here
          fit: BoxFit.cover,
        ),
      ),
      height: 400,
      // Optional: add some animation or border here
    );
  }
}
