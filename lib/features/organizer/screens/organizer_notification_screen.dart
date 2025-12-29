import 'package:flutter/material.dart';

class OrganizerNotificationsScreen extends StatelessWidget {
  const OrganizerNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Organizer Notifications'),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNotificationItem(
            title: 'New Booking!',
            message:
                'Someone just booked 2 tickets for "Bahir Dar Music Festival".',
            time: '10 mins ago',
            isUnread: true,
            icon: Icons.add_shopping_cart,
            color: Colors.blue,
          ),
          _buildNotificationItem(
            title: 'Revenue Milestone',
            message:
                'Your total revenue for this month has reached 25,000 ETB.',
            time: '1 hour ago',
            isUnread: true,
            icon: Icons.account_balance_wallet,
            color: Colors.green,
          ),
          _buildNotificationItem(
            title: 'Event Approved',
            message:
                'Your event "Sunday Jazz Night" has been approved and is now live.',
            time: '3 hours ago',
            isUnread: false,
            icon: Icons.check_circle,
            color: Colors.green,
          ),
          _buildNotificationItem(
            title: 'New Review',
            message:
                'A user left a 5-star review for your past event "Tech Workshop".',
            time: '5 hours ago',
            isUnread: false,
            icon: Icons.star,
            color: Colors.orange,
          ),
          _buildNotificationItem(
            title: 'System Update',
            message:
                'New features have been added to the organizer dashboard. Check them out!',
            time: '1 day ago',
            isUnread: false,
            icon: Icons.info,
            color: Colors.blueGrey,
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
