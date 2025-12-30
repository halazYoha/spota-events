class AppConstants {
  // App Information
  static const String appName = 'SPOTA';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Event Discovery App for Bahir Dar';

  // Design Constants
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 12.0;
  static const double defaultButtonHeight = 56.0;

  // Animation Durations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Duration splashDuration = Duration(seconds: 2);

  // Demo Data
  static const String demoOrganization = 'My Organization';
  static const String demoBio =
      'Passionate about creating amazing events for the Bahir Dar community.';

  // Validation Messages
  static const String emailRequired = 'Please enter your email';
  static const String validEmailRequired = 'Please enter a valid email';
  static const String passwordRequired = 'Please enter your password';
  static const String passwordMinLength =
      'Password must be at least 6 characters';
  static const String nameRequired = 'Please enter your name';
  static const String phoneRequired = 'Please enter your phone number';
  static const String organizationRequired = 'Please enter organization name';

  // Success Messages
  static const String loginSuccess = 'Logged in successfully';
  static const String signupSuccess = 'Account created successfully';
  static const String passwordResetSuccess = 'Password reset email sent';
  static const String profileUpdateSuccess = 'Profile updated successfully';
  static const String eventCreateSuccess = 'Event created successfully';
  static const String bookingSuccess = 'Booking confirmed successfully';

  // Error Messages
  static const String networkError =
      'Network error. Please check your connection';
  static const String unexpectedError = 'An unexpected error occurred';
  static const String invalidCredentials = 'Invalid email or password';
  static const String emailInUse = 'Email already in use';
}

class AssetPaths {
  static const String logo = 'assets/images/logo.png';
  static const String placeholderEvent = 'assets/images/placeholder_event.jpg';

  // Category icons
  static const String musicIcon = 'assets/icons/music.png';
  static const String sportsIcon = 'assets/icons/sports.png';
  static const String universityIcon = 'assets/icons/university.png';
  static const String culturalIcon = 'assets/icons/cultural.png';
}
