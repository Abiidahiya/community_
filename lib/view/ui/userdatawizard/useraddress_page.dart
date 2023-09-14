import 'package:community/utils/app_string_res.dart';
import 'package:community/utils/constants/dimen.dart';
import 'package:community/utils/firebase_services.dart';
import 'package:community/utils/validators.dart';
import 'package:community/view_model/userwizard/useraddress_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/view_model/userwizard/wizard_controller.dart';

import 'package:community/uicomponents/appdropdownformfield.dart';
import 'package:community/uicomponents/customsizedbox.dart';



class UserAddressPage extends StatelessWidget {
  final UserAddressController controller = Get.put(UserAddressController());
  final UserWizardController wizardController = Get.find<UserWizardController>();

  final formKey = GlobalKey<FormState>();
  final FirebaseService _firebaseService = FirebaseService();

  UserAddressPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Form(
          key: formKey, // Add the Form widget with the formKey here
          child: Column(
            children: [
              CustomSizedBox(),
              appDropdownFormField(
                value: controller.selectedAddress.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedAddress.value = value;
                    controller.enableDropdowns();
                  }
                },
                items: controller.addressList,
                labelText: 'Address 1', // Change to your label
              ),
              CustomSizedBox(),
              appDropdownFormField(
                value: controller.selectedVillage.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedVillage.value = value;
                    controller.enableDropdowns();
                  }
                },
                items: controller.villageList,
                labelText: 'Village', // Change to your label
              ),
              CustomSizedBox(),
              appDropdownFormField(
                value: controller.selectedTown.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedTown.value = value;
                    controller.enableDropdowns();
                  }
                },
                items: controller.townList,
                labelText: 'Town', // Change to your label
              ),
              CustomSizedBox(),
              appDropdownFormField(
                value: controller.selectedState.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedState.value = value;
                    controller.enableDropdowns();
                  }
                },
                items: controller.stateList,
                labelText: 'State', // Change to your label
              ),
              CustomSizedBox(),
              appDropdownFormField(
                value: controller.selectedCountry.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedCountry.value = value;
                    controller.enableDropdowns();
                  }
                },
                items: controller.countryList,
                labelText: 'Country', // Change to your label
              ),
              SizedBox(height: Dimen_20),
              Container(
                child: Text('Or'),
              ),
              TextFormField(
                controller: controller.manualAddressController,
                validator: Validators.addressValidator,
                decoration: InputDecoration(
                  labelText: 'Manual Address',
                ),
              ),
              SizedBox(height: Dimen_16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () async {
                  // Validate the form using the formKey
                  if (formKey.currentState!.validate()) {
                    final user = FirebaseAuth.instance.currentUser;

                    if (user != null) {
                      final userFirebaseUid = user.uid;
                      final userAddress = controller.manualAddressController.text;

                      // Update the user's document in Firestore with the address
                      final success = await _firebaseService.updateUserAddress(userFirebaseUid, userAddress);

                      if (success) {
                        // Data uploaded successfully
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Address uploaded successfully'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        wizardController.goToNextStep();
                      } else {
                        // Handle the case where data upload fails
                      }
                    } else {
                      // Handle the case where no user is signed in
                    }
                  }
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}