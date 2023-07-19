
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:community/view/ui/home_page.dart';
class FacebookLoginController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> loginWithFacebook() async {
    try {
      isLoading.value = true;

      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken? accessToken = result.accessToken;

        if (accessToken != null) {

          Get.off(HomePage);

        } else {
          Get.snackbar('Error', 'Failed to get access token');
        }
      } else if (result.status == LoginStatus.cancelled) {
        Get.snackbar('Cancelled', 'Facebook login cancelled');
      } else {
        Get.snackbar('Error', 'Facebook login failed');
      }
    } catch (e) {
      print('Error logging in with Facebook: $e');
      Get.snackbar('Error', 'Failed to login with Facebook');
    } finally {
      isLoading.value = false;
    }
  }
}