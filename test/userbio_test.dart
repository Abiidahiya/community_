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


    final bioField = find.byKey(Key('bioField'));


    final submitButton = find.byKey(Key('submitButton'));


    await tester.enterText(bioField, 'Invalid bio with invalid @#%^&');
    await tester.tap(submitButton);
    await tester.pumpAndSettle();


    expect(find.text('Please enter a valid bio'), findsOneWidget);


    await tester.enterText(bioField, 'This is a valid bio.');
    await tester.tap(submitButton);
    await tester.pumpAndSettle();


    expect(find.text('Please enter a valid bio'), findsNothing);
  });
}