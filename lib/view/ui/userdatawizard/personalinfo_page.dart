import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/view_model/userwizard/wizard_controller.dart';
import 'package:community/utils/app_string_res.dart';
import 'package:community/utils/dimen.dart';
import 'package:community/view_model/userwizard/personalinfo_controller.dart';



class PersonalInfoPage extends StatelessWidget {
  final PersonalInfoController controller = Get.put(PersonalInfoController());
  final UserWizardController wizardController = Get.put(UserWizardController());

  PersonalInfoPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(personalinfomessage),
        backgroundColor: Colors.blueAccent,
      ),
      body: Form(
        key: controller.formKey, // Add a form key
        child: Column(
          children: [
            ElevatedButton(
              onPressed: controller.pickImage,
              child: const Text(imagepickertext),
            ),
            const SizedBox(height: Dimen_20),
            Obx(() {
              return controller.selectedImage.value != null
                  ? Image.file(controller.selectedImage.value!)
                  : Container();
            }),
            TextFormField(
              key: Key('firstNameField'),
              controller: controller.firstNameController,
              decoration: const InputDecoration(labelText: firstname),
              validator: (value) {
                if (value!.isEmpty ||!RegExp(r'^[a-z A-Z]').hasMatch(value!)) {
                  return firstnameerror;
                }
                return null;
              },
            ),
            TextFormField(
              key: Key('lastNameField'),
              controller: controller.lastNameController,
              decoration: const InputDecoration(labelText: lastname),
              validator: (value) {
                if (value!.isEmpty ||!RegExp(r'^[a-z A-Z]').hasMatch(value!)) {
                  return lastnameerror;
                }
                return null;
              },
            ),
            TextFormField(
              key: Key('emailField'),
              controller: controller.emailController,
              decoration: const InputDecoration(labelText: email),
              validator: (value) {
                if (value!.isEmpty ||!RegExp(r'^[\w-\.]+@([\w-]+\.)+[a-z A-Z]{2,4}$').hasMatch(value!)) {
                  return emailerror;
                }
                return null;
              },
            ),
            ElevatedButton(
              key: Key('nextButton'),
              onPressed: () {
                if (controller.formKey.currentState!.validate()) {
                  // Validation passed, navigate to the next step
                  wizardController.goToNextStep();
                }
              },
              child: const Text(next),
            ),
          ],
        ),
      ),
    );
  }
}