class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }

    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }

    // Ethiopian phone number validation (simple version)
    final phoneRegex = RegExp(r'^\+251[0-9]{9}$|^0[0-9]{9}$');

    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid Ethiopian phone number';
    }

    return null;
  }

  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter $fieldName';
    }

    return null;
  }

  static String? validateEventTitle(String? value) {
    return validateRequired(value, 'event title');
  }

  static String? validateEventDescription(String? value) {
    return validateRequired(value, 'event description');
  }

  static String? validateEventLocation(String? value) {
    return validateRequired(value, 'event location');
  }

  static String? validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter ticket price';
    }

    final price = double.tryParse(value);
    if (price == null || price < 0) {
      return 'Please enter a valid price';
    }

    return null;
  }

  static String? validateTicketCount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter number of tickets';
    }

    final count = int.tryParse(value);
    if (count == null || count <= 0) {
      return 'Please enter a valid number of tickets';
    }

    return null;
  }
}
