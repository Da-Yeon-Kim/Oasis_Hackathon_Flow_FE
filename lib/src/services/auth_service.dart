import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';

class AuthService {
  final String baseUrl = 'http://192.168.1.5:8000';
  final storage = const FlutterSecureStorage();
  final logger = Logger(); // 로거 인스턴스 생성

  // 로그인 메서드
  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/token/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      await storage.write(key: 'jwt', value: data['token']);
      return true;
    } else {
      logger.e('로그인 실패: ${response.statusCode}');
      return false;
    }
  }

  // 회원가입 메서드
  Future<bool> register(String nickname, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nickname': nickname,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      await storage.write(key: 'jwt', value: data['token']); // 회원가입 후 JWT 저장
      return true;
    } else {
      logger.e('회원가입 실패: ${response.statusCode}');
      return false;
    }
  }

  // JWT를 이용한 인증된 요청 예제
  Future<void> fetchUserData() async {
    final token = await storage.read(key: 'jwt');
    if (token == null) {
      throw Exception('JWT 토큰이 존재하지 않습니다.');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/api/auth/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      logger.i('사용자 데이터: ${response.body}');
    } else {
      logger.e('사용자 데이터 가져오기 실패: ${response.statusCode}');
    }
  }

  // 로그아웃 메서드 (JWT 삭제)
  Future<void> logout() async {
    await storage.delete(key: 'jwt');
  }
}
