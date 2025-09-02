
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.cyanAccent.withOpacity(0.6)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Your Name",
                labelStyle: TextStyle(color: Colors.cyanAccent),
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  value!.isEmpty ? "Please enter your name" : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _emailController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Your Email",
                labelStyle: TextStyle(color: Colors.cyanAccent),
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  value!.isEmpty ? "Please enter your email" : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _messageController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Your Message",
                labelStyle: TextStyle(color: Colors.cyanAccent),
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
              validator: (value) =>
                  value!.isEmpty ? "Please enter your message" : null,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Here you can connect to EmailJS / Firebase / API
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Message sent! 🚀")),
                  );
                }
              },
              icon: const Icon(Icons.send),
              label: const Text("Send"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyanAccent,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
