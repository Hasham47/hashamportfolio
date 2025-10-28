import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/Features/ContacteMe/widgets/contact_form.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMainContent extends StatefulWidget {
  const ContactMainContent({super.key});

  @override
  State<ContactMainContent> createState() => _ContactMainContentState();
}

class _ContactMainContentState extends State<ContactMainContent>
    with TickerProviderStateMixin {
  late final AnimationController _gradientController;
  late final AnimationController _particleController;
  late final AnimationController _entryController;

  // counters controllers
  late final AnimationController _yearsController;
  late final AnimationController _projectsController;
  late final AnimationController _clientsController;

  final List<_Particle> _particles = [];
  final int _particleCount = 36;

  @override
  void initState() {
    super.initState();

    _gradientController =
        AnimationController(vsync: this, duration: const Duration(seconds: 8))
          ..repeat();

    _particleController =
        AnimationController(vsync: this, duration: const Duration(seconds: 12))
          ..repeat();

    _entryController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 900))
          ..forward();

    // counters (from 0 -> target)
    _yearsController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _projectsController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _clientsController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    // generate moving particles
    final rng = Random();
    for (int i = 0; i < _particleCount; i++) {
      _particles.add(_Particle(
        position: Offset(rng.nextDouble(), rng.nextDouble()),
        size: 1.5 + rng.nextDouble() * 3.5,
        baseSpeed: 0.002 + rng.nextDouble() * 0.006,
        hue: rng.nextDouble() * 360,
      ));
    }

    // start count-up after a small delay so it feels natural
    Future.delayed(const Duration(milliseconds: 400), () {
      _yearsController.forward();
      _projectsController.forward();
      _clientsController.forward();
    });
  }

  @override
  void dispose() {
    _gradientController.dispose();
    _particleController.dispose();
    _entryController.dispose();
    _yearsController.dispose();
    _projectsController.dispose();
    _clientsController.dispose();
    super.dispose();
  }

  // helper launcher
  static Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      // fail silently in UI context, but throw for debugging
      throw Exception("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    // responsive paddings
    final width = MediaQuery.of(context).size.width;
    final isNarrow = width < 900;

    return Stack(
      children: [
        // Animated background gradient
        AnimatedBuilder(
          animation: _gradientController,
          builder: (context, child) {
            return CustomPaint(
              painter: _AnimatedGradientPainter(_gradientController.value),
              size: MediaQuery.of(context).size,
            );
          },
        ),

        // Moving particles
        AnimatedBuilder(
          animation: _particleController,
          builder: (context, child) {
            return CustomPaint(
              painter: _ParticlesPainter(_particles, _particleController.value),
              size: MediaQuery.of(context).size,
            );
          },
        ),

        // blur overlay to create depth
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6 * (0.6), sigmaY: 6 * (0.6)),
          child: Container(color: Colors.transparent),
        ),

        // Main content
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isNarrow ? 18 : 40, vertical: 28),
            child: Column(
              children: [
                const SizedBox(height: 24),
                FadeScaleTransition(
                  animation: _entryController,
                  child: Column(
                    children: [
                      Text(
                        "Get In Touch",
                        style: TextStyle(
                          color: Colors.cyanAccent.shade100,
                          fontSize: isNarrow ? 36 : 46,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.6,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 4,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(colors: [
                            Colors.cyanAccent.withOpacity(0.95),
                            Colors.purpleAccent.withOpacity(0.9)
                          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 26),

                // Profile + details + counters + contact cards
                FadeScaleTransition(
                  animation: CurvedAnimation(
                      parent: _entryController, curve: const Interval(0.15, 1.0)),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      // Left column: profile & contact cards
                      SizedBox(
                        width: isNarrow ? width * 0.95 : width * 0.34,
                        child: Column(
                          children: [
                            // profile image + name
                            _ProfileTile(),

                            const SizedBox(height: 18),

                            // contact cards (glass)
                            _GlassContactCard(
                              icon: Icons.chat_bubble_outline,
                              title: "WhatsApp",
                              subtitle: "Tap to start chat",
                              onTap: () => _launchURL("https://wa.me/923336188148"),
                            ),
                            _GlassContactCard(
                              icon: Icons.email_outlined,
                              title: "Email",
                              subtitle: "durraani47@gmail.com",
                              onTap: () => _launchURL("mailto:durraani47@gmail.com"),
                            ),
                            _GlassContactCard(
                              icon: Icons.phone_android,
                              title: "Phone",
                              subtitle: "+92 333 6188148",
                              onTap: () => _launchURL("tel:+923336188148"),
                            ),

                            const SizedBox(height: 14),

                            // social row
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              alignment: WrapAlignment.center,
                              children: [
                                _HoverIcon(
                                  asset: "assets/images/link.png",
                                  onTap: () => _launchURL(
                                      "https://www.linkedin.com/in/muhammad-hasham-khan-b46b18289/"),
                                ),
                                _HoverIcon(
                                  asset: "assets/images/git.png",
                                  onTap: () => _launchURL("https://github.com/Hasham47"),
                                ),
                                _HoverIcon(
                                  asset: "assets/images/insta.png",
                                  onTap: () => _launchURL("https://www.instagram.com/hasham9929"),
                                ),
                                _HoverIcon(
                                  asset: "assets/images/X.jpg",
                                  onTap: () => _launchURL("https://x.com/DURRANImhk47"),
                                ),
                                _HoverIcon(
                                  asset: "assets/images/whats.png",
                                  onTap: () => _launchURL("https://wa.me/923336188148"),
                                ),
                              ],
                            ),

                            const SizedBox(height: 18),

                            // download cv
                            ElevatedButton.icon(
                              onPressed: () => _launchURL("https://yourdomain.com/cv.pdf"),
                              icon: const Icon(Icons.download_rounded, color: Colors.black),
                              label: const Text("Download CV",
                                  style: TextStyle(color: Colors.black)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyanAccent,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 8,
                              ),
                            ),

                            const SizedBox(height: 18),

                            // CTA
                            Text(
                              "“Let’s build something amazing together 🚀”",
                              style: TextStyle(
                                  color: Colors.cyanAccent.shade100,
                                  fontStyle: FontStyle.italic),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                      // Right column: counters + form
                      SizedBox(
                        width: isNarrow ? width * 0.95 : width * 0.55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // counters row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _AnimatedCountBox(
                                  label: "Years",
                                  target: 2,
                                  controller: _yearsController,
                                ),
                                _AnimatedCountBox(
                                  label: "Projects",
                                  target: 12,
                                  controller: _projectsController,
                                ),
                                _AnimatedCountBox(
                                  label: "Happy Clients",
                                  target: 4,
                                  controller: _clientsController,
                                ),
                              ],
                            ),

                            const SizedBox(height: 22),

                            // short intro card
                            _GlassIntroCard(),

                            const SizedBox(height: 20),

                            // contact form area
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.white.withOpacity(0.02),
                                border: Border.all(
                                    color: Colors.cyanAccent.withOpacity(0.12)),
                              ),
                              child: ContactForm(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),

        // floating WA button
        Positioned(
          bottom: 22,
          right: 22,
          child: ScaleTransition(
            scale: CurvedAnimation(parent: _entryController, curve: Curves.elasticOut),
            child: FloatingActionButton(
              backgroundColor: Colors.cyanAccent,
              onPressed: () => _launchURL("https://wa.me/923336188148"),
              child: const Icon(Icons.chat, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}

/// small profile tile with glowing ring
class _ProfileTile extends StatelessWidget {
  const _ProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              Colors.cyanAccent.shade200,
              Colors.purpleAccent.shade200
            ]),
            boxShadow: [
              BoxShadow(
                color: Colors.cyanAccent.withOpacity(0.45),
                blurRadius: 30,
                spreadRadius: 6,
              )
            ],
          ),
          child: const CircleAvatar(
            radius: 64,
            backgroundImage: AssetImage("assets/images/pro.jpg"),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "Muhammad Hasham Khan",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 6),
        const Text(
          "Flutter Developer • Mobile & Web",
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ],
    );
  }
}

/// Glass contact card with hover glow
class _GlassContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _GlassContactCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  State<_GlassContactCard> createState() => _GlassContactCardState();
}

class _GlassContactCardState extends State<_GlassContactCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white.withOpacity(_hover ? 0.08 : 0.04),
            border: Border.all(
              color: Colors.cyanAccent.withOpacity(_hover ? 0.8 : 0.28),
              width: _hover ? 1.6 : 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.cyanAccent.withOpacity(_hover ? 0.28 : 0.12),
                blurRadius: _hover ? 20 : 10,
                spreadRadius: _hover ? 2 : 0,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Colors.cyanAccent.withOpacity(_hover ? 1 : 0.6),
                    Colors.purpleAccent.withOpacity(0.8)
                  ]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyanAccent.withOpacity(_hover ? 0.35 : 0.2),
                      blurRadius: 8,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: Icon(widget.icon, color: Colors.black, size: 20),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(widget.subtitle,
                      style: const TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// small intro glass card
class _GlassIntroCard extends StatelessWidget {
  const _GlassIntroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.02),
        border: Border.all(color: Colors.cyanAccent.withOpacity(0.07)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Short intro",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "I build cross-platform mobile & web apps using Flutter. I focus on clean UI, efficient state management, and delivering production-ready apps.",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

/// animated count box that counts from 0 -> target
class _AnimatedCountBox extends StatelessWidget {
  final int target;
  final String label;
  final AnimationController controller;

  const _AnimatedCountBox({
    required this.target,
    required this.controller,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: target.toDouble()),
      duration: controller.duration ?? const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        final displayed = value.clamp(0, target.toDouble()).toInt();
        return Container(
          width: 110,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white.withOpacity(0.02),
            border: Border.all(color: Colors.cyanAccent.withOpacity(0.08)),
            boxShadow: [
              BoxShadow(
                color: Colors.cyanAccent.withOpacity(0.06),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                "$displayed${label == 'Years' ? '+' : '+'}",
                style: TextStyle(
                    color: Colors.cyanAccent.shade100,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// social icon with hover pulse
class _HoverIcon extends StatefulWidget {
  final String asset;
  final VoidCallback onTap;
  const _HoverIcon({required this.asset, required this.onTap, Key? key})
      : super(key: key);

  @override
  State<_HoverIcon> createState() => _HoverIconState();
}

class _HoverIconState extends State<_HoverIcon> with TickerProviderStateMixin {
  bool _hover = false;
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 260),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: _hover
                ? LinearGradient(colors: [Colors.cyanAccent, Colors.purpleAccent])
                : null,
            boxShadow: _hover
                ? [
                    BoxShadow(
                        color: Colors.cyanAccent.withOpacity(0.35),
                        blurRadius: 18,
                        spreadRadius: 2)
                  ]
                : [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.14),
                        blurRadius: 6,
                        spreadRadius: 0)
                  ],
          ),
          child: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.white.withOpacity(_hover ? 0.06 : 0.02),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Image.asset(widget.asset, fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}

/// Painter: animated gradient - smoothly cycling multi-stop gradient
class _AnimatedGradientPainter extends CustomPainter {
  final double t;
  _AnimatedGradientPainter(this.t);

  @override
  void paint(Canvas canvas, Size size) {
    // move the gradient with t
    final rect = Offset.zero & size;

    // base colors shifted by t
    final colorA = HSVColor.fromAHSV(1, (200 + t * 80) % 360, 0.7, 0.14).toColor();
    final colorB = HSVColor.fromAHSV(1, (260 + t * 60) % 360, 0.6, 0.12).toColor();
    final colorC = HSVColor.fromAHSV(1, (320 + t * 40) % 360, 0.55, 0.10).toColor();

    final gradient = LinearGradient(
      begin: Alignment(-0.8 + 1.6 * t, -1.0),
      end: Alignment(0.8 - 1.6 * t, 1.0),
      colors: [colorA, colorB, colorC],
      stops: const [0.0, 0.5, 1.0],
    );

    final paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);

    // add faint vignette
    final r = Rect.fromLTWH(0, 0, size.width, size.height);
    final shader = RadialGradient(
      colors: [Colors.transparent, Colors.black.withOpacity(0.25)],
      stops: [0.6, 1.0],
    ).createShader(r);
    canvas.drawRect(r, Paint()..shader = shader);
  }

  @override
  bool shouldRepaint(covariant _AnimatedGradientPainter oldDelegate) =>
      oldDelegate.t != t;
}

/// Painter: small moving glow particles
class _ParticlesPainter extends CustomPainter {
  final List<_Particle> particles;
  final double t; // 0..1
  _ParticlesPainter(this.particles, this.t);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    for (final p in particles) {
      // compute position shift
      final dx = (p.position.dx * size.width + sin(t * 2 * pi + p.hue) * 12 * p.baseSpeed * size.width) % size.width;
      final dy = (p.position.dy * size.height + cos(t * 2 * pi + p.hue) * 8 * p.baseSpeed * size.height) % size.height;
      final pos = Offset(dx, dy);

      // glow
      final color = HSVColor.fromAHSV(
              p.baseOpacity, (p.hue + t * 360) % 360, 0.8, 1.0)
          .toColor();
      paint.color = color.withOpacity(0.08);
      canvas.drawCircle(pos, p.size * 3.0, paint);

      paint.color = color.withOpacity(0.18);
      canvas.drawCircle(pos, p.size * 1.4, paint);

      paint.color = Colors.white.withOpacity(0.95);
      canvas.drawCircle(pos, p.size * 0.6, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlesPainter oldDelegate) => true;
}

class _Particle {
  Offset position;
  double size;
  double baseSpeed;
  double hue;
  double baseOpacity;
  _Particle({
    required this.position,
    required this.size,
    required this.baseSpeed,
    required this.hue,
    double? baseOpacity,
  }) : baseOpacity = baseOpacity ?? (0.6 + Random().nextDouble() * 0.4);
}

/// small fade + scale transition helper
class FadeScaleTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;
  const FadeScaleTransition({required this.animation, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final anim = CurvedAnimation(parent: animation, curve: Curves.easeOut);
    return AnimatedBuilder(
      animation: anim,
      builder: (context, _) {
        return Opacity(
          opacity: anim.value,
          child: Transform.scale(scale: 0.92 + 0.08 * anim.value, child: child),
        );
      },
    );
  }
}
