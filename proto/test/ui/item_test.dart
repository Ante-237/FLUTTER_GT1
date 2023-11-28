import 'package:flutter_test/flutter_test.dart';
import 'package:proto/ui/item.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Item Widget UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Item(
          title: 'Sample Title',
          description: 'Sample Description',
        ),
      ),
    ));

    expect(find.text('Sample Title'), findsOneWidget);

    expect(find.text('Sample Description'), findsOneWidget);

    expect(find.byType(Image), findsOneWidget);
  });
}
