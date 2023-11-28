import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proto/NavMenuMain.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

void main() {
  testWidgets('Home Widget UI Test', (WidgetTester tester) async {
    final firestore = FakeFirebaseFirestore();
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Home(firestore: firestore),
      ),
    ));

    expect(find.text('HOME'), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
    expect(find.byType(GridTile),
        findsNWidgets(6)); // Update this line to match the actual number
  });

  testWidgets('Category Widget UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: const Category(),
      ),
    ));

    expect(find.byType(FloatingActionButton), findsOneWidget);
    // Add more tests as needed
  });

  testWidgets('Saved Widget UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Saved(),
      ),
    ));

    expect(find.text('SAVED'), findsOneWidget);
    expect(find.byType(ListSaved), findsNWidgets(4));
  });

  testWidgets('ListSaved Widget UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: ListSaved(),
      ),
    ));

    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(ListTile), findsOneWidget);
    // Add more tests as needed
  });

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('Profile Widget UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
      body: Profile(),
    )));

    await tester.pumpAndSettle();
    expect(find.text('Profile'), findsNothing);
  });

  testWidgets('Category Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Category(),
        ),
      ),
    );

    expect(find.text('Category'), findsOneWidget);
    expect(find.byIcon(Icons.cookie), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));

    await tester.pumpAndSettle();

    expect(find.text('MyAppI'), findsOneWidget);
  });
}
