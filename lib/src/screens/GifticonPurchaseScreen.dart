import 'package:flutter/material.dart';
import '../services/gifticon_purchase_api.dart';

class GifticonPurchaseScreen extends StatelessWidget {
  final int gifticonId;

  GifticonPurchaseScreen({required this.gifticonId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기프티콘 구매하기'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              final barcode = await ApiService().purchaseGifticon(gifticonId);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('구매를 성공적으로 완료하였습니다.'),
                    content: Text('바코드: $barcode'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } catch (e) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('에러'),
                    content: Text(e.toString()),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: Text('기프티콘 구매하기'),
        ),
      ),
    );
  }
}
