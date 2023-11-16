import 'package:flutter/material.dart';
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
              Navigator.popAndPushNamed(
                context,
                '/NavMenuMain',
              );
            },
          ),
          title: const Text('List'),
        ),
        body: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Column(children: [
            SizedBox(height: 36.0),
            Item(
              title: 'FoodDatum name',
              description: "FoodDatum description",
            ),
            SizedBox(height: 20.0),
            Item(
              title: 'FoodDatum name',
              description: "FoodDatum description",
            ),
            SizedBox(height: 20.0),
            Item(
              title: 'FoodDatum name',
              description: "FoodDatum description",
            ),
          ]),
        ));
  }
}


