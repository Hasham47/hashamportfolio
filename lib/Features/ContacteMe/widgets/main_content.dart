import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMainContent extends StatelessWidget {
  const ContactMainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Gradient
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Profile Image with Glow
              Center(
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Colors.cyanAccent, Colors.purpleAccent],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyanAccent.withOpacity(0.7),
                        blurRadius: 25,
                        spreadRadius: 4,
                      )
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage("assets/images/pro.jpg"),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Name + Tagline
              const Text(
                "Muhammad Hasham Khan",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Flutter Developer • Mobile Craftsman",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(height: 30),

              // Contact Options
              _buildContactCard(
                icon: Icons.chat_bubble_outline,
                title: "WhatsApp",
                subtitle: "Click to start a chat",
                onTap: () => _launchURL("https://wa.me/923336188148"),
              ),
              _buildContactCard(
                icon: Icons.email_outlined,
                title: "Email",
                subtitle: "durraani47@gmail.com",
                onTap: () => _launchURL("mailto:durraani47@gmail.com"),
              ),
              _buildContactCard(
                icon: Icons.phone_android,
                title: "Phone",
                subtitle: "+92 333 6188148",
                onTap: () => _launchURL("tel:+923336188148"),
              ),

              const SizedBox(height: 30),

              // 🔥 Extra: Experience / Skills cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _miniInfoCard("5+", "Years Exp."),
                  _miniInfoCard("30+", "Projects"),
                  _miniInfoCard("15+", "Happy Clients"),
                ],
              ),

              const SizedBox(height: 40),

              // Social Media
              const Text(
                "Connect with me",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 18,
                runSpacing: 12,
                children: [
                  _socialButton("assets/images/link.png",
                      () => _launchURL("https://linkedin.com")),
                  _socialButton("assets/images/github.png",
                      () => _launchURL("https://github.com")),
                  _socialButton("assets/images/youtube.png",
                      () => _launchURL("https://youtube.com")),
                  _socialButton("assets/images/insta.png",
                      () => _launchURL("https://instagram.com")),
                  _socialButton("assets/images/twitter.png",
                      () => _launchURL("https://twitter.com")),
                  _socialButton("assets/images/whatsapp.png",
                      () => _launchURL("https://wa.me/923336188148")),
                ],
              ),

              const SizedBox(height: 40),

              // Resume / CV Download Button
              ElevatedButton.icon(
                onPressed: () => _launchURL("https://yourdomain.com/cv.pdf"),
                icon: const Icon(Icons.download),
                label: const Text("Download CV"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  elevation: 6,
                  shadowColor: Colors.cyanAccent,
                ),
              ),

              const SizedBox(height: 50),

              // CTA Quote
              const Text(
                "“Let’s build something amazing together 🚀”",
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),

        // Floating WhatsApp Button
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () => _launchURL("https://wa.me/923336188148"),
            child: const Icon(Icons.facebook, size: 32, color: Colors.white),
          ),
        ),
      ],
    );
  }

  // Contact Card Widget
  static Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.05),
          border: Border.all(color: Colors.cyanAccent.withOpacity(0.6)),
          boxShadow: [
            BoxShadow(
              color: Colors.cyanAccent.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 2,
            )
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.cyanAccent, size: 32),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Mini Info Cards (Experience/Projects/Clients)
  static Widget _miniInfoCard(String value, String label) {
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.cyanAccent.withOpacity(0.4)),
      ),
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(label,
              style: const TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }

  // Social Button with Image
  static Widget _socialButton(String assetPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.white.withOpacity(0.08),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Image.asset(assetPath, fit: BoxFit.contain),
        ),
      ),
    );
  }

  // Open links, email, phone
  static Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }
}
