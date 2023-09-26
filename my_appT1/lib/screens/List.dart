import 'package:flutter/material.dart';
import '../ui/feedback_input.dart';
import '../ui/item.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('List'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(children: [
            const SizedBox(height: 36.0),
            Item(
              title: 'FoodDatum name',
              description: "FoodDatum description",
            ),
            const SizedBox(height: 20.0),
            Item(
              title: 'FoodDatum name',
              description: "FoodDatum description",
            ),
            const SizedBox(height: 20.0),
            Item(
              title: 'FoodDatum name',
              description: "FoodDatum description",
            ),
          ]),
        ));
  }
}


