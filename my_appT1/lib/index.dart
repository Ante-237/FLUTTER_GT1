import 'package:flutter/material.dart';
import './screens/feedback.dart';
import './screens/List.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Izzeddin screens',
      initialRoute: '/list',
      routes: {
        '/feedback': (context) => FeedbackScreen(),
        '/list': (context) => const ListScreen(),
      },
    );
  }
}