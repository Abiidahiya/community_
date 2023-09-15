import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community/view/ui/appscreens/dashboardui_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:community/view/ui/userprofile/profile_page.dart';



Future<void> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser =
    await GoogleSignIn(scopes: ['email', 'profile']).signIn();

    if (googleUser != null) {
      final String? displayName = googleUser.displayName;
      final String? email = googleUser.email;
      final String? photoURL = googleUser.photoUrl;

      print('displayName: $displayName');
      print('email: $email');
      print('photoURL: $photoURL');

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      final String userId = userCredential.user?.uid ?? '';
      print('Firebase UID: $userId');

      final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
      final userDoc = await userRef.get();

      if (userDoc.exists) {
        final data = userDoc.data();
        final Map<String, dynamic> dataToUpdate = {};

        if (data == null || data['displayName'] == null) {
          dataToUpdate['displayName'] = displayName;
        }
        if (data == null || data['email'] == null) {
          dataToUpdate['email'] = email;
        }
        if (photoURL != null && (data == null || data['photoURL'] == null)) {
          dataToUpdate['photoURL'] = photoURL;
        }

        if (dataToUpdate.isNotEmpty) {
          await userRef.update(dataToUpdate);
          print('User data updated with Google credentials');
        }
      } else {
        // If the document doesn't exist, set it with Google credentials
        await userRef.set({
          'displayName': displayName,
          'email': email,
          if (photoURL != null) 'photoURL': photoURL,
        });
        print('User document created with Google credentials');
      }

      print('User signed in with Google: $displayName');
      Get.off(() => DashboardUI());
    }
  } catch (e) {
    print('Error signing in with Google: $e');
  }
}