import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community/appdatabase/model/firebase_services.dart';
import 'package:community/utils/constants/dimen.dart';
import 'package:community/appdatabase/model/firebase_services.dart';
import 'package:community/view/ui/appscreens/dashboardui_screen.dart';
import 'package:community/view/ui/usernews/news_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/view_model/userwizard/wizard_controller.dart';
import 'package:community/view_model/userwizard/userbio_controller.dart';
import 'package:community/utils/app_string_res.dart';
import 'package:community/uicomponents/apptextformfield.dart';
import 'package:community/utils/validators.dart';


class UserBioPage extends StatelessWidget {
  final UserWizardController wizardController = Get.put(UserWizardController());
  final UserBioController bioController = Get.put(UserBioController());

  final _formKey = GlobalKey<FormState>();
  final FirebaseService _firebaseService = FirebaseService(); // Import your Firebase service



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: Dimen_50,),
            AppTextFormField(
              key: Key('bioField'),
              controller: bioController.userBioTextController,
              maxLines: 7,
              label: 'Bio',
              validator: Validators.bioValidator,
            ),
            SizedBox(height: Dimen_100,),
            ElevatedButton(
              key: Key('submitButton'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final user = FirebaseAuth.instance.currentUser;

                  if (user != null) {
                    final userFirebaseUid = user.uid;
                    final userBio = bioController.userBioTextController.text;

                    // Update the user's document in Firestore with the bio
                    final success = await _firebaseService.updateUserBio(userFirebaseUid, userBio);

                    if (success) {
                      // Data uploaded successfully
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Bio uploaded successfully'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Get.to(DashboardUI());
                    } else {
                      // Handle the case where data upload fails
                    }
                  } else {
                    // Handle the case where no user is signed in
                  }
                }
              },
              child: Text(submit),
            ),
          ],
        ),
      ),
    );
  }
}