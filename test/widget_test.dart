// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_flutter/main.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());
  //
  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });


  group('Login Flow Test', () {

    testWidgets('Should have a title', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.text("Login 1"), findsOneWidget);
    });

    testWidgets('Should have one text field form to collect user email id', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.byKey(const ValueKey("email_id")), findsOneWidget);
    });

    testWidgets('Should have one text field form to collect Password', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.byKey(const ValueKey("password")), findsOneWidget);
    });

    testWidgets('Should have one login button', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('Should show Required Fields error message if user email id & password is empty', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      Finder errorTexts = find.text("Required Field");

      expect(errorTexts, findsWidgets);
    });

    testWidgets('Should submit form when user email id & password is valid', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.enterText(find.byKey(const ValueKey("email_id")), 'rich@gmail.com');
      await tester.enterText(find.byKey(const ValueKey("password")), 'password');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      Finder errorTexts = find.text("Required Field");

      expect(errorTexts, findsNothing);
    });
  });
}
