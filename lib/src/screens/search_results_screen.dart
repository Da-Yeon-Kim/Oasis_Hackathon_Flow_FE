import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'place_detail_screen.dart'; // 추가

class SearchResultsScreen extends StatefulWidget {
  final String query;

  const SearchResultsScreen({super.key, required this.query, required List<Map<String, dynamic>> stores});

  @override
  SearchResultsScreenState createState() => SearchResultsScreenState();
}

class SearchResultsScreenState extends State<SearchResultsScreen> {
  late Future<List<Store>> _searchResults;

  @override
  void initState() {
    super.initState();
    _searchResults = fetchStores(widget.query);
  }

  Future<List<Store>> fetchStores(String query) async {
    const apiKey =
        'CjY2G0exMAK4XRLBfFit%2FYf3LF9xc%2BkfGgikPtsHbp%2BEyebnCWspd2eKlv7%2BvCJ9QDav4GmOVsGmrDyA2cDotg%3D%3DY'; // 한국조폐공사 API 키
    final response = await http.get(Uri.parse(
        'http://apis.data.go.kr/B190001/localFranchisesV2?serviceKey=$apiKey&type=json&keyword=$query'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['response']['body']['items'] as List)
          .map((item) => Store.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load stores');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results: ${widget.query}'),
      ),
      body: FutureBuilder<List<Store>>(
        future: _searchResults,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No results found'));
          } else {
            final stores = snapshot.data!;
            return ListView.builder(
              itemCount: stores.length,
              itemBuilder: (context, index) {
                final store = stores[index];
                return ListTile(
                  title: Text(
                    store.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        store.category,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        store.address,
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        store.phone,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  onTap: () {
                    // 가게 선택 시 place_detail_screen으로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlaceDetailScreen(
                          store: store,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Store {
  final String name;
  final String address;
  final String phone;
  final double latitude;
  final double longitude;
  final String category;

  const Store({
    required this.name,
    required this.address,
    required this.phone,
    required this.latitude,
    required this.longitude,
    required this.category,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      name: json['name'],
      address: json['address'],
      phone: json['phone'] ?? 'N/A',
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
      category: json['category'] ?? 'N/A',
    );
  }
}
