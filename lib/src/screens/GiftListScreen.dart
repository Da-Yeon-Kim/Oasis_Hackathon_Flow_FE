import 'package:flutter/material.dart';

class GifticonScreen extends StatelessWidget {
  const GifticonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기프티콘'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFA40B)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              '구매',
              style: TextStyle(color: Color(0xFFFFA40B)),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              '관리',
              style: TextStyle(color: Color(0xFFFFA40B)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: '찾으시는 상품, 가게 이름',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/315x187"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        '🔥 현재 핫한 가게 🔥',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '여기 cafe',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '지금 동명동 핫한 바로 여기!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryChip('카페', Icons.local_cafe),
                  _buildCategoryChip('맛집', Icons.restaurant),
                  _buildCategoryChip('영화', Icons.movie),
                  _buildCategoryChip('여행', Icons.card_travel),
                  // 추가 카테고리는 여기에
                ],
              ),
            ),
            const SizedBox(height: 20),
            ToggleButtons(
              borderRadius: BorderRadius.circular(20),
              selectedColor: Colors.white,
              fillColor: Colors.orange,
              color: Colors.orange,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('인기순'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('추천순'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('가격낮은순'),
                ),
              ],
              isSelected: [true, false, false],
              onPressed: (int index) {
                // 필터 변경 로직
              },
            ),
            const SizedBox(height: 20),
            _buildGifticonList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '',
          ),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildCategoryChip(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        label: Text(label),
        avatar: Icon(icon, color: Colors.orange),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildGifticonList() {
    final gifticons = [
      {'title': '여기 cafe 1만원권', 'category': '카페, 음료', 'price': '10,000원'},
      {'title': '뭐시기 떡볶이 2만원권', 'category': '맛집, 식당', 'price': '20,000원'},
      // 추가 기프티콘 데이터는 여기에
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: gifticons.length,
      itemBuilder: (context, index) {
        final gifticon = gifticons[index];
        return ListTile(
          leading: const Icon(Icons.local_cafe),
          title: Text(gifticon['title']!),
          subtitle: Text(gifticon['category']!),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(gifticon['price']!),
              const SizedBox(width: 10),
              const Icon(Icons.favorite_border),
            ],
          ),
        );
      },
    );
  }
}
