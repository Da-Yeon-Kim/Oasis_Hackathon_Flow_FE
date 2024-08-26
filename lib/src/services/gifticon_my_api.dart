import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/gifticon_model.dart';

class ApiService {
  final String baseUrl = "http://192.168.1.5:8000";

  Future<List<Gifticon>> fetchUserGifticons() async {
    final response = await http.get(Uri.parse('$baseUrl/my-gifticons/'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Gifticon.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load user gifticons');
    }
  }
}
