import 'package:community/appdatabase/model/firebase_services.dart';
import 'package:community/utils/app_snackbars.dart';
import 'package:community/view_model/userwizard/wizard_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:community/view_model/userwizard/useraddress_controller.dart';


Future<void> handleUserAddressSubmission(
    BuildContext context,
    GlobalKey<FormState> formKey,
    FirebaseService firebaseService,
    UserWizardController wizardController,
    UserAddressController controller,
    ) async {
  if (formKey.currentState!.validate()) {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userFirebaseUid = user.uid;
      final userAddress = controller.manualAddressController.text;

      // Update the user's document in Firestore with the address
      final success = await firebaseService.updateUserAddress(userFirebaseUid, userAddress);

      if (success) {
        // Data uploaded successfully
        SnackbarService.showMessage(context, 'Data uploaded successfully');

        wizardController.goToNextStep();
      } else {
        SnackbarService.showMessage(context, 'Data uploaded Failed');
      }
    } else {
      SnackbarService.showMessage(context, 'No user found logged in');
    }
  }
}