import 'package:flutter/material.dart';
import './screens/Feedback.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Izzeddin screens',
      initialRoute: '/feedback',
      routes: {
        '/feedback': (context) => FeedbackScreen(),
      },
    );
  }
}