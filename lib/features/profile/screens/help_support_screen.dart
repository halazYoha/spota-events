import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHelpTile(
            icon: Icons.question_answer,
            title: 'FAQs',
            onTap: () {},
          ),
          _buildHelpTile(
            icon: Icons.mail,
            title: 'Contact Us',
            onTap: () {},
          ),
          _buildHelpTile(
            icon: Icons.policy,
            title: 'Legal Information',
            onTap: () {},
          ),
          const SizedBox(height: 32),
          const Center(
            child: Text(
              'Need more help?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              'support@spotaevents.com',
              style: TextStyle(color: Color(0xFF2563EB)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF2563EB)),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
