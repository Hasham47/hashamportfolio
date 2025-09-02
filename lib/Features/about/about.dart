import 'package:flutter/material.dart';
import 'package:portfolio/Features/about/widgets/top_body.dart';
import 'package:portfolio/Features/home/widgets/top_row_widget.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          // 🔹 Background image (can be PNG, JPG, or SVG)
          Positioned.fill(
            child: Opacity(
              opacity: 0.9 , // make it light so content is visible
              child: Image.asset(
                "assets/images/hmbg.jpg", // <-- replace with your imagehmbg.jpg 
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
                TopRowWidget(),
                const SizedBox(height: 30),
                AboutMe(),
                

              ],
            ),
          ),
        ],
      );
  
         
  }
}