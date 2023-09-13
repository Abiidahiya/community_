import 'package:community/utils/dimen.dart';
import 'package:community/view/ui/dashboardui_screen.dart';
import 'package:community/view/ui/usernews/news_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/view_model/userwizard/wizard_controller.dart';
import 'package:community/view_model/userwizard/userbio_controller.dart';
import 'package:community/utils/app_string_res.dart';
import 'package:community/uicomponents/apptextformfield.dart';
import 'package:community/utils/validators.dart';


class UserBioPage extends StatelessWidget {
  final UserWizardController wizardController = Get.put(UserWizardController());
  final UserBioController bioController = Get.put(UserBioController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: Dimen_50,),
            AppTextFormField(
              key: Key('bioField'),
              controller: bioController.userBioTextController,
              maxLines: 7,
              label: bio,
              validator: Validators.bioValidator,
            ),
            SizedBox(height: Dimen_100,),
            ElevatedButton(
              key: Key('submitButton'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary, // Set the button color to primary color from your theme
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Get.to(DashboardUI());

                }
              },
              child: Text(submit),
            ),
          ],
        ),
      ),
    );
  }
}
