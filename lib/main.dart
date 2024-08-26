import 'package:flutter/material.dart';
import 'package:flutterproject1/src/screens/review_register_screen.dart';
import 'src/screens/login_screen.dart';
import 'src/screens/register_screen.dart';
import 'src/screens/home_screen.dart';
import 'src/screens/map_screen.dart';
import 'src/screens/my_reviews_screen.dart';
import 'src/screens/card_register_screen.dart';
import 'src/screens/transaction_list_screen.dart';
import 'src/screens/mileage_screen.dart';
import 'src/screens/splash_screen.dart';
import 'src/screens/search_results_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BacktotheLocal',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/map': (context) => const MapScreen(),
        '/my_reviews': (context) => const MyReviewsScreen(),
        '/cards/register': (context) => CardRecognizerScreen(),
        '/transactions': (context) => const TransactionListScreen(),
        '/mileage': (context) => const MileageScreen(),
        '/review': (context) => ReviewPage(),
        '/my_review': (context) => const MyReviewsScreen(),
        '/search_results': (context) => const SearchResultsScreen(query: ""),
      },
    );
  }
}
