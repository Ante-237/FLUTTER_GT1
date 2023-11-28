import 'package:flutter_test/flutter_test.dart';
import 'package:proto/screens/details.dart';
import 'package:proto/screens/feedback.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('DetailsScreen Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: DetailsScreen(),
        routes: {
          '/feedback': (context) =>
              FeedbackScreen(), // Replace with your FeedbackScreen
        },
      ),
    );

    await tester.ensureVisible(find.text('ADD FEEDBACK'));

    await tester.tap(find.text('ADD FEEDBACK'));
    await tester.pumpAndSettle();

    expect(find.text('ADD FEEDBACK'), findsNothing);
  });
}
