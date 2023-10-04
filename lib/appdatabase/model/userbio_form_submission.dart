import 'package:community/appdatabase/model/firebase_services.dart';
import 'package:community/utils/app_snackbars.dart';
import 'package:community/view/ui/appscreens/dashboardui_screen.dart';
import 'package:community/view_model/userwizard/userbio_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';



Future<void> handleUserBioFormSubmission(
    BuildContext context,
    GlobalKey<FormState> formKey,
    FirebaseService firebaseService,
    UserBioController bioController,
    ) async {
  if (formKey.currentState!.validate()) {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userFirebaseUid = user.uid;
      final userBio = bioController.userBioTextController.text;

      final success = await firebaseService.updateUserBio(userFirebaseUid, userBio);

      if (success) {
        SnackbarService.showMessage(context, 'Data uploaded successfully');
        Get.off(DashboardUI());

      } else {
        SnackbarService.showMessage(context, 'Failed to upload data');
      }

      }else{
      SnackbarService.showMessage(context, 'No user is signed in');
    }

  }
}