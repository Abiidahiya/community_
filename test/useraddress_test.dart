import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:community/view/ui/userdatawizard/useraddress_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:community/view_model/userwizard/wizard_controller.dart';

void main() {
  setUpAll(() async {
    Get.put(UserWizardController());
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();



  });
  testWidgets('UserAddressPage Form Validation Test', (WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: UserAddressPage(),
      ),
    );


    final bioField = find.byKey(Key('addressfield'));


    final submitButton = find.byKey(Key('nextButton'));


    await tester.enterText(bioField, 'Invalid address with invalid @#%^&');
    await tester.tap(submitButton);
    await tester.pumpAndSettle();


    expect(find.text('Please enter a valid address'), findsOneWidget);


    await tester.enterText(bioField, 'This is a valid address.');
    await tester.tap(submitButton);
    await tester.pumpAndSettle();


    expect(find.text('Please enter a valid address'), findsNothing);
  });
}