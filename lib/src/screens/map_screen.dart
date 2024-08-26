import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import '../widgets/custom_navigation_bar.dart';
import 'search_results_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  WebViewController? _controller;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      _initializeWebView();
      _requestLocationPermission();
    } else {
      _loadHtmlForWeb();
    }
  }

  Future<void> _initializeWebView() async {
    final position = await _getCurrentLocation();
    final lat = position.latitude;
    final lng = position.longitude;

    final stores = await fetchStores(''); // 빈 검색어로 모든 가맹점 가져오기
    final markers = jsonEncode(stores);

    // Add the current location marker to the stores data
    stores.add({
      'name': '현재 위치',
      'latitude': lat,
      'longitude': lng,
      'isCurrentLocation': true
    });

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(_buildHtmlUrl(lat, lng, jsonEncode(stores))));
  }

  void _loadHtmlForWeb() {
    // Load the HTML content directly or use an iframe to embed a map
    final htmlContent = '''
      <html>
        <head>
          <title>Map</title>
          <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_KAKAO_APP_KEY"></script>
        </head>
        <body>
          <div id="map" style="width:100%;height:100%;"></div>
          <script>
            var container = document.getElementById('map');
            var options = {
              center: new kakao.maps.LatLng(37.5665, 126.9780),
              level: 3
            };
            var map = new kakao.maps.Map(container, options);
          </script>
        </body>
      </html>
    ''';

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.dataFromString(htmlContent, mimeType: 'text/html', encoding: Encoding.getByName('utf-8')));
  }

  Future<Position> _getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
  }

  void _requestLocationPermission() async {
    await Geolocator.requestPermission();
  }

  String _buildHtmlUrl(double lat, double lng, String markers) {
    final encodedMarkers = Uri.encodeComponent(markers);
    return 'file:///android_asset/flutter_assets/assets/kakao_map.html?lat=$lat&lng=$lng&markers=$encodedMarkers';
  }

  void _searchPlace() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultsScreen(query: query),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: '장소를 검색중입니다.',
          ),
        ),
      ),
      body: kIsWeb
          ? (_controller != null
          ? WebViewWidget(controller: _controller!)
          : const Center(
        child: Text('지도 로드 실패'),
      ))
          : (_controller != null
          ? WebViewWidget(controller: _controller!)
          : const Center(
        child: Text('웹뷰를 지원하지 않습니다.'),
      )),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: null,
        scaffoldKey: _scaffoldKey,
        isMapScreen: true,
      ),
    );
  }

  Future<List<Map<String, dynamic>>> fetchStores(String query) async {
    final apiKey = 'your_api_key_here';
    final response = await http.get(Uri.parse(
        'http://apis.data.go.kr/B190001/localFranchisesV2?serviceKey=$apiKey&type=json&keyword=$query'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['response']['body']['items'] as List)
          .map((item) => {
        'name': item['name'],
        'latitude': double.parse(item['latitude']),
        'longitude': double.parse(item['longitude']),
      })
          .toList();
    } else {
      throw Exception('스토어 로드 실패');
    }
  }
}
