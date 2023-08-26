import 'package:community/utils/app_string_res.dart';
class Validators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return emailerror;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[a-zA-Z]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return emailerror;
    }

    return null;
  }
  static String? firstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return firstnameerror;
    }

    final nameRegex = RegExp(r'^[a-zA-Z ]+$');
    if (!nameRegex.hasMatch(value)) {
      return firstnameerror;
    }

    return null;
  }
  static String? lastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return lastnameerror;
    }

    final nameRegex = RegExp(r'^[a-zA-Z ]+$');
    if (!nameRegex.hasMatch(value)) {
      return lastnameerror;
    }

    return null;
  }
  static String? bioValidator(String? value) {
    if (value == null || value.isEmpty) {
      return bioerror;
    }

    final bioRegex = RegExp(r'^[a-zA-Z0-9\s.,!?()]*$');
    if (!bioRegex.hasMatch(value)) {
      return bioerror;
    }

    return null;
  }
}
