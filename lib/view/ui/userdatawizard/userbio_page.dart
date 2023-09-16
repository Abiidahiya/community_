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
import 'package:community/appdatabase/model/userbio_form_submission.dart';


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
                handleUserBioFormSubmission(
                  context,
                  _formKey,
                  _firebaseService,
                  bioController,
                );
              },
              child: Text(submit),
            ),
          ],
        ),
      ),
    );
  }
}