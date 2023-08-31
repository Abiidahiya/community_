import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/view_model/userwizard/wizard_controller.dart';
import 'package:community/utils/app_string_res.dart';
import 'package:community/utils/dimen.dart';
import 'package:community/view_model/userwizard/personalinfo_controller.dart';
import 'package:community/uicomponents/apptextformfield.dart';
import 'package:community/utils/validators.dart';
import 'package:community/uicomponents/customsizedbox.dart';


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
      ),
    );
  }
}