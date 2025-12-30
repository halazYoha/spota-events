import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNotificationItem(
            title: 'Booking Confirmed!',
            message:
                'Your tickets for "Tana Music Festival" have been confirmed.',
            time: '2 hours ago',
            isUnread: true,
            icon: Icons.confirmation_number,
            color: Colors.green,
          ),
          _buildNotificationItem(
            title: 'Event Reminder',
            message: 'Bahir Dar Cultural Night starts in 1 hour.',
            time: '5 hours ago',
            isUnread: true,
            icon: Icons.event,
            color: Colors.orange,
          ),
          _buildNotificationItem(
            title: 'New Event Nearby',
            message: 'Check out "Tech Meetup" happening near you this weekend.',
            time: '1 day ago',
            isUnread: false,
            icon: Icons.location_on,
            color: Colors.blue,
          ),
          _buildNotificationItem(
            title: 'Payment Successful',
            message: 'Payment of 500 ETB for "Art Exhibition" was successful.',
            time: '2 days ago',
            isUnread: false,
            icon: Icons.payment,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String message,
    required String time,
    required bool isUnread,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUnread ? Colors.blue[50] : Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border:
            isUnread ? Border.all(color: Colors.blue.withOpacity(0.3)) : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              isUnread ? FontWeight.bold : FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          if (isUnread)
            Container(
              margin: const EdgeInsets.only(left: 8, top: 4),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
