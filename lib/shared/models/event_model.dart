class Event {
  final String id;
  final String title;
  final String description;
  final String location;
  final DateTime date;
  final String imageUrl;
  final double price;
  final int availableTickets;
  final String category;
  final String organizer;

  const Event({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.date,
    required this.imageUrl,
    required this.price,
    required this.availableTickets,
    required this.category,
    required this.organizer,
  });

  // Sample data for development
  static List<Event> sampleEvents = [
    Event(
      id: '1',
      title: 'Bahir Dar Music Festival',
      description:
          'The biggest annual music festival featuring top artists from Ethiopia and beyond. Join us for an unforgettable night of music and entertainment.',
      location: 'City Stadium, Bahir Dar',
      date: DateTime(2024, 12, 15, 18, 0),
      imageUrl: 'assets/images/music_festival.jpg',
      price: 150.0,
      availableTickets: 87,
      category: 'Music',
      organizer: 'BDU Arts Club',
    ),
    Event(
      id: '2',
      title: 'BDU Tech Conference 2024',
      description:
          'Annual technology conference featuring workshops, keynote speakers, and networking opportunities for tech enthusiasts.',
      location: 'EiTEX Campus, Bahir Dar University',
      date: DateTime(2024, 11, 25, 9, 0),
      imageUrl: 'assets/images/tech_conference.jpg',
      price: 50.0,
      availableTickets: 45,
      category: 'University',
      organizer: 'Bahir Dar University',
    ),
    Event(
      id: '3',
      title: 'Lake Tana Boat Race',
      description:
          'Exciting boat racing competition on Lake Tana. Watch teams compete for the championship trophy.',
      location: 'Lake Tana, Bahir Dar',
      date: DateTime(2024, 12, 10, 8, 0),
      imageUrl: 'assets/images/boat_race.jpg',
      price: 25.0,
      availableTickets: 200,
      category: 'Sports',
      organizer: 'Bahir Dar Sports Club',
    ),
  ];
}
