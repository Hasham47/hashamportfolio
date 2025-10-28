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
            crossAxisCount: 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.7,
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
            ? (Matrix4.identity()..scale(1.06))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), // more rounded corners
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isHovered
                ? [
                    Colors.cyanAccent.withOpacity(0.25),
                    Colors.blueGrey.withOpacity(0.15),
                  ]
                : [
                    Colors.grey.shade900.withOpacity(0.7),
                    Colors.black.withOpacity(0.6),
                  ],
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? Colors.cyanAccent.withOpacity(0.6)
                  : Colors.cyanAccent.withOpacity(0.2),
              blurRadius: isHovered ? 30 : 12,
              spreadRadius: isHovered ? 2 : 0,
              offset: const Offset(0, 6),
            ),
          ],
          border: Border.all(
            color: isHovered
                ? Colors.cyanAccent.withOpacity(0.7)
                : Colors.cyanAccent.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30)),
              child: Image.asset(
                widget.imagePath,
                height: 360, // smaller height
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Expanded(
                      child: Text(
                        widget.desc,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withOpacity(0.8),
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: isHovered ? 1 : 0,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.cyanAccent.withOpacity(0.9),
                          size: 22,
                        ),
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
