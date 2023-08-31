import 'package:get/get.dart';
import 'package:community/view_model/userwizard/wizardtext_controller.dart';

class UserBioController extends GetxController {
  WizardTextEditingController userBioTextController = WizardTextEditingController();

  @override
  void onClose() {
    userBioTextController.dispose();
    super.onClose();
  }
}