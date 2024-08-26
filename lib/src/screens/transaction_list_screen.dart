import 'package:flutter/material.dart';
import '../widgets/custom_navigation_bar.dart'; // Adjust the path accordingly

class TransactionListScreen extends StatefulWidget {
  @override
  TransactionListScreenState createState() => TransactionListScreenState();
}

class TransactionListScreenState extends State<TransactionListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, String>> _transactions = [];

  @override
  void initState() {
    super.initState();
    _generateMockData();
  }

  void _generateMockData() {
    List<Map<String, String>> mockData = List.generate(30, (index) {
      return {
        'merchant_name': '상점 $index',
        'amount': '${(index + 1) * 1000}원',
        'transaction_date': '2024-08-26',
        'transaction_type': index % 2 == 0 ? 'Purchase' : 'Refund',
      };
    });

    setState(() {
      _transactions = mockData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Set the key for the Scaffold
      body: Container(
        width: 393,
        height: 852,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 29,
              top: 112,
              child: Text(
                '카드 내역',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 28,
                  fontFamily: 'Noto Sans KR',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.96,
                ),
              ),
            ),
            Positioned(
              left: 37,
              top: 64,
              child: Container(
                width: 16,
                height: 33,
                child: FlutterLogo(),
              ),
            ),
            Positioned(
              left: 24,
              top: 173,
              child: Container(
                width: 345,
                height: 104,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 345,
                        height: 104,
                        decoration: ShapeDecoration(
                          color: Color(0x4C77B3F6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 17,
                      top: 16,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '이번달 이용 금액                 ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Noto Sans KR',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.26,
                              ),
                            ),
                            TextSpan(
                              text: '12,600원',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Noto Sans KR',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 58,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '이번달 적립 마일리지       ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Noto Sans KR',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.26,
                              ),
                            ),
                            TextSpan(
                              text: '1900',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Noto Sans KR',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.40,
                              ),
                            ),
                            TextSpan(
                              text: '포인트',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Noto Sans KR',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.26,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 300,
              right: 20,
              bottom: 100,
              child: ListView.builder(
                itemCount: _transactions.length,
                itemBuilder: (context, index) {
                  var transaction = _transactions[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction['merchant_name']!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${transaction['amount']}',
                          style: TextStyle(
                            fontSize: 16,
                            color: transaction['transaction_type'] == 'Refund'
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          transaction['transaction_date']!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: null,
        scaffoldKey: _scaffoldKey,
        isMapScreen: false,
      ),
    );
  }
}
