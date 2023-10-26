import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community/utils/model_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:community/utils/model_constants.dart';

import '../../utils/app_string_res.dart';



class ChatController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoading = true.obs;
  RxList<String> chatRoomIds = <String>[].obs;
  RxBool hasError = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadChatRoomIds();
  }

  Future<void> loadChatRoomIds() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection(chatroom_collection).get();

      String currentUserUid = _auth.currentUser!.uid;

      List<String> ids = [];

      querySnapshot.docs.forEach((doc) {
        String documentName = doc.id;
        List<String> userIDs = documentName.split('_');

        if (userIDs.contains(currentUserUid)) {
          ids.add(documentName);
        }
      });

      chatRoomIds.value = ids;
      isLoading.value = false;
    } catch (e) {
      hasError.value = true;
      errorMessage.value = '$e';
      print(chat_id_fetch_error);
    }
  }

  Future<Map<String, String>> getOtherUserData(String chatRoomId) async {
    try {
      // Split the chatRoomId to get the user IDs
      List<String> userIDs = chatRoomId.split('_');

      // Remove the current user ID from the list of participants
      userIDs.remove(_auth.currentUser!.uid);

      if (userIDs.isNotEmpty) {
        // Assuming 'users' is the collection where user data is stored
        String otherUserID = userIDs.first;
        DocumentSnapshot userDoc = await _firestore.collection(user_collection).doc(otherUserID).get();

        // Check if the user document exists
        if (userDoc.exists) {
          Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;

          if (userData != null && userData[user_name] != null) {
            // Access 'displayName' and 'photoURL' fields
            String displayName = userData[user_name].toString();
            String photoURL = userData[profile_pic] != null ? userData[profile_pic].toString() : '';

            // Return a map containing user data
            return {user_name: displayName, profile_pic: photoURL};
          } else {
            // User data is incomplete
            return {user_name: unknown_user, profile_pic: ''};
          }
        } else {
          // User document doesn't exist
          return {user_name: unknown_user, profile_pic: ''};
        }
      } else {
        // No other user ID in the chat room
        return {user_name: unknown_user, profile_pic: ''};
      }
    } catch (e) {
      print(other_user_data_error);
      throw e;
    }
  }
}




