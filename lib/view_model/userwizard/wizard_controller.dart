import 'package:community/view_model/userwizard/personalinfo_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserWizardController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentStep = 0.obs;
  final RxString profileImagePath = ''.obs;
  final RxString firstName = ''.obs; // Add this
  final RxString lastName = ''.obs;  // Add this
  final RxString email = ''.obs;     // Add this



  Future<XFile?> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    return pickedImage;
  }

  void goToNextStep() {
    if (currentStep.value < 2) {
      currentStep.value++;
      print("Current step: ${currentStep.value}");
    }
  }

  void goToPreviousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }
  String get firstNameValue => firstName.value;
  String get lastNameValue => lastName.value;
  String get emailValue => email.value;
}
