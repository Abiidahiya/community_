import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> uploadDataToFirestore({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    try {
      await _firestore.collection('userpersonaldata').add({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,

      });
      return true;
    } catch (e) {
      print('Error uploading data to Firestore: $e');
      return false;
    }
  }
}