import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'http://192.168.1.5:8000';
  final storage = const FlutterSecureStorage();

  Future<bool> registerCard(String userId, String cardNumber, String cardExpiry,
      String cardCVC) async {
    final response = await http.post(
      Uri.parse('$baseUrl/cards/register/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${await _getToken()}',
      },
      body: jsonEncode(<String, String>{
        'user_id': userId,
        'card_number': cardNumber,
        'card_expiry': cardExpiry,
        'card_cvc': cardCVC,
      }),
    );

    return response.statusCode == 201;
  }

  Future<List<dynamic>> fetchTransactions(String userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/cards/$userId/transactions/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${await _getToken()}',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return [];
    }
  }

  Future<List<dynamic>> fetchMileage(String userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/mileage/$userId/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${await _getToken()}',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return [];
    }
  }

  Future<String?> _getToken() async {
    return await storage.read(key: 'jwt');
  }
}
