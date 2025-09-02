import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Map<String, String>> projects = const [
    {
      'title': 'Mockup Design',
      'desc': 'Creative UI mockups crafted with attention to detail.',
      'image': 'assets/images/mock1.png',
    },
    {
      'title': 'Mobile Prototype',
      'desc': 'Interactive prototype for seamless user journeys.',
      'image': 'assets/images/mock2.PNG',
    },
    {
      'title': 'State Management',
      'desc': 'Efficient app state handling with Provider & GetX.',
      'image': 'assets/images/state.png',
    },
    {
      'title': 'UI/UX Case Study',
      'desc': 'Design systems with modern futuristic touch.',
      'image': 'assets/images/uiux.png',
    },
    {
      'title': 'Firebase Integration',
      'desc': 'Realtime data sync & auth powered by Firebase.',
      'image': 'assets/images/fire.png',
    },
    {
      'title': 'API Integration',
      'desc': 'REST API integration with error handling.',
      'image': 'assets/images/api.png',
    },
    {
      'title': 'Clean Architecture',
      'desc': 'Scalable project structure for long-term growth.',
      'image': 'assets/images/archet.png',
    },
    {
      'title': 'Advanced State Logic',
      'desc': 'Reusable patterns with Riverpod and GetX.',
      'image': 'assets/images/state.png',
    },
    {
      'title': 'App Development',
      'desc': 'Cross-platform apps built with Flutter.',
      'image': 'assets/images/app dev.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'Projects',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 30),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return _FuturisticProjectCard(
              title: project['title']!,
              desc: project['desc']!,
              imagePath: project['image']!,
            );
          },
        ),
      ],
    );
  }
}

class _FuturisticProjectCard extends StatefulWidget {
  final String title;
  final String desc;
  final String imagePath;

  const _FuturisticProjectCard({
    required this.title,
    required this.desc,
    required this.imagePath,
  });

  @override
  State<_FuturisticProjectCard> createState() => _FuturisticProjectCardState();
}

class _FuturisticProjectCardState extends State<_FuturisticProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: isHovered
            ? (Matrix4.identity()..scale(1.05))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? Colors.cyanAccent.withOpacity(0.7)
                  : Colors.cyanAccent.withOpacity(0.3),
              blurRadius: isHovered ? 20 : 10,
              spreadRadius: 1,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  widget.imagePath,
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Text(
                        widget.desc,
                        style: const TextStyle(
                            fontSize: 13, color: Colors.white70),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
