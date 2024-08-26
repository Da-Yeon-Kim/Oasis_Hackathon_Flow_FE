import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://192.168.1.5:8000';
  Future<bool> registerCard(String userId, String cardNumber, String expiryDate, String cvc) async {
    final url = Uri.parse('$baseUrl/register-card/');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'user_id': userId,
        'card_number': cardNumber,
        'expiry_date': expiryDate,
        'cvc': cvc,
      }),
    );

    if (response.statusCode == 201) {
      // 성공적으로 카드가 등록됨
      return true;
    } else {
      // 등록 실패
      print('Failed to register card: ${response.body}');
      return false;
    }
  }
}