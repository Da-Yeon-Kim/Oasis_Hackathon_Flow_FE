import 'package:flutter/material.dart';

class MyReviewsScreen extends StatefulWidget {
  const MyReviewsScreen({super.key});

  @override
  _MyReviewsScreenState createState() => _MyReviewsScreenState();
}

class _MyReviewsScreenState extends State<MyReviewsScreen> {
  late Future<List<Review>> _reviews;

  @override
  void initState() {
    super.initState();
    _reviews = fetchReviews();
  }

  Future<List<Review>> fetchReviews() async {
    // 서버 대신 목업 데이터를 반환
    await Future.delayed(Duration(seconds: 1)); // 서버 지연을 시뮬레이션
    return [
      Review(title: '멋진 카페', content: '아늑하고 분위기 있는 카페였습니다.', date: '2024-08-01'),
      Review(title: '좋은 레스토랑', content: '음식이 정말 맛있었어요.', date: '2024-08-02'),
      Review(title: '훌륭한 서비스', content: '직원들이 매우 친절했습니다.', date: '2024-08-03'),
      Review(title: '아쉬운 경험', content: '기대에 미치지 못했어요.', date: '2024-08-04'),
      Review(title: '재방문 의사 있음', content: '다시 가고 싶어요!', date: '2024-08-05'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 리뷰'),
      ),
      body: FutureBuilder<List<Review>>(
        future: _reviews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('에러 발생: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('작성된 리뷰가 없습니다.'));
          } else {
            final reviews = snapshot.data!;
            return ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    title: Text(review.title),
                    subtitle: Text(review.content),
                    trailing: Text(review.date),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Review {
  final String title;
  final String content;
  final String date;

  Review({
    required this.title,
    required this.content,
    required this.date,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      title: json['title'],
      content: json['content'],
      date: json['date'],
    );
  }
}
