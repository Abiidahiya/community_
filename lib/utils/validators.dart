import 'package:community/utils/app_string_res.dart';
class Validators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return blank_email_error;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[a-zA-Z]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return email_error;
    }

    return null;
  }
  static String? firstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return blank_first_name_error;
    }

    final nameRegex = RegExp(r'^[a-zA-Z ]+$');
    if (!nameRegex.hasMatch(value)) {
      return first_name_error;
    }

    return null;
  }
  static String? lastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return blank_last_name_error;
    }

    final nameRegex = RegExp(r'^[a-zA-Z ]+$');
    if (!nameRegex.hasMatch(value)) {
      return last_name_error;
    }

    return null;
  }
  static String? bioValidator(String? value) {
    if (value == null || value.isEmpty) {
      return blank_bio_error;
    }

    final bioRegex = RegExp(r'^[a-zA-Z0-9\s.,!?()]*$');
    if (!bioRegex.hasMatch(value)) {
      return bio_error;
    }

    return null;
  }
  static String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return blank_address_error; // Return an error message for empty input
    }

    final addressRegex = RegExp(r'^[a-zA-Z0-9\s.,!?()]*$');
    if (!addressRegex.hasMatch(value)) {
      return address_error; // Return an error message for invalid format
    }

    return null; // Return null for a valid address
  }
 }

