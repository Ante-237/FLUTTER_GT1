import 'package:flutter/material.dart';

class FeedbackInput extends StatelessWidget {
  final String? labelText;
  final String? hintText;

  const FeedbackInput({super.key, this.labelText, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              labelText!,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
          ),
        SizedBox(
            height: 50.0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.only(left: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText ?? 'Enter...',
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
