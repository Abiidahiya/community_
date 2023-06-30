import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
signInWithGoogle() async{
  GoogleSignInAccount? googleUser= await GoogleSignIn().signIn();
  GoogleSignInAuthentication googleAuth= await googleUser!.authentication;

  AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
  );
  UserCredential userCredential=await FirebaseAuth.instance.signInWithCredential(credential);
  print(userCredential.user?.displayName);
}
