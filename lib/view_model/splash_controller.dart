
import 'package:community/view/ui/bottom_navigation_screen.dart';
import 'package:community/view/ui/login_screen.dart';
import 'package:get/get.dart';
import 'package:community/utils/constants.dart';
import 'package:community/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:community/view/ui/profile_page.dart';
import 'package:community/utils/constants.dart';
import 'package:community/view/ui/login_screen.dart';



class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkAuthentication();
  }

  Future<void> checkAuthentication() async {
    await Future.delayed(const Duration(seconds: splashScreenDelay)); // Simulate a loading delay

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    if (user != null) {
      // User is already logged in, navigate to the homepage
      Get.offAll(() => BottomNavigationScreen());
    } else {
      // User is not logged in, navigate to the sign-in page
      Get.offAll(() => const LoginScreen());
    }
  }
}