import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class AfroMessageService {
  // TODO: Move to environment variables
  static const String _baseUrl = 'https://api.afromessage.com/api/send';
  static const String _apiKey = 'YOUR_AFROMESSAGE_API_KEY'; // Placeholder
  static const String _senderName = 'SPOTA'; // Must be registered with AfroMessage

  /// Send ticket SMS
  Future<bool> sendTicketSMS({
    required String phoneNumber,
    required String eventTitle,
    required String ticketCode,
    required int ticketCount,
  }) async {
    try {
      // Format phone number to international format if needed (e.g., 09... to +2519...)
      // AfroMessage usually handles various formats, but +251 is safest.
      String formattedPhone = phoneNumber;
      if (formattedPhone.startsWith('0')) {
        formattedPhone = '+251${formattedPhone.substring(1)}';
      }

      final message = 'Your booking for $eventTitle is confirmed!\n'
          'Tickets: $ticketCount\n'
          'Code: $ticketCode\n'
          'Show this code at the entrance.\n'
          'Thank you for using SPOTA!';

      final url = Uri.parse(_baseUrl);
      
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'to': formattedPhone,
          'message': message,
          'sender': _senderName,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['status'] == 'success' || data['acknowledge'] == 'success';
      }
      
      debugPrint('AfroMessage Error: ${response.body}');
      return false;
    } catch (e) {
      debugPrint('AfroMessage Service Error: $e');
      return false;
    }
  }
}
