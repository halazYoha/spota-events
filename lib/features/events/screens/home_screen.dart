import 'package:flutter/material.dart';
import 'package:spota_events/shared/models/event_model.dart';
import 'package:spota_events/features/events/screens/event_details_screen.dart';
import 'package:spota_events/features/events/widgets/category_chip.dart';
import 'package:spota_events/features/events/widgets/event_card.dart';
import 'package:spota_events/features/booking/screens/my_tickets_screen.dart'; // Add this import
import 'package:spota_events/features/profile/screens/profile_screen.dart'; // Add this import
import 'package:spota_events/features/profile/screens/notifications_screen.dart'; // Add this import

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';
  final List<String> categories = [
    'All',
    'Music',
    'Sports',
    'University',
    'Cultural'
  ];

  int _currentIndex = 0; // Add this to track current tab

  // Add this method to handle navigation
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navigate to different screens based on the tab
    if (index == 1) {
      // My Tickets tab
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyTicketsScreen()),
      ).then((_) {
        // When returning from My Tickets, reset to Home tab
        setState(() {
          _currentIndex = 0;
        });
      });
    } else if (index == 2) {
      // Profile tab
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      ).then((_) {
        // When returning from Profile, reset to Home tab
        setState(() {
          _currentIndex = 0;
        });
      });
    }
    // Index 0 is Home, so we don't navigate away
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('SPOTA'),
        backgroundColor: const Color.fromARGB(255, 99, 146, 249),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Text
            const Text(
              'Discover Events',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Find your vibe in Bahir Dar',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),

            const SizedBox(height: 24),

            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search events...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey[500]),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Categories
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: categories.map((category) {
                  return CategoryChip(
                    label: category,
                    isSelected: selectedCategory == category,
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 24),

            // Featured Events
            const Text(
              'Featured Events',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),

            // Events List
            Column(
              children: Event.sampleEvents.map((event) {
                return EventCard(
                  event: event,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventDetailsScreen(event: event),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF2563EB),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'My Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
