import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/view_model/userwizard/wizard_controller.dart';
import 'package:community/utils/app_string_res.dart';
import 'package:community/utils/dimen.dart';
import 'package:community/view_model/userwizard/personalinfo_controller.dart';
import 'package:community/uicomponents/apptextformfield.dart';
import 'package:community/utils/validators.dart';



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
            AppTextFormField(
              key: Key('firstNameField'),
              controller: controller.firstNameController,
                label: 'First Name',
              validator: Validators.firstNameValidator,
            ),
            SizedBox(height: Dimen_12,),
            AppTextFormField(
              key: Key('lastNameField'),
              controller: controller.lastNameController,
              label: lastname,
              validator: Validators.lastNameValidator,

            ),
            SizedBox(height: Dimen_12,),
            AppTextFormField(
              key: Key('emailField'),
              controller: controller.emailController,
              label: email,
              validator: Validators.emailValidator,
            ),
            SizedBox(height: Dimen_12,),
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