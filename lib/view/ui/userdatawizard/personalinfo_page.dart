import 'package:community/utils/firebase_storage_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/view_model/userwizard/wizard_controller.dart';
import 'package:community/utils/app_string_res.dart';

import 'package:community/view_model/userwizard/personalinfo_controller.dart';
import 'package:community/uicomponents/apptextformfield.dart';
import 'package:community/utils/validators.dart';
import 'package:community/uicomponents/customsizedbox.dart';

import 'package:community/appdatabase/model/firebase_services.dart';


class PersonalInfoPage extends StatelessWidget {
  final PersonalInfoController controller = Get.put(PersonalInfoController());
  final UserWizardController wizardController = Get.put(UserWizardController());

  PersonalInfoPage({super.key});

  final formKey = GlobalKey<FormState>();
  final FirebaseService _firebaseService = FirebaseService();
  final FirebaseStorageService storageService = FirebaseStorageService();

  Map<String, dynamic> collectUserData() {
    final firstName = controller.firstNameController.text;
    final lastName = controller.lastNameController.text;
    final email = controller.emailController.text;
    final displayName = '$firstName $lastName'; // Combine first and last name


    return {
      'displayName': displayName,
      'email': email,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Form(
        key: controller.formKey, // Add a form key
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSizedBox(),
              ElevatedButton(
                onPressed: controller.pickImage,
                child: const Text(imagepickertext),
              ),
              CustomSizedBox(),
              Obx(() {
                return controller.selectedImage.value != null
                    ? Image.file(controller.selectedImage.value!)
                    : Container();
              }),
              CustomSizedBox(),
              AppTextFormField(
                key: Key('firstNameField'),
                controller: controller.firstNameController,
                  label: 'First Name',
                validator: Validators.firstNameValidator,
              ),
              CustomSizedBox(),
              AppTextFormField(
                key: Key('lastNameField'),
                controller: controller.lastNameController,
                label: lastname,
                validator: Validators.lastNameValidator,

              ),
              CustomSizedBox(),
              AppTextFormField(
                key: Key('emailField'),
                controller: controller.emailController,
                label: email,
                validator: Validators.emailValidator,
              ),
              CustomSizedBox(),
              ElevatedButton(
                key: Key('nextButton'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () async {
                  if (controller.formKey.currentState!.validate()) {
                    final userData = collectUserData();
                    String? userFirebaseUid; // Initialize to null

                    final user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      userFirebaseUid = user.uid;

                      // Check if an image has been selected
                      if (controller.selectedImage.value != null) {
                        final photoURL = await _firebaseService.updateUserPhotoURL(controller.selectedImage.value!, userFirebaseUid);
                        if (photoURL != null) {
                          userData['photoURL'] = photoURL; // Update userData with photoURL
                        } else {
                          // Handle the case where image upload fails
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Failed to upload image'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          return; // Don't proceed if image upload fails
                        }
                      }

                      // Pass the userFirebaseUid and updated userData to uploadUserData
                      final success = await _firebaseService.uploadUserData(userData);

                      if (success) {
                        // Data uploaded successfully
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Data uploaded successfully'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        wizardController.goToNextStep();
                      } else {
                        // Handle the case where data upload fails
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Failed to upload data'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    } else {
                      // Handle the case where no user is signed in
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('No user is signed in'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  }
                },
                child: const Text(next),
              ),
            ],
          ),
        ),
      ),
    );
  }
}