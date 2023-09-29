import 'package:flutter/material.dart';
import './screens/feedback.dart';
import './screens/list.dart';
import './screens/details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Izzeddin screens',
      initialRoute: '/list',
      routes: {
        '/feedback': (context) => const FeedbackScreen(),
        '/list': (context) => const ListScreen(),
        '/details': (context) => const DetailsScreen(),
      },
    );
  }
}