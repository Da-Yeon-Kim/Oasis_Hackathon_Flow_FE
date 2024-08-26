import 'package:flutter/material.dart';
import '../widgets/custom_navigation_bar.dart';
import 'search_results_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();

  // 목데이터 생성
  final List<Map<String, String>> mockStores = List.generate(30, (index) {
    return {
      'name': '상점 $index',
      'latitude': '37.5665',
      'longitude': '126.9780',
      'description': '이곳은 상점 $index입니다.',
    };
  });

  List<Map<String, String>> searchResults = [];

  @override
  void initState() {
    super.initState();
    searchResults = mockStores; // 초기에는 전체 상점을 표시
  }

  void _searchPlace() {
    final query = searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        searchResults = mockStores;
      } else {
        searchResults = mockStores
            .where((store) =>
        store['name']!.toLowerCase().contains(query) ||
            store['description']!.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: '장소를 검색중입니다.',
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
      body: Stack(
        children: [
          // 이미지 배경 추가
          Positioned.fill(
            child: Image.asset(
              'assets/images/Rectangle7.png', // 이미지 경로
              fit: BoxFit.cover, // 이미지를 화면에 꽉 채워서 표시
            ),
          ),
          // 검색 결과 표시
          if (searchResults.isNotEmpty)
            Positioned(
              top: 100,
              left: 20,
              right: 20,
              bottom: 20,
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final store = searchResults[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(store['name']!),
                      subtitle: Text(store['description']!),
                    ),
                  );
                },
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
}

