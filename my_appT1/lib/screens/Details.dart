import 'package:flutter/material.dart';
import '../ui/feedback_input.dart';
import '../ui/item.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

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
        title: const Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Center(
              child: Image.asset(
                'assets/logo.png',
                width: 400.0,
                height: 400.0,
                fit: BoxFit.cover,
              ),
            ),
            // const SizedBox(height: 1.0),
            const Text(
              'Description',
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            const SizedBox(height: 2.0),
            const Text(
              'This is just test material',
              style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              'description description',
              style: TextStyle(fontSize: 16.0),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: 14.0,
                        bottom: 14.0), // Adjust the padding as needed
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text(
                  'Save',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
                height: 80.0,
                width: double.infinity,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, -3), // Negative offset for shadow at the top
                        ),
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.only(
                                left: 32.0,
                                right: 32.0,
                                top: 16.0,
                                bottom: 16.0), // Adjust the padding as needed
                          ),
                        ),
                        onPressed: () {
                          // Add your ADD FEEDBACK button action here
                        },
                        icon: const Icon(Icons.add),
                        label: const Text(
                          'ADD FEEDBACK',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
