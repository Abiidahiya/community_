import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> uploadUserData(Map<String, dynamic> userData) async{
    try{
      await _firestore.collection('userpersonaldata').add(userData);
      return true;
    } catch (e) {
      print('Error uploading data to Firestore: $e');
      return false;
    }
  }
}