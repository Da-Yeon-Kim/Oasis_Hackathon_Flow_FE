import 'package:flutter/material.dart';
import '../widgets/custom_navigation_bar.dart';
import '../widgets/custom_end_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      endDrawer: const CustomEndDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                '호우남 님\n방문을 환영합니다!',
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // 크기 줄임
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // 간격 줄임

              // 첫 번째 박스 (현재 마일리지)
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04), // 패딩 줄임
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFFFA40B), width: 2),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '현재 마일리지',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04, // 크기 줄임
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '123,456 포인트',
                            style: TextStyle(
                              fontSize: screenWidth * 0.045, // 크기 줄임
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Container(
                            height: 2,
                            color: const Color(0xFFFFA40B),
                            width: screenWidth * 0.4,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/mileage');
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                            vertical: screenHeight * 0.015,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '내역 보기',
                              style: TextStyle(
                                color: const Color(0xFFFFA40B),
                                fontSize: screenWidth * 0.04,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: const Color(0xFFFFA40B),
                              size: screenWidth * 0.04,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // 세 개의 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconButton(
                    context,
                    'lib/src/assets/giftcon.png',
                    screenWidth,
                  ),
                  _buildIconButton(
                    context,
                    'lib/src/assets/coupon.png',
                    screenWidth,
                  ),
                  _buildIconButton(
                    context,
                    'lib/src/assets/gift.png',
                    screenWidth,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),

              // 랭킹 섹션
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04), // 패딩 줄임
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '가장 많이 이용한 가게는?',
                      style: TextStyle(
                        fontSize: screenWidth * 0.045, // 크기 줄임
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    _buildRankingItem(
                        context, '1위', '근처떡볶이', screenWidth, screenHeight),
                    _buildDivider(),
                    _buildRankingItem(
                        context, '2위', '지금바리스타', screenWidth, screenHeight),
                    _buildDivider(),
                    _buildRankingItem(
                        context, '3위', '상무초밥', screenWidth, screenHeight),
                    SizedBox(height: screenHeight * 0.015),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          // 더보기 클릭 시 동작 추가
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '더보기',
                              style: TextStyle(
                                color: const Color(0xFFFFA40B),
                                fontSize: screenWidth * 0.04,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: const Color(0xFFFFA40B),
                              size: screenWidth * 0.06,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: null, // 아무것도 선택되지 않은 상태로 유지
        scaffoldKey: _scaffoldKey,
        isMapScreen: false, // 홈 화면이므로 false
      ),
    );
  }

  Widget _buildIconButton(
      BuildContext context, String assetPath, double screenWidth) {
    return Container(
      width: screenWidth * 0.30, // 버튼 크기 키움
      height: screenWidth * 0.30, // 버튼 크기 키움
      padding: EdgeInsets.all(screenWidth * 0.02), // 패딩 추가
      child: Image.asset(
        assetPath,
        fit: BoxFit.contain, // 이미지가 잘리지 않도록 조정
      ),
    );
  }

  Widget _buildRankingItem(BuildContext context, String rank, String storeName,
      double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
      child: Row(
        children: [
          Text(
            rank,
            style: TextStyle(
              fontSize: screenWidth * 0.04, // 크기 줄임
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: Text(
              storeName,
              style: TextStyle(
                fontSize: screenWidth * 0.04, // 크기 줄임
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: const Color(0xFFFFA40B),
      thickness: 1,
      height: 20,
    );
  }
}
