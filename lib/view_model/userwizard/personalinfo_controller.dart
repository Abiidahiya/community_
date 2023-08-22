import 'dart:io';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:community/view_model/userwizard/wizardtext_controller.dart';

import 'package:image_picker/image_picker.dart';

class PersonalInfoController extends GetxController {
  final WizardTextEditingController firstNameController = WizardTextEditingController();
  final WizardTextEditingController lastNameController = WizardTextEditingController();
  final WizardTextEditingController emailController = WizardTextEditingController();

  final formKey = GlobalKey<FormState>();
  final Rx<File?> selectedImage = Rx<File?>(null);

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      selectedImage.value = File(pickedImage.path);
    }
  }
}