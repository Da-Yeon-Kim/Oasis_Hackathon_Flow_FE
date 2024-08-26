import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/custom_navigation_bar.dart';

class MileageScreen extends StatefulWidget {
  const MileageScreen({super.key});

  @override
  MileageScreenState createState() => MileageScreenState();
}

class MileageScreenState extends State<MileageScreen> {
  final ApiService _apiService = ApiService();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> _mileageEntries = [];

  @override
  void initState() {
    super.initState();
    _fetchMileage();
  }

  void _fetchMileage() async {
    String userId = '1'; // 실제로는 로그인한 사용자의 ID를 사용
    List<dynamic> mileageEntries = await _apiService.fetchMileage(userId);
    if (!mounted) return; // mounted 체크 추가

    setState(() {
      _mileageEntries = mileageEntries;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white, // 기본 배경색을 하얀색으로 설정
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '마일리지 조회',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: screenWidth * 0.06,
                      fontFamily: 'Noto Sans KR',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.96,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: Color(0xFFFFA40B)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0xFFF2D4A7),
                          blurRadius: 5,
                          offset: Offset(0, 5),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '현재 마일리지 :   123,456 포인트',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.04,
                            fontFamily: 'Noto Sans KR',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.26,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          '누적 마일리지 :   456,789 포인트',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.04,
                            fontFamily: 'Noto Sans KR',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.26,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Divider(
                          color: Color(0xFFFFA40B),
                          thickness: 1,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          '이번 달 :   + 6,700 포인트',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.04,
                            fontFamily: 'Noto Sans KR',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.26,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: Color(0xFFFFA40B)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0xFFF2D4A7),
                          blurRadius: 5,
                          offset: Offset(0, 5),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_left,
                                color: Colors.grey,
                                size: 40), // 더 큰 삼각형과 회색으로 변경
                            SizedBox(width: 8),
                            Text(
                              '8월',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: screenWidth * 0.045,
                                fontFamily: 'Noto Sans KR',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_right,
                                color: Colors.grey,
                                size: 40), // 더 큰 삼각형과 회색으로 변경
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.03), // 원형 차트와 간격을 더 줌
                        Center(
                          child: Container(
                            height: screenWidth * 0.3, // 더 작은 원형 차트 크기
                            width: screenWidth * 0.3,
                            child: CustomPaint(
                              painter: DonutChartPainter(),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.03), // 왼쪽 마진 증가
                          child: Text(
                            '8월 1일',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.035, // 작은 글씨 크기
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        _buildExampleEntries(screenWidth, '8월 1일'),
                        SizedBox(height: screenHeight * 0.02),
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.03), // 왼쪽 마진 증가
                          child: Text(
                            '8월 2일',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.035, // 작은 글씨 크기
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        _buildExampleEntries(screenWidth, '8월 2일'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomNavigationBar(
              selectedIndex: 1,
              scaffoldKey: _scaffoldKey,
              isMapScreen: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExampleEntries(double screenWidth, String date) {
    List<Map<String, String>> entries = [];

    if (date == '8월 1일') {
      entries = [
        {
          'time': '11:35',
          'name': '국밥집',
          'amount': '+500원',
          'iconColor': '0xFF77B3F6'
        },
        {
          'time': '18:47',
          'name': '기프티콘',
          'amount': '-10,000원',
          'iconColor': '0xFF9DC7F6'
        },
        {
          'time': '19:53',
          'name': '차돌박이',
          'amount': '+400원',
          'iconColor': '0xFFD0E2F6'
        },
      ];
    } else if (date == '8월 2일') {
      entries = [
        {
          'time': '10:29',
          'name': '여기카페',
          'amount': '+200원',
          'iconColor': '0xFFFFA07A'
        },
        {
          'time': '12:42',
          'name': '아기자기소품샵',
          'amount': '+100원',
          'iconColor': '0xFF20B2AA'
        },
        {
          'time': '15:34',
          'name': '와이마트',
          'amount': '+400원',
          'iconColor': '0xFFB0C4DE'
        },
      ];
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.circle,
                        color: Color(int.parse(entry['iconColor']!)),
                        size: screenWidth * 0.04), // 아이콘 색상 변경
                    SizedBox(width: 16), // 시간과 이름 사이의 간격 확대
                    Text(
                      '${entry['time']}  ${entry['name']}',
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                  ],
                ),
                Text(
                  entry['amount']!,
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30.0; // 차트 두께를 두껍게 조정

    // 식비 70%
    paint.color = Color(0xFF77B3F6);
    canvas.drawArc(
      Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height),
      -1.5,
      2 * 3.14 * 0.7,
      false,
      paint,
    );

    // 잡화 20%
    paint.color = Color(0xFF9DC7F6);
    canvas.drawArc(
      Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height),
      -1.5 + 2 * 3.14 * 0.7,
      2 * 3.14 * 0.2,
      false,
      paint,
    );

    // 기타 10%
    paint.color = Color(0xFFD0E2F6);
    canvas.drawArc(
      Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height),
      -1.5 + 2 * 3.14 * 0.9,
      2 * 3.14 * 0.1,
      false,
      paint,
    );

    // 항목 이름 표시
    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.text = TextSpan(
      text: '식비',
      style: TextStyle(color: Color(0xFF77B3F6), fontSize: 14),
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        size.width / 2 - textPainter.width / 2,
        size.height / 2 - size.width * 0.35,
      ),
    );

    textPainter.text = TextSpan(
      text: '잡화',
      style: TextStyle(color: Color(0xFF9DC7F6), fontSize: 14),
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        size.width / 2 + size.width * 0.25 - textPainter.width / 2,
        size.height / 2 + size.height * 0.1,
      ),
    );

    textPainter.text = TextSpan(
      text: '기타',
      style: TextStyle(color: Color(0xFFD0E2F6), fontSize: 14),
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        size.width / 2 - size.width * 0.35 - textPainter.width / 2,
        size.height / 2 + size.height * 0.1,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
