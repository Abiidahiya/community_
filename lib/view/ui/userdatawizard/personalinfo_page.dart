import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/view_model/userwizard/wizard_controller.dart';
import 'package:community/utils/app_string_res.dart';
import 'package:community/utils/dimen.dart';
import 'package:community/view_model/userwizard/personalinfo_controller.dart';
import 'package:community/uicomponents/apptextformfield.dart';
import 'package:community/utils/validators.dart';
import 'package:community/uicomponents/customsizedbox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community/utils/firebase_service.dart';

class PersonalInfoPage extends StatelessWidget {
  final PersonalInfoController controller = Get.put(PersonalInfoController());
  final UserWizardController wizardController = Get.put(UserWizardController());

  PersonalInfoPage({super.key});

  final formKey = GlobalKey<FormState>();
  final FirebaseService _firebaseService = FirebaseService();

  Map<String, dynamic> collectUserData() {
    return {
      'firstName': controller.firstNameController.text,
      'lastName': controller.lastNameController.text,
      'email': controller.emailController.text,

    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(personalinfomessage),
        backgroundColor: Colors.blueAccent,
      ),
      body: Form(
        key: controller.formKey,
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
                onPressed: () async {
                  if (controller.formKey.currentState!.validate()) {
                    final userData = collectUserData();
                    final success = await _firebaseService.uploadUserData(userData);

                    if (success) {

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Data uploaded successfully'),
                          duration: Duration(seconds: 2),
                        ),
                      );


                      wizardController.goToNextStep();
                    } else {

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