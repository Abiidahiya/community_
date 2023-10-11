import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/view/ui/userchat/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserSearchController {
  final TextEditingController searchController = TextEditingController();
  List<DocumentSnapshot> searchResults = [];

  Future<void> searchUsers(String query) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('displayName', isGreaterThanOrEqualTo: query)
          .get();
      searchResults = querySnapshot.docs;
    } catch (e) {
      print("Error searching users: $e");
    }
  }


}
