import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../services/api_service.dart';

class MileageScreen extends StatefulWidget {
  const MileageScreen({super.key});

  @override
  MileageScreenState createState() => MileageScreenState();
}

class MileageScreenState extends State<MileageScreen> {
  final ApiService _apiService = ApiService();
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
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              left: 29,
              top: 100,
              child: Text(
                '마일리지 조회',
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
              left: 29,
              top: 149,
              child: Container(
                width: 335,
                height: 160,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 3, color: Color(0xFFFFA40B)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFFF2D4A7),
                      blurRadius: 5,
                      offset: Offset(0, 5),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        '현재 마일리지 :   123,456 포인트 ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.26,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        '누적 마일리지 :   456,789 포인트 ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.26,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        '          이번 달 :    + 6,700 포인트 ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Noto Sans KR',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.26,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 47,
              top: 247,
              child: Container(
                width: 295,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFFFA40B),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 29,
              top: 327,
              child: Container(
                width: 335,
                height: 511,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 335,
                        height: 511,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 3, color: Color(0xFFFFA40B)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0xFFF2D4A7),
                              blurRadius: 5,
                              offset: Offset(0, 5),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          itemCount: _mileageEntries.length,
                          itemBuilder: (context, index) {
                            var entry = _mileageEntries[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                              child: ListTile(
                                title: Text('${entry['merchant_name']} - ${entry['amount']}원'),
                                subtitle: Text('적립된 마일리지: ${entry['mileage']}'),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
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
                            )
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
                        child: SvgPicture.asset('lib/src/assets/btn_search.svg'), // 이 부분에 적절한 로고 또는 아이콘을 넣을 수 있습니다.
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 48,
                      child: Container(
                        width: 45,
                        height: 45,
                        child: SvgPicture.asset('lib/src/assets/btn_return.svg'),
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
                child: SvgPicture.asset('lib/src/assets/btn_map.svg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
