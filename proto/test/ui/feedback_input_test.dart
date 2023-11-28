import 'package:flutter_test/flutter_test.dart';
import 'package:proto/ui/feedback_input.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('FeedbackInput UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: FeedbackInput(
          labelText: 'Feedback Label',
          hintText: 'Enter your feedback',
        ),
      ),
    ));

    expect(find.text('Feedback Label'), findsOneWidget);

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is TextField &&
            widget.decoration?.hintText == 'Enter your feedback',
      ),
      findsOneWidget,
    );
  });
}
