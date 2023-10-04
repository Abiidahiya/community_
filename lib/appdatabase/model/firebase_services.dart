import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community/appdatabase/model/firebase_storage_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:community/appdatabase/model/firebase_storage_services.dart';
import 'dart:io';



class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorageService _storageService = FirebaseStorageService();

  Future<bool> uploadUserData(Map<String, dynamic> userData) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userFirebaseUid = user.uid;
        await _firestore.collection('users').doc(userFirebaseUid).set(userData);
        return true;
      }
      return false; // No user is signed in.
    } catch (e) {
      print('Error uploading data to Firestore: $e');
      return false;
    }

  }
  Future<bool> updateUserBio(String userFirebaseUid, String userBio) async {
    try {
      final userRef = _firestore.collection('users').doc(userFirebaseUid);

      await userRef.update({
        'userbio': userBio,
      });

      return true; // Success
    } catch (e) {
      print('Error updating user bio: $e');
      return false; // Error
    }
  }
  Future<bool> updateUserAddress(String userFirebaseUid, String Address) async {
    try {
      final userRef = _firestore.collection('users').doc(userFirebaseUid);

      await userRef.update({
        'address': Address,
      });

      return true; // Success
    } catch (e) {
      print('Error updating user manual address: $e');
      return false; // Error
    }
  }
  Future<String?> updateUserPhotoURL(File imageFile, String userFirebaseUid) async {
    try {
      // Upload the image to Firebase Storage and get the download URL
      final photoURL = await _storageService.uploadImage(imageFile, userFirebaseUid);

      if (photoURL != null) {
        // Update the user's document in Firestore with the new photoURL
        final userRef = _firestore.collection('users').doc(userFirebaseUid);
        await userRef.update({
          'photoURL': photoURL,
        });

        return photoURL; // Return the download URL
      } else {
        // Handle the case where image upload fails
        return null;
      }
    } catch (e) {
      print('Error updating user photoURL: $e');
      return null; // Error
    }
  }
}