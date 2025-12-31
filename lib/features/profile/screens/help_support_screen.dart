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
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildFAQItem(
            'How do I book a ticket?',
            'Find an event you like, tap on it, select the number of tickets, and click "Book Tickets". You will then proceed to payment.',
          ),
          _buildFAQItem(
            'Where can I find my tickets?',
            'You can find all your booked tickets in the "My Tickets" tab on the home screen.',
          ),
          _buildFAQItem(
            'How do I create an event?',
            'If you are an organizer, go to your dashboard and tap on "Create Event" or the "+" icon.',
          ),
          _buildFAQItem(
            'Is the payment secure?',
            'Yes, all payments are processed through secure gateways like Chapa.',
          ),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),
          const Text(
            'Contact Us',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'If you have any questions or need further assistance, please feel free to reach out to our support team.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF2563EB).withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border:
                  Border.all(color: const Color(0xFF2563EB).withOpacity(0.1)),
            ),
            child: const Row(
              children: [
                Icon(Icons.email_outlined, color: Color(0xFF2563EB)),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Support Email',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      'abukaaddisu@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2563EB),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Text(
            answer,
            style: TextStyle(color: Colors.grey[600], height: 1.5),
          ),
        ),
      ],
    );
  }
}