import 'package:flutter_test/flutter_test.dart';
import 'package:proto/screens/feedback.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('FeedbackScreen Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: FeedbackScreen(),
      ),
    );

    expect(find.text('Feedback'), findsOneWidget);
    expect(find.text('Enter name...'), findsOneWidget);
    expect(find.text('Enter Title...'), findsOneWidget);
    expect(find.text('Enter Description...'), findsOneWidget);
    expect(find.text('SUBMIT'), findsOneWidget);

    await tester.tap(find.text('SUBMIT'));

    await tester.pump();
  });
}
