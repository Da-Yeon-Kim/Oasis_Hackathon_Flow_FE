import 'package:flutter/material.dart';
import '../widgets/custom_navigation_bar.dart';

class CardRegistrationScreen extends StatefulWidget {
  const CardRegistrationScreen({super.key});

  @override
  State<CardRegistrationScreen> createState() => _CardRegistrationScreenState();
}

class _CardRegistrationScreenState extends State<CardRegistrationScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();
  bool _allAgreed = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvcController.dispose();
    super.dispose();
  }

  void _toggleAgreement(bool? value) {
    setState(() {
      _allAgreed = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('카드 등록'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFA40B)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.credit_card, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(
                        '카드 정보를 입력해주세요',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _cardNumberController,
                    decoration: const InputDecoration(
                      labelText: '카드번호',
                      hintText: '0000 - 0000 - 0000 - 0000',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _expiryDateController,
                          decoration: const InputDecoration(
                            labelText: '유효기간',
                            hintText: 'MM/YY',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _cvcController,
                          decoration: const InputDecoration(
                            labelText: 'CVC',
                            hintText: '카드 뒷면 3자리',
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  CheckboxListTile(
                    value: _allAgreed,
                    onChanged: _toggleAgreement,
                    title: const Text('전체 약관 동의'),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  const Divider(),
                  CheckboxListTile(
                    value: _allAgreed,
                    onChanged: _toggleAgreement,
                    title: const Text('카드 번호 데이터 수집 및 이용 동의'),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    value: _allAgreed,
                    onChanged: _toggleAgreement,
                    title: const Text('카드 이용 내역 정보 제공 동의'),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    value: _allAgreed,
                    onChanged: _toggleAgreement,
                    title: const Text('카드사로부터 개인정보 수집 및 이용 동의'),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _allAgreed ? _registerCard : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                '완료',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: null, // 선택된 항목이 없음을 의미
        scaffoldKey: _scaffoldKey,
        isMapScreen: false, // 이 화면은 지도 화면이 아니므로 false로 설정
      ),
    );
  }

  void _registerCard() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('카드 등록이 완료되었습니다.')),
    );
  }
}
