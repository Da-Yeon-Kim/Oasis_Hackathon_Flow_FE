import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/custom_text_field.dart';

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
      // 서버와의 통신 부분을 주석 처리하고 mock 데이터를 사용
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
      appBar: AppBar(
        title: const Text('로그인'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomTextField(
              controller: _emailController,
              labelText: '이메일',
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _passwordController,
              labelText: '비밀번호',
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _signIn,
              child: const Text(
                  '회원가입',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Noto Sans KR',
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 1.40,
              ),),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text(
                  '회원가입',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Noto Sans KR',
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 1.40,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
