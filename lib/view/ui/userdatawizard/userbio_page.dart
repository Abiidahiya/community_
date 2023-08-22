import 'package:community/utils/dimen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/view_model/userwizard/wizard_controller.dart';
import 'package:community/view_model/userwizard/userbio_controller.dart';
import 'package:community/utils/app_string_res.dart';


class UserBioPage extends StatelessWidget {
  final UserWizardController wizardController = Get.put(UserWizardController());
  final UserBioController bioController = Get.put(UserBioController());

  final _formKey = GlobalKey<FormState>(); // Create a GlobalKey<FormState>

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bio Page'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Form(
        key: _formKey, // Associate the GlobalKey with the Form
        child: Column(
          children: [
            SizedBox(height: Dimen_50,),
            TextFormField(
              key: Key('bioField'),
              controller: bioController.userBioTextController, // Corrected this line
              maxLines: 7,
              decoration: InputDecoration(
                labelText: 'Bio',
                hintText: bio,
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty ||!RegExp(r'^[a-zA-Z0-9\s.,!?()]*$').hasMatch(value)) {
                  return bioerror;
                }
                return null;
              },
            ),
            SizedBox(height: Dimen_100,),
            ElevatedButton(
              key: Key('submitButton'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Validation successful, you can perform additional actions here
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
