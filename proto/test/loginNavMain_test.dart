import 'package:flutter_test/flutter_test.dart';
import 'package:proto/loginNavMain.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('LoginPage UI test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    expect(find.text('Login Page'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Forgot Password?'), findsOneWidget);
    expect(find.text('Google login'), findsOneWidget);

    await tester.tap(find.text('Google login'));
    await tester.pump();
  });

  testWidgets('SignUpPage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();

    expect(find.text('Sign Up Page'), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('emailTextField')), 'test@example.com');
    await tester.pumpAndSettle();

    await tester.enterText(
        find.byKey(const Key('passwordTextField')), 'password123');

    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();
  });

  testWidgets('CreateProfilePage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CreateProfilePage(),
    ));

    expect(find.text('Create Profile Page'), findsOneWidget);
    expect(find.text('Full Name'), findsOneWidget);
    expect(
      find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.hintText == 'Enter Full Name'),
      findsOneWidget,
    );

    await tester.enterText(find.byType(TextField), 'John Doe');

    await tester.tap(find.text('Save Profile'));
    await tester.pump(Duration(seconds: 2));

    await tester.pump(const Duration(seconds: 2));

    expect(find.text('Save Profile'), findsNothing);
  });

  testWidgets('CoverPage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CoverPage(),
    ));

    expect(find.byType(Image), findsOneWidget);
    expect(
        find.text(
            'Go to app for slangs in local areas compared to your previous locations'),
        findsOneWidget);
    expect(find.text('Log In'), findsOneWidget);

    await tester.tap(find.text('Log In'));
    await tester.pumpAndSettle();

    expect(find.text('Login Page'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(
        find.text(
            'Go to app for slangs in local areas compared to your previous locations'),
        findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);

    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();

    expect(find.text('Sign Up Page'), findsOneWidget);
    expect(find.text('Lingua'), findsNothing);
  });
}
