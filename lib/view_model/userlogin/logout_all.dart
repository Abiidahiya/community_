import 'package:community/view/ui/appscreens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> logout() async {
    try {
      await _auth.signOut();

      Get.offAll(LoginScreen()); // Navigate to the login screen after logout
    } catch (e) {

      print("Error during logout: $e");

    }
  }
}