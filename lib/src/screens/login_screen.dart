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

  // 목데이터 추가
  final Map<String, String> _mockUserData = {
    'test@example.com': 'password123',
  };
  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {

      // 목데이터 검증
      if (_mockUserData.containsKey(email) && _mockUserData[email] == password) {
        if (!mounted) return;

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('로그인'),
        backgroundColor: Colors.orangeAccent, // AppBar 색상 설정
      ),
      body: SingleChildScrollView( // 스크롤뷰 추가
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 중앙에 배치
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 200,
                color: Colors.grey[300],
                child: Center(
                  child: Text(
                    '다연아 이게 정녕 최선이었니',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Noto Sans KR',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              CustomTextField(
                controller: _emailController,
                labelText: '이메일',
                backgroundColor: Colors.orange[100], // 텍스트 필드 배경색 설정
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _passwordController,
                labelText: '비밀번호',
                obscureText: true,
                backgroundColor: Colors.orange[100], // 텍스트 필드 배경색 설정
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _signIn,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent, // 버튼 색상 설정
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  '로그인',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Noto Sans KR',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.orangeAccent, padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  '회원가입',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Noto Sans KR',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
