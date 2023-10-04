import 'package:flutter_test/flutter_test.dart';
import 'package:community/utils/validators.dart';
import 'package:community/utils/app_string_res.dart';


void main() {
  group('Validators Tests', () {
    test('Email Validator - Valid Email', () {
      final validEmail = '123abc@example.com';
      final result = Validators.emailValidator(validEmail);
      expect(result, isNull);
    });

    test('Email Validator - Invalid Email', () {
      final invalidEmail = 'invalid@email@com';
      final result = Validators.emailValidator(invalidEmail);
      expect(result, equals(email_error));
    });

    test('Email Validator - Blank Email', () {
      final blankEmail = null;
      final result = Validators.emailValidator(blankEmail);
      expect(result, equals(blank_email_error));
    });

    test('First Name Validator - Valid Name', () {
      final validName = 'John';
      final result = Validators.firstNameValidator(validName);
      expect(result, isNull);
    });

    test('First Name Validator - Invalid Name', () {
      final invalidName = '1234';
      final result = Validators.firstNameValidator(invalidName);
      expect(result, equals(first_name_error));
    });

    test('First Name Validator - Blank First Name', () {
      final blankFirstName = null;
      final result = Validators.firstNameValidator(blankFirstName);
      expect(result, equals(blank_first_name_error));
    });

    test('Last Name Validator - Valid Name', () {
      final validName = 'Cena';
      final result = Validators.lastNameValidator(validName);
      expect(result, isNull);
    });

    test('Last Name Validator - Invalid Name', () {
      final invalidName = '1234';
      final result = Validators.lastNameValidator(invalidName);
      expect(result, equals(last_name_error));
    });

    test('Last Name Validator - Blank Last Name', () {
      final blankLastName = null;
      final result = Validators.lastNameValidator(blankLastName);
      expect(result, equals(blank_last_name_error));
    });

    test('User Bio Validator - Valid Bio', () {
      final validBio = 'Hello, my number is 12345678';
      final result = Validators.bioValidator(validBio);
      expect(result, isNull);
    });

    test('User Bio Validator - Invalid Bio', () {
      final invalidBio = 'Hello, my number is 12345678!@#%^&';
      final result = Validators.bioValidator(invalidBio);
      expect(result, equals(bio_error));
    });

    test('User Bio Validator - Blank Bio', () {
      final blankBio = null;
      final result = Validators.bioValidator(blankBio);
      expect(result, equals(blank_bio_error));
    });

    test('User Address Validator - Valid Address', () {
      final validAddress = 'House no 12345678, xyz city, abc country';
      final result = Validators.bioValidator(validAddress);
      expect(result, isNull);
    });

    test('User Address Validator - Invalid Address', () {
      final invalidAddress= 'House number 12!@ 12345678!@#%^&';
      final result = Validators.addressValidator(invalidAddress);
      expect(result, equals(address_error));
    });

    test('User Bio Validator - Blank Address', () {
      final blankAddress = null;
      final result = Validators.addressValidator(blankAddress);
      expect(result, equals(blank_address_error));
    });




  });
}