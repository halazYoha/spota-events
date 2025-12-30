class AppRoutes {
  // Auth Routes
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';

  // Attendee Routes
  static const String home = '/home';
  static const String eventDetails = '/event-details';
  static const String eventsList = '/events-list';
  static const String booking = '/booking';
  static const String bookingConfirmation = '/booking-confirmation';
  static const String myTickets = '/my-tickets';
  static const String profile = '/profile';

  // Organizer Routes
  static const String organizerDashboard = '/organizer-dashboard';
  static const String createEvent = '/create-event';
  static const String manageEvents = '/manage-events';

  // Route names for easy reference
  static const Map<String, String> routeNames = {
    splash: 'Splash',
    login: 'Login',
    signup: 'Signup',
    forgotPassword: 'Forgot Password',
    home: 'Home',
    eventDetails: 'Event Details',
    eventsList: 'Events List',
    booking: 'Booking',
    bookingConfirmation: 'Booking Confirmation',
    myTickets: 'My Tickets',
    profile: 'Profile',
    organizerDashboard: 'Organizer Dashboard',
    createEvent: 'Create Event',
    manageEvents: 'Manage Events',
  };
}
