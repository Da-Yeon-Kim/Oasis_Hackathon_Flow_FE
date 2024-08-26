import 'package:flutter/material.dart';
import '../widgets/custom_navigation_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController searchController = TextEditingController();
  bool showSearchResults = false;

  void _searchPlace() {
    setState(() {
      showSearchResults = true;
    });
  }

  void _navigateToStore() {
    Navigator.pushNamed(context, '/store');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          // 배경 지도 이미지
          SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: Image.asset(
              'lib/src/assets/map.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // 검색창
          Positioned(
            top: screenHeight * 0.05,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: '검색어를 입력하세요...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _searchPlace,
                  ),
                ],
              ),
            ),
          ),
          // 검색 결과
          if (showSearchResults)
            Positioned(
              top: screenHeight * 0.15,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.03),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStoreItem(
                      '60계치킨운암동림점',
                      '치킨',
                      '영업 중',
                      '광주 북구 대자실로 23-1',
                      'lib/src/assets/store1.png',
                      screenWidth,
                    ),
                    _buildDivider(screenWidth),
                    _buildStoreItem(
                      '비에이치씨(BHC)운암동림점',
                      '치킨',
                      '영업 중',
                      '광주 북구 서강로 89',
                      'lib/src/assets/store2.png',
                      screenWidth,
                    ),
                    _buildDivider(screenWidth),
                    _buildStoreItem(
                      '호식이두마리치킨(운암동2호점)',
                      '치킨',
                      '영업 중',
                      '광주 북구 서강로66번길 3-3',
                      'lib/src/assets/store3.jpg',
                      screenWidth,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: null,
        scaffoldKey: _scaffoldKey,
        isMapScreen: true,
      ),
    );
  }

  Widget _buildStoreItem(String name, String category, String status,
      String address, String imagePath, double screenWidth) {
    return GestureDetector(
      onTap: _navigateToStore,
      child: Padding(
        padding: EdgeInsets.only(bottom: screenWidth * 0.03),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    category,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: const Color(0xFF77B3F6),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Text(
                    address,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: screenWidth * 0.2,
              height: screenWidth * 0.2,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider(double screenWidth) {
    return Divider(
      color: const Color(0xFF77B3F6),
      thickness: 1,
      height: screenWidth * 0.03,
    );
  }
}
