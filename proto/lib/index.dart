import 'package:flutter/material.dart';
import 'package:proto/NavMenuMain.dart';
import './screens/feedback.dart';
import './screens/list.dart';
import './screens/details.dart';

class MyAppI extends StatelessWidget {
  const MyAppI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Izzeddin screens',
      initialRoute: '/list',
      routes: {
        '/feedback': (context) => const FeedbackScreen(),
        '/list': (context) => const ListScreen(),
        '/details': (context) => const DetailsScreen(),
        '/NavMenuMain': (context) => const Home(),
      },
    );
  }
}