import 'package:get/get.dart';
import 'package:community/view_model/userwizard/wizardtext_controller.dart';
import 'package:community/utils/useraddress.dart';
import 'package:flutter/material.dart';

class UserAddressController extends GetxController {
  final RxString selectedAddress = 'Address 1'.obs;
  final RxString selectedVillage = 'Village 1'.obs;
  final RxString selectedTown = 'Town 1'.obs;
  final RxString selectedState = 'State 1'.obs;
  final RxString selectedCountry = 'Country 1'.obs;
  final RxBool isAddressManualEnabled = false.obs;

  final formKey = GlobalKey<FormState>();


  final WizardTextEditingController manualAddressController = WizardTextEditingController();
  final FocusNode manualAddressFocus = FocusNode();

  final List<String> addressList = DropdownLists.addressList;
  final List<String> villageList = DropdownLists.villageList;
  final List<String> townList = DropdownLists.townList;
  final List<String> stateList = DropdownLists.stateList;
  final List<String> countryList = DropdownLists.countryList;

  void enableDropdowns() {
    isAddressManualEnabled.value = false;
  }

  void enableManualAddress() {
    isAddressManualEnabled.value = true;
  }

}