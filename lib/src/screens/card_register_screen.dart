import 'package:flutter/material.dart';

class CardRecognizerScreen extends StatefulWidget {
  @override
  State<CardRecognizerScreen> createState() => _CardRecognizerViewState();
}

class _CardRecognizerViewState extends State<CardRecognizerScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              left: 29,
              top: 112,
              child: Text(
                '카드 등록',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 28,
                  fontFamily: 'Noto Sans KR',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.96,
                ),
              ),
            ),
            Positioned(
              left: 37,
              top: 64,
              child: Container(
                width: 16,
                height: 33,
                child: FlutterLogo(),
              ),
            ),
            Positioned(
              left: 0,
              top: 743,
              child: Container(
                width: 393,
                height: 109,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 26,
                      child: Container(
                        width: 393,
                        height: 83,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF8E6C7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 20,
                              offset: Offset(0, -10),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 155,
                      top: 0,
                      child: Container(
                        width: 83,
                        height: 83,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: OvalBorder(
                            side: BorderSide(width: 3, color: Color(0xFFFACC7F)),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: FlutterLogo(), // 이 부분에 적절한 로고 또는 아이콘을 넣을 수 있습니다.
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 48,
                      child: Container(
                        width: 45,
                        height: 45,
                        child: FlutterLogo(),
                      ),
                    ),
                    Positioned(
                      left: 328,
                      top: 43,
                      child: Container(
                        width: 53,
                        height: 53,
                        padding: const EdgeInsets.symmetric(horizontal: 4.42, vertical: 11.04),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // 여기에 추가 요소가 필요하다면 추가 가능
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 155,
              top: 743,
              child: Container(
                width: 83,
                height: 83,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: FlutterLogo(),
              ),
            ),
            Positioned.fill(
              top: 180,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _cardNumberController,
                      decoration: const InputDecoration(
                        labelText: '카드 번호',
                        filled: true,
                        fillColor: Colors.white70,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _expiryDateController,
                      decoration: const InputDecoration(
                        labelText: '유효기간 (MM/YY)',
                        filled: true,
                        fillColor: Colors.white70,
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _cvcController,
                      decoration: const InputDecoration(
                        labelText: 'CVC',
                        filled: true,
                        fillColor: Colors.white70,
                      ),
                      obscureText: true,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _registerCard,
                      child: const Text('카드 등록'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _registerCard() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('카드 등록이 완료되었습니다.')),
    );
  }
}

