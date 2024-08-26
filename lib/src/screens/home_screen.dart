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
      endDrawer: const CustomEndDrawer(),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              _buildProfileImage(screenWidth, screenHeight),
              _buildWelcomeText(screenWidth, screenHeight),
              _buildMileageBox(screenWidth, screenHeight),
              _buildMileageText(screenWidth, screenHeight),
              _buildViewDetailsButton(screenWidth, screenHeight),
              _buildPointsText(screenWidth, screenHeight),
              _buildTopUsedShops(screenWidth, screenHeight),
              _buildMoreButton(screenWidth, screenHeight),
              _buildGiftOptions(screenWidth, screenHeight),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: null,
        scaffoldKey: _scaffoldKey,
        isMapScreen: false,
      ),
    );
  }

  Positioned _buildProfileImage(double screenWidth, double screenHeight) {
    return Positioned(
      left: screenWidth * 0.68,
      top: screenHeight * 0.1,
      child: Container(
        width: screenWidth * 0.18,
        height: screenHeight * 0.085,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://via.placeholder.com/69x73"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Positioned _buildWelcomeText(double screenWidth, double screenHeight) {
    return Positioned(
      left: screenWidth * 0.1,
      top: screenHeight * 0.11,
      child: Text(
        'Test User님 \n방문을 환영합니다!',
        style: TextStyle(
          color: Colors.black,
          fontSize: screenWidth * 0.05,
          fontFamily: 'Noto Sans KR',
          fontWeight: FontWeight.w500,
          height: 1.5,
          letterSpacing: 1.4,
        ),
      ),
    );
  }

  Positioned _buildMileageBox(double screenWidth, double screenHeight) {
    return Positioned(
      left: screenWidth * 0.075,
      top: screenHeight * 0.2,
      child: Container(
        width: screenWidth * 0.85,
        height: screenHeight * 0.19,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 3, color: Color(0xFFFFA40B)),
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0xFFF2D4A7),
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _buildMileageText(double screenWidth, double screenHeight) {
    return Positioned(
      left: screenWidth * 0.13,
      top: screenHeight * 0.22,
      child: Text(
        '현재 마일리지',
        style: TextStyle(
          color: Colors.black,
          fontSize: screenWidth * 0.05,
          fontFamily: 'Noto Sans KR',
          fontWeight: FontWeight.w500,
          height: 1.5,
          letterSpacing: 1.4,
        ),
      ),
    );
  }

  Positioned _buildViewDetailsButton(double screenWidth, double screenHeight) {
    return Positioned(
      left: screenWidth * 0.65,
      top: screenHeight * 0.33,
      child: Container(
        width: screenWidth * 0.2,
        height: screenHeight * 0.03,
        padding: const EdgeInsets.only(right: 2),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '내역 보기',
              style: TextStyle(
                color: const Color(0xFFFFA40B),
                fontSize: screenWidth * 0.04,
                fontFamily: 'Noto Sans KR',
                fontWeight: FontWeight.w500,
                letterSpacing: 1.05,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _buildPointsText(double screenWidth, double screenHeight) {
    return Positioned(
      left: screenWidth * 0.32,
      top: screenHeight * 0.27,
      child: Container(
        width: screenWidth * 0.53,
        height: screenHeight * 0.04,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: screenHeight * 0.038,
              child: Container(
                width: screenWidth * 0.53,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFFF0B45A),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: -7,
              child: Text(
                '123,456 포인트',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.07,
                  fontFamily: 'Noto Sans KR',
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  letterSpacing: 1.96,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _buildTopUsedShops(double screenWidth, double screenHeight) {
    return Positioned(
      left: screenWidth * 0.075,
      top: screenHeight * 0.57,
      child: Container(
        width: screenWidth * 0.85,
        height: screenHeight * 0.26,
        child: Stack(
          children: [
            _buildShopRankText(screenWidth, screenHeight, 0.08, '1위', '○○ 떡볶이'),
            _buildShopRankText(screenWidth, screenHeight, 0.17, '2위', '△△ 바리스타'),
            _buildShopRankText(screenWidth, screenHeight, 0.25, '3위', '□□ 초밥 '),
            Positioned(
              left: screenWidth * 0.01,
              top: 0,
              child: Text(
                '가장 많이 이용한 가게는?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.05,
                  fontFamily: 'Noto Sans KR',
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  letterSpacing: 1.4,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: screenHeight * 0.044,
              child: Container(
                width: screenWidth * 0.85,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 2,
                      color: Color(0xFFF0B45A),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.045,
              top: screenHeight * 0.15,
              child: Container(
                width: screenWidth * 0.8,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1.50,
                      color: Color(0xFFF8DDAF),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _buildShopRankText(double screenWidth, double screenHeight,
      double topPosition, String rank, String shopName) {
    return Positioned(
      left: screenWidth * 0.11,
      top: screenHeight * topPosition,
      child: Row(
        children: [
          Text(
            rank,
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth * 0.055,
              fontFamily: 'Noto Sans KR',
              fontWeight: FontWeight.w500,
              height: 1.5,
              letterSpacing: 1.54,
            ),
          ),
          SizedBox(width: screenWidth * 0.25),
          Text(
            shopName,
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth * 0.055,
              fontFamily: 'Noto Sans KR',
              fontWeight: FontWeight.w500,
              height: 1.5,
              letterSpacing: 1.54,
            ),
          ),
        ],
      ),
    );
  }

  Positioned _buildMoreButton(double screenWidth, double screenHeight) {
    return Positioned(
      left: screenWidth * 0.74,
      top: screenHeight * 0.82,
      child: Container(
        width: screenWidth * 0.18,
        height: screenHeight * 0.03,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 3,
              child: Container(
                width: screenWidth * 0.05,
                height: screenHeight * 0.022,
                decoration: ShapeDecoration(
                  color: const Color(0x00D9D9D9),
                  shape: OvalBorder(
                    side: BorderSide(width: 1, color: Color(0xFFFFA40B)),
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.07,
              top: 0,
              child: Text(
                '더보기',
                style: TextStyle(
                  color: const Color(0xFFFFA40B),
                  fontSize: screenWidth * 0.04,
                  fontFamily: 'Noto Sans KR',
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  letterSpacing: 1.05,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _buildGiftOptions(double screenWidth, double screenHeight) {
    return Positioned(
      left: screenWidth * 0.075,
      top: screenHeight * 0.4,
      child: Container(
        width: screenWidth * 0.85,
        height: screenHeight * 0.15,
        child: Stack(
          children: [
            _buildGiftOption(screenWidth, screenHeight, 0.57, '선물하기'),
            _buildGiftOption(screenWidth, screenHeight, 0.285, '제휴 쿠폰'),
            _buildGiftOption(screenWidth, screenHeight, 0, '기프티콘'),
          ],
        ),
      ),
    );
  }

  Positioned _buildGiftOption(
      double screenWidth, double screenHeight, double leftPosition, String label) {
    return Positioned(
      left: screenWidth * leftPosition,
      top: 0,
      child: Container(
        width: screenWidth * 0.27,
        height: screenHeight * 0.15,
        child: Stack(
          children: [
            Positioned(
              left: 0.33,
              top: -0.16,
              child: Container(
                width: screenWidth * 0.27,
                height: screenHeight * 0.15,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.53, color: Color(0xFFFCBD52)),
                    borderRadius: BorderRadius.circular(22.89),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 3.05,
                      offset: Offset(0, 3.05),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.09,
              top: screenHeight * 0.03,
              child: Container(
                width: screenWidth * 0.12,
                height: screenHeight * 0.05,
                child: const FlutterLogo(),
              ),
            ),
            Positioned(
              left: screenWidth * 0.06,
              top: screenHeight * 0.1,
              child: SizedBox(
                width: screenWidth * 0.18,
                height: screenHeight * 0.035,
                child: Text(
                  label,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.04,
                    fontFamily: 'Noto Sans KR',
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    letterSpacing: 1.07,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

