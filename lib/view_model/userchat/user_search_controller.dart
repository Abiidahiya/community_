import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/utils/model_constants.dart';



class UserSearchController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  RxList<DocumentSnapshot> searchResults = <DocumentSnapshot>[].obs;

  Future<void> searchUsers(String query) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(user_collection)
          .where(user_name, isGreaterThanOrEqualTo: query)
          .get();
      searchResults.assignAll(querySnapshot.docs);
    } catch (e) {
      print(user_search_error);
    }
  }
}