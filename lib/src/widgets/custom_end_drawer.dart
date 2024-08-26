import 'package:flutter/material.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white, // Drawer의 기본 배경색
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white, // DrawerHeader의 배경색을 하얀색으로 설정
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0x7777B3F6), // 유저 아이콘 배경색
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white, // 유저 아이콘 색상
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    '호우남',
                    style: TextStyle(
                      color: Colors.black, // 유저 이름 텍스트 색상
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('마이 페이지'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text('카드 관리'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cards/me');
              },
            ),
            ListTile(
              leading: const Icon(Icons.monetization_on),
              title: const Text('마일리지 조회'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/mileage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('이벤트'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/events');
              },
            ),
            ListTile(
              leading: const Icon(Icons.support_agent),
              title: const Text('고객센터'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/support');
              },
            ),
          ],
        ),
      ),
    );
  }
}
