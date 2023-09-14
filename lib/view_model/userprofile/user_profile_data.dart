import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  Future<Map<String, dynamic>> fetchUserData(String uid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> userDoc =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (userDoc.exists) {
        return userDoc.data() ?? {}; // Return user data as a map
      } else {
        return {}; // Return an empty map if the user document doesn't exist
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return {}; // Return an empty map in case of an error
    }
  }
  Future<String?> fetchFirebaseUIDFromFirestore() async {
    try {
      String? firebaseUID = FirebaseAuth.instance.currentUser?.uid;

      if (firebaseUID != null) {
        // Replace 'users' and 'uid' with the actual collection and document paths in your Firestore
        final DocumentSnapshot<Map<String, dynamic>> uidDoc =
        await FirebaseFirestore.instance.collection('users').doc(firebaseUID).get();

        if (uidDoc.exists) {
          return uidDoc.data()?[firebaseUID];
        } else {
          return null; // Return null if the document doesn't exist
        }
      } else {
        return null; // Return null if the Firebase UID is not available
      }
    } catch (e) {
      print('Error fetching Firebase UID: $e');
      return null; // Return null in case of an error
    }
  }}
