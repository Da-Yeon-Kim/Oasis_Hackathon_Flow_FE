import 'package:flutter/material.dart';
import 'package:flutterproject1/src/screens/ReviewFormScreen.dart';
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
import 'src/screens/card_my_screen.dart';
import 'src/screens/place_detail_screen.dart';

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
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/map': (context) => const MapScreen(),
        '/store': (context) => const PlaceDetailScreen(),
        '/my_reviews': (context) => const MyReviewsScreen(),
        '/cards/me': (context) => const ManageCardScreen(),
        '/cards/register': (context) => const CardRegistrationScreen(),
        '/transactions': (context) => TransactionListScreen(),
        '/mileage': (context) => const MileageScreen(),
        '/review': (context) => ReviewScreen(),
        '/my_review': (context) => const MyReviewsScreen(),
        '/ReviewForm': (context) => ReviewFormScreen(),
      },
    );
  }
}
