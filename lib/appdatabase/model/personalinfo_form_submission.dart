import 'package:community/utils/app_snackbars.dart';
import 'package:community/view_model/userwizard/personalinfo_controller.dart';
import 'package:community/view_model/userwizard/wizard_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:community/appdatabase/model/firebase_services.dart';




Future<void> handleFormSubmission(
    BuildContext context,
    GlobalKey<FormState> formKey,
    Function collectUserData,
    FirebaseService firebaseService,
    UserWizardController wizardController,
    PersonalInfoController controller,
    ) async {
  if (formKey.currentState!.validate()) {
    final userData = collectUserData();
    String? userFirebaseUid; // Initialize to null

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userFirebaseUid = user.uid;

      // Check if an image has been selected
      if (controller.selectedImage.value != null) {
        final photoURL = await firebaseService.updateUserPhotoURL(controller.selectedImage.value!, userFirebaseUid);
        if (photoURL != null) {
          userData['photoURL'] = photoURL; // Update userData with photoURL
        } else {
          // Handle the case where image upload fails
          SnackbarService.showMessage(context, 'Failed to upload image');
          return; // Don't proceed if image upload fails
        }
      }

      // Pass the userFirebaseUid and updated userData to uploadUserData
      final success = await firebaseService.uploadUserData(userData);

      if (success) {
        // Data uploaded successfully
        SnackbarService.showMessage(context, 'Data uploaded successfully');
        wizardController.goToNextStep();
      } else {
        // Handle the case where data upload fails
        SnackbarService.showMessage(context, 'Failed to upload data');
      }
    } else {
      // Handle the case where no user is signed in
      SnackbarService.showMessage(context, 'No user is signed in');
    }
  }
}