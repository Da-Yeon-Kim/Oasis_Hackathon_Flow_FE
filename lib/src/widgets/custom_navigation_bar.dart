import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int? selectedIndex;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool isMapScreen;

  const CustomNavigationBar({
    super.key,
    this.selectedIndex,
    required this.scaffoldKey,
    required this.isMapScreen,
  });

  void _onItemTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/my_reviews');
    } else if (index == 1) {
      if (isMapScreen) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/map');
      }
    } else if (index == 2) {
      scaffoldKey.currentState?.openEndDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8E6C7),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, -1),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(15), // 컨테이너의 둥근 모서리
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context,
            icon: Icons.reviews,
            label: '내 리뷰',
            index: 0,
          ),
          _buildNavItem(
            context,
            icon: isMapScreen ? Icons.home : Icons.location_on,
            label: '', // 가운데 아이템의 텍스트 제거
            index: 1,
            isCenter: true,
          ),
          _buildNavItem(
            context,
            icon: Icons.menu,
            label: '메뉴',
            index: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context,
      {required IconData icon,
      required String label,
      required int index,
      bool isCenter = false}) {
    return GestureDetector(
      onTap: () => _onItemTapped(context, index),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isCenter)
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFDB132), // 원형 배경 색상
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 40, // 가운데 아이콘 크기
                ),
              )
            else
              Icon(
                icon,
                color: Color(0xFFFDB132),
                size: 36, // '내 리뷰'와 '메뉴' 아이콘 크기 증가
              ),
            if (!isCenter) // 가운데 아이템이 아닌 경우에만 텍스트 표시
              const SizedBox(height: 4),
            if (!isCenter) // 가운데 아이템이 아닌 경우에만 텍스트 표시
              Text(
                label,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14, // 텍스트 크기
                ),
              ),
          ],
        ),
      ),
    );
  }
}
