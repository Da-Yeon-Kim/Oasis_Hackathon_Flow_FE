import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      bool success = await _authService.login(email, password);
      if (!mounted) return;
      if (success) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('로그인 실패')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('모든 필드를 입력하세요')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경색을 흰색으로 설정
      appBar: AppBar(
        title: const Text('로그인'),
        backgroundColor: Colors.white, // AppBar의 배경색도 흰색으로 설정
        elevation: 0, // 그림자 제거
        iconTheme: const IconThemeData(color: Color(0xFFFDB132)), // 아이콘 색상 설정
        titleTextStyle: const TextStyle(
          color: Color(0xFFFDB132),
          fontSize: 20,
        ), // 제목 스타일 설정
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
            crossAxisAlignment: CrossAxisAlignment.center, // 중앙 정렬
            children: <Widget>[
              // 이메일 입력 필드
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: '이메일',
                    filled: true,
                    fillColor: const Color(0xFFF8E6C7), // 배경색 설정
                    prefixIcon: const Icon(Icons.email,
                        color: Color(0xFFFDB132)), // 아이콘 설정
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFFDB132)), // 기본 테두리 색상
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFFDB132)), // 비활성화 상태 테두리 색상
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFFDB132),
                          width: 2.0), // 포커스 상태 테두리 색상
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // 비밀번호 입력 필드
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                    filled: true,
                    fillColor: const Color(0xFFF8E6C7), // 배경색 설정
                    prefixIcon: const Icon(Icons.lock,
                        color: Color(0xFFFDB132)), // 아이콘 설정
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFFDB132)), // 기본 테두리 색상
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFFDB132)), // 비활성화 상태 테두리 색상
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFFDB132),
                          width: 2.0), // 포커스 상태 테두리 색상
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 12),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // 로그인 버튼
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: ElevatedButton(
                  onPressed: _signIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFDB132), // 버튼 색상 설정
                    padding:
                        const EdgeInsets.symmetric(vertical: 16), // 버튼 패딩 설정
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // 버튼 둥근 모서리
                    ),
                  ),
                  child: const Text('로그인',
                      style: TextStyle(color: Colors.white)), // 버튼 텍스트 스타일
                ),
              ),
              const SizedBox(height: 16),
              // OR 텍스트와 Divider
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'OR',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // 회원가입 버튼
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFDB132), // 버튼 색상 설정
                    padding:
                        const EdgeInsets.symmetric(vertical: 16), // 버튼 패딩 설정
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // 버튼 둥근 모서리
                    ),
                  ),
                  child: const Text('회원가입',
                      style: TextStyle(color: Colors.white)), // 버튼 텍스트 스타일
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
