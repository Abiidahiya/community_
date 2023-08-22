import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:community/view/ui/userdatawizard/userbio_page.dart';

void main() {
  testWidgets('UserBioPage Form Validation Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: UserBioPage(),
      ),
    );

    // Find the TextFormField by its key
    final bioField = find.byKey(Key('bioField'));

    // Find the ElevatedButton by its key
    final submitButton = find.byKey(Key('submitButton'));

    // Enter an invalid bio
    await tester.enterText(bioField, 'Invalid bio with invalid @#%^&');
    await tester.tap(submitButton);
    await tester.pumpAndSettle(); // Wait for animations and microtasks to complete

    // Verify validation message appears
    expect(find.text('Please enter a valid bio'), findsOneWidget);

    // Enter a valid bio
    await tester.enterText(bioField, 'This is a valid bio.');
    await tester.tap(submitButton);
    await tester.pumpAndSettle(); // Wait for animations and microtasks to complete

    // Verify that validation message is not present
    expect(find.text('Please enter a valid bio'), findsNothing);
  });
}