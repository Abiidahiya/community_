import 'package:community/utils/dimen.dart';
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
      appBar: AppBar(
        title: Text(biopage),
        backgroundColor: Colors.blueAccent,
      ),
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
              onPressed: () {
                if (_formKey.currentState!.validate()) {

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
