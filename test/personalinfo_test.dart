import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:community/view/ui/userdatawizard/personalinfo_page.dart';
import 'package:flutter/material.dart';
import 'package:community/view_model/userwizard/wizard_controller.dart';
import 'package:get/get.dart';

void main() {
  setUpAll(() async {
    Get.put(UserWizardController());
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    testWidgets(
        'PersonalInfoPage Form Validation Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: PersonalInfoPage(),
      ));
      final nextButton = find.byKey(Key('nextButton'));
      await tester.tap(nextButton);
      await tester.pump();


      final firstNameField = find.byKey(Key('firstNameField'));
      final lastNameField = find.byKey(Key('lastNameField'));
      final emailField = find.byKey(Key('emailField'));


      await tester.tap(nextButton);
      await tester.pump();


      expect(find.text('Please enter a valid first name'), findsOneWidget);
      expect(find.text('Please enter a valid last name'), findsOneWidget);
      expect(find.text('Please enter a valid email'), findsOneWidget);


      await tester.enterText(firstNameField, '123');
      await tester.enterText(lastNameField, '456');
      await tester.enterText(emailField, 'invalid_email');
      await tester.tap(nextButton);
      await tester.pump();


      expect(find.text('Please enter a valid first name'), findsOneWidget);
      expect(find.text('Please enter a valid last name'), findsOneWidget);
      expect(find.text('Please enter a valid email'), findsOneWidget);


      await tester.enterText(firstNameField, 'John');
      await tester.enterText(lastNameField, 'Doe');
      await tester.enterText(emailField, 'johndoe@example.com');
      await tester.tap(nextButton);
      await tester.pump();


      expect(find.text('Please enter valid first name'), findsNothing);
      expect(find.text('Please enter valid last name'), findsNothing);
      expect(find.text('Please enter valid email'), findsNothing);
     });
    }
   );
  }
