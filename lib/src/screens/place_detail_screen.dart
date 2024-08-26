import 'package:flutter/material.dart';
import '../widgets/custom_navigation_bar.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Place image
              SizedBox(
                width: screenWidth,
                child: Image.asset(
                  'lib/src/assets/place.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // '리뷰 작성하기'와 '길찾기' 버튼을 한 줄에 배치
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // '리뷰 작성하기' 버튼
                  Expanded(
                    flex: 3, // 길이를 조절하기 위해 flex 사용
                    child: ElevatedButton(
                      onPressed: () {
                        _showReviewPopup(context, screenWidth, screenHeight);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9DC7F6),
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '리뷰 작성하기',
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: screenWidth * 0.05,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02), // 버튼 사이 간격

                  // '길찾기' 버튼
                  Expanded(
                    flex: 1, // 길이를 조절하기 위해 flex 사용
                    child: ElevatedButton(
                      onPressed: () {
                        // 길찾기 버튼 클릭 시 동작 추가
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9DC7F6),
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '길찾기',
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: screenWidth * 0.05,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: null,
        scaffoldKey: GlobalKey<ScaffoldState>(),
        isMapScreen: false,
      ),
    );
  }

  void _showReviewPopup(
      BuildContext context, double screenWidth, double screenHeight) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 리뷰 작성하기 이미지
              Container(
                width: screenWidth * 0.8,
                child: Image.asset(
                  'lib/src/assets/review_form.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
