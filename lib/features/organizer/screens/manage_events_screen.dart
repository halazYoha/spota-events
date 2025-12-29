import 'package:flutter/material.dart';
import 'package:spota_events/shared/models/event_model.dart';

class ManageEventsScreen extends StatefulWidget {
  const ManageEventsScreen({super.key});

  @override
  State<ManageEventsScreen> createState() => _ManageEventsScreenState();
}

class _ManageEventsScreenState extends State<ManageEventsScreen> {
  // Sample organizer events
  List<Event> organizerEvents = [
    Event(
      id: '1',
      title: 'Bahir Dar Music Festival',
      description:
          'The biggest annual music festival in Bahir Dar featuring top artists from around the country.',
      location: 'City Stadium, Bahir Dar',
      date: DateTime(2024, 12, 15, 18, 0),
      imageUrl: 'assets/images/music_festival.jpg',
      price: 150.0,
      availableTickets: 87,
      category: 'Music',
      organizer: 'My Organization',
    ),
    Event(
      id: '2',
      title: 'Tech Workshop Series',
      description:
          'Learn latest technologies including Flutter, AI, and Web Development.',
      location: 'EiTEX Campus, Bahir Dar University',
      date: DateTime(2024, 11, 30, 10, 0),
      imageUrl: 'assets/images/tech_workshop.jpg',
      price: 50.0,
      availableTickets: 45,
      category: 'University',
      organizer: 'My Organization',
    ),
    Event(
      id: '3',
      title: 'Cultural Night 2024',
      description:
          'Experience diverse cultures through music, dance, and traditional food.',
      location: 'Cultural Center, Bahir Dar',
      date: DateTime(2024, 10, 20, 19, 0),
      imageUrl: 'assets/images/cultural_night.jpg',
      price: 75.0,
      availableTickets: 23,
      category: 'Cultural',
      organizer: 'My Organization',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final totalTicketsSold = organizerEvents.fold(
        0, (sum, event) => sum + (100 - event.availableTickets));
    final totalRevenue = organizerEvents.fold(0.0,
        (sum, event) => sum + (event.price * (100 - event.availableTickets)));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Events'),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Overview - Cleaner version
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatCard(
                        value: '${organizerEvents.length}',
                        label: 'Events',
                        icon: Icons.event,
                        color: Colors.blue,
                      ),
                      _buildStatCard(
                        value: '$totalTicketsSold',
                        label: 'Sold',
                        icon: Icons.confirmation_number,
                        color: Colors.green,
                      ),
                      _buildStatCard(
                        value: '${totalRevenue.toInt()}',
                        label: 'Revenue',
                        icon: Icons.monetization_on,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Events List Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your Events',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${organizerEvents.length} total',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // Events List
            organizerEvents.isEmpty
                ? Container(
                    height: 300,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.event_available,
                          size: 64,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'No events yet',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Create your first event to get started',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: organizerEvents
                          .map((event) => _buildEventCard(event, context))
                          .toList(),
                    ),
                  ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String value,
    required String label,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 20, color: color),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(Event event, BuildContext context) {
    final ticketsSold = 100 - event.availableTickets;
    final progress = ticketsSold / 100;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Event Image or Icon
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFF2563EB).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child:
                    const Icon(Icons.event, color: Color(0xFF2563EB), size: 30),
              ),
              const SizedBox(width: 16),
              // Event Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${event.date.day}/${event.date.month}/${event.date.year} • ${event.location.split(',').first}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              // Actions & Status
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => _editEvent(event),
                    icon: const Icon(Icons.edit_outlined,
                        size: 20, color: Color(0xFF2563EB)),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Active',
                      style: TextStyle(
                        color: Color(0xFF10B981),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Progress & Revenue (Unified, no divider)
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$ticketsSold / 100 Tickets Sold',
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${(progress * 100).toInt()}%',
                          style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2563EB)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 6,
                        backgroundColor: Colors.grey[100],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFF2563EB)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Revenue',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${(event.price * ticketsSold).toInt()} ETB',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF10B981),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _editEvent(Event event) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Editing: ${event.title}'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
