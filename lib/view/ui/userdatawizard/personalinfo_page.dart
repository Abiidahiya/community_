import 'package:community/appdatabase/model/firebase_storage_services.dart';
import 'package:community/appdatabase/model/personalinfo_form_submission.dart';
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
                child: const Text(imagepicker_text),
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
                label: last_name,
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
                  handleFormSubmission(
                    context,
                    controller.formKey,
                    collectUserData,
                    _firebaseService,
                    wizardController,
                    controller,
                  );
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