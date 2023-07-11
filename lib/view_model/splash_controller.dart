
import 'package:community/view/ui/login_screen.dart';
import 'package:get/get.dart';
import 'package:community/utils/constants.dart';


class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: splashScreenDelay), () {
      Get.offAll(() => LoginScreen());
    });
  }
}