import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:community/view/ui/home_page.dart';
Future<void> signInWithGoogle() async {
  try {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential =
    await FirebaseAuth.instance.signInWithCredential(credential);

    print(userCredential.user?.displayName);

    // Navigate to the Home Page using GetX
    Get.off(() => const HomePage());
  } catch (e) {
    print('Error signing in with Google: $e');
    // Handle the error appropriately, such as showing an error message
  }
}