import 'package:flutter/material.dart';
import '../services/api_service.dart';

class TransactionListScreen extends StatefulWidget {
  const TransactionListScreen({super.key});

  @override
  TransactionListScreenState createState() => TransactionListScreenState();
}

class TransactionListScreenState extends State<TransactionListScreen> {
  final ApiService _apiService = ApiService();
  List<dynamic> _transactions = [];

  @override
  void initState() {
    super.initState();
    _fetchTransactions();
  }

  void _fetchTransactions() async {
    String userId = '1'; // 실제로는 로그인한 사용자의 ID를 사용
    List<dynamic> transactions = await _apiService.fetchTransactions(userId);
    if (!mounted) return; // mounted 체크 추가

    setState(() {
      _transactions = transactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 393,
        height: 852,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 743,
              child: Container(
                width: 393,
                height: 109,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 26,
                      child: Container(
                        width: 393,
                        height: 83,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF8E6C7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 20,
                              offset: Offset(0, -10),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 155,
                      top: 0,
                      child: Container(
                        width: 83,
                        height: 83,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: OvalBorder(
                            side: BorderSide(width: 3, color: Color(0xFFFACC7F)),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 48,
                      child: Container(
                        width: 45,
                        height: 45,
                        child: FlutterLogo(),
                      ),
                    ),
                    Positioned(
                      left: 328,
                      top: 43,
                      child: Container(
                        width: 53,
                        height: 53,
                        padding: const EdgeInsets.symmetric(horizontal: 4.42, vertical: 11.04),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 155,
              top: 743,
              child: Container(
                width: 83,
                height: 83,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: FlutterLogo(),
              ),
            ),
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
                  height: 0,
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
                                height: 0,
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
                                height: 0,
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
                                height: 0,
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
                                height: 0,
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
                                height: 0,
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
            // Dynamic ListView for Transactions
            Positioned(
              left: 20,
              top: 300, // Adjusted position to fit below the static UI
              right: 20,
              bottom: 100, // Adjusted position to fit above the bottom navigation bar
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
                          transaction['merchant_name'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${transaction['amount']}원',
                          style: TextStyle(
                            fontSize: 16,
                            color: transaction['transaction_type'] == 'Refund'
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          transaction['transaction_date'],
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
    );
  }
}
