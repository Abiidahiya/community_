
import 'package:community/view/ui/login_screen.dart';
import 'package:get/get.dart';
import 'package:community/utils/constants.dart';
import 'package:community/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:community/view/ui/home_page.dart';



class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: splashScreenDelay), () {
      Get.offAll(() => LoginScreen());
    });
  }
}