import 'package:flutter/material.dart';

class ReviewFormScreen extends StatefulWidget {
  @override
  _ReviewFormScreenState createState() => _ReviewFormScreenState();
}

class _ReviewFormScreenState extends State<ReviewFormScreen> {
  double _rating = 0;
  List<String> _selectedExperiences = [];
  TextEditingController _detailedReviewController = TextEditingController();

  final List<String> _experienceOptions = [
    '친절한 직원',
    '힙한 분위기',
    '멋진 야경',
    '조용한',
    '도시적인 분위기',
    '깨끗한 매장',
    '따뜻한 분위기',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('리뷰를 작성해주세요'),
        backgroundColor: Color(0xFFFFA40B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                '별점을 매겨주세요',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: StarRating(
                rating: _rating,
                onRatingChanged: (rating) => setState(() => _rating = rating),
              ),
            ),
            SizedBox(height: 20),
            Text(
              '이용 경험을 선택해주세요',
              style: TextStyle(fontSize: 18),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: _experienceOptions.map((experience) {
                bool isSelected = _selectedExperiences.contains(experience);
                return FilterChip(
                  label: Text(experience),
                  selected: isSelected,
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        _selectedExperiences.add(experience);
                      } else {
                        _selectedExperiences.remove(experience);
                      }
                    });
                  },
                  selectedColor: Color(0xFFFFA40B),
                  checkmarkColor: Colors.white,
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              '상세한 리뷰를 작성해주세요 (선택)',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _detailedReviewController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '여기에 작성해주세요...',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle review submission
                  },
                  child: Text('등록'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8AB4F8),
                    textStyle: TextStyle(fontSize: 16),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle cancel action
                  },
                  child: Text('취소'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    textStyle: TextStyle(fontSize: 16),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final double rating;
  final Function(double) onRatingChanged;
  final int starCount;

  StarRating({this.rating = 0.0, required this.onRatingChanged, this.starCount = 5});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        return IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          onPressed: () {
            onRatingChanged(index + 1.0);
          },
        );
      }),
    );
  }
}

