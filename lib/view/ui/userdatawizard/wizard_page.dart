import 'package:community/view/ui/userdatawizard/userbio_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/view_model/userwizard/wizard_controller.dart';
import 'package:community/utils/app_string_res.dart';
import 'package:community/view/ui/userdatawizard/personalinfo_page.dart';
import 'package:community/view/ui/userdatawizard/useraddress_page.dart';


class WizardPage extends StatelessWidget {
  final UserWizardController wizardController = Get.put(UserWizardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(wizardpagemessage),
      ),
      body: Obx(() => Column( // Wrap the whole column with Obx
        children: [
          Expanded(
            child: IndexedStack(
              index: wizardController.currentStep.value,
              children: [

                PersonalInfoPage(),
                UserAddressPage(),
                UserBioPage(),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
