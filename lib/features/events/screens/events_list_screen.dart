import 'package:flutter/material.dart';
import 'package:spota_events/shared/models/event_model.dart';
import 'package:spota_events/features/events/screens/event_details_screen.dart';
import 'package:spota_events/features/events/widgets/category_chip.dart';
import 'package:spota_events/features/events/widgets/event_card.dart';

class EventsListScreen extends StatefulWidget {
  final String category;

  const EventsListScreen({super.key, required this.category});

  @override
  State<EventsListScreen> createState() => _EventsListScreenState();
}

class _EventsListScreenState extends State<EventsListScreen> {
  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.category;
  }

  List<Event> get filteredEvents {
    if (selectedCategory == 'All') {
      return Event.sampleEvents;
    }
    return Event.sampleEvents
        .where((event) => event.category == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('${widget.category} Events'),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Categories Filter
          Container(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: ['All', 'Music', 'Sports', 'University', 'Cultural']
                    .map((category) {
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
          ),

          // Events List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: filteredEvents.map((event) {
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
          ),
        ],
      ),
    );
  }
}
