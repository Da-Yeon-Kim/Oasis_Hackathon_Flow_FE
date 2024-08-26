import 'package:flutter/material.dart';
import 'package:barcode/barcode.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Define a Gifticon model class
class Gifticon {
  final String name;
  final String id;

  Gifticon({required this.name, required this.id});
}

class UserGifticonListScreen extends StatefulWidget {
  @override
  _UserGifticonListScreenState createState() => _UserGifticonListScreenState();
}

class _UserGifticonListScreenState extends State<UserGifticonListScreen> {
  late Future<List<Gifticon>> futureGifticons;

  @override
  void initState() {
    super.initState();
    futureGifticons = _fetchDummyGifticons();
  }

  Future<List<Gifticon>> _fetchDummyGifticons() async {
    // Simulate a delay for the async function
    await Future.delayed(Duration(seconds: 1));

    // Create a list of 5 dummy gifticons
    return [
      Gifticon(name: 'Coffee Shop Gifticon', id: '1234567890'),
      Gifticon(name: 'Bakery Gifticon', id: '2345678901'),
      Gifticon(name: 'Bookstore Gifticon', id: '3456789012'),
      Gifticon(name: 'Restaurant Gifticon', id: '4567890123'),
      Gifticon(name: 'Cinema Gifticon', id: '5678901234'),
    ];
  }

  // Generate barcode SVG as a string
  String _generateBarcode(String data) {
    final barcode = Barcode.code128();
    return barcode.toSvg(data, width: 200, height: 80);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 기프티콘 보기'),
      ),
      body: FutureBuilder<List<Gifticon>>(
        future: futureGifticons,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("에러: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("사용가능한 기프티콘이 없습니다."));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final gifticon = snapshot.data![index];
                final barcodeSvg = _generateBarcode(gifticon.id); // Generate barcode SVG

                return ListTile(
                  title: Text(gifticon.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('바코드: ${gifticon.id}'),
                      SizedBox(height: 8),
                      SvgPicture.string(barcodeSvg), // Display the barcode
                    ],
                  ),
                  leading: Icon(Icons.card_giftcard), // Optional: Add an icon
                );
              },
            );
          }
        },
      ),
    );
  }
}
