import 'package:flutter_test/flutter_test.dart';
import 'package:proto/screens/list.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('ListScreen Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: ListScreen(),
      ),
    );

    expect(find.text('List'), findsOneWidget);
    expect(find.text('FoodDatum name'), findsNWidgets(3));
    expect(find.text('FoodDatum description'), findsNWidgets(3));
  });
}
