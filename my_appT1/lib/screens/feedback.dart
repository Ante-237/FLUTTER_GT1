import 'package:flutter/material.dart';
import '../ui/feedback_input.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

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
          title: const Text('Feedback'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: [
            const SizedBox(height: 36.0),
            FeedbackInput(
              hintText: 'Enter name...',
              labelText: "Name",
            ),
            const SizedBox(height: 16.0),
            FeedbackInput(
              hintText: 'Enter Title...',
              labelText: "Title",
            ),
            const SizedBox(height: 16.0),
            FeedbackInput(
              hintText: 'Enter Description...',
              labelText: "Description",
            ),
            const SizedBox(height: 24.0,),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50.0)
              ),
              child: const Text('SUBMIT'),
            ),
          ]),
        ));
  }
}


