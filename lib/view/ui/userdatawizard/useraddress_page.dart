import 'package:community/utils/app_string_res.dart';
import 'package:community/utils/dimen.dart';
import 'package:community/view_model/userwizard/useraddress_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/view_model/userwizard/wizard_controller.dart';

import 'package:community/uicomponents/appdropdownformfield.dart';
import 'package:community/uicomponents/customsizedbox.dart';



class UserAddressPage extends StatelessWidget {
  final UserAddressController controller = Get.put(UserAddressController());
  final UserWizardController wizardController = Get.find<
      UserWizardController>();

  UserAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
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
              decoration: InputDecoration(
                labelText: address,
              ),
            ),
            SizedBox(height: Dimen_16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary, // Set the button color to primary color from your theme
              ),
              onPressed: () {
                // Navigate to the next step
                wizardController.goToNextStep();
              },
              child: Text(next), // Change to your label
            ),
          ],
        ),
      ),
    );
  }

}