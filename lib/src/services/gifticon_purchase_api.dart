import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = "http://192.168.1.5:8000";

  Future<String> purchaseGifticon(int gifticonId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/purchase/'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'gifticon_id': gifticonId,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return data['barcode'];
    } else if (response.statusCode == 400) {
      throw Exception('Not enough mileage');
    } else {
      throw Exception('Failed to purchase gifticon');
    }
  }
}
