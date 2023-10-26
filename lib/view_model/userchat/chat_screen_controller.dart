
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community/utils/model_constants.dart';
import 'package:get/get.dart';
import 'package:community/view/ui/userchat/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ChatScreenController extends GetxController {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> goToChatScreen(String userId) async {
    try {
      String chatRoomId = await generateChatRoomId(userId);
      Get.to(() => ChatRoom(chatRoomId: chatRoomId, userMap: {}, otherUserName: '',));
    } catch (e) {
      print(chat_screen_error);
    }
  }

  Future<String> generateChatRoomId(String otherUserId) async {
    try {
      String currentUserId = FirebaseAuth.instance.currentUser!.uid;
      List<String> userIds = [currentUserId, otherUserId];
      userIds.sort();
      String chatRoomId = '${userIds[0]}_${userIds[1]}';

      // Check if the chat room document exists
      bool chatRoomExists = await doesChatRoomExist(chatRoomId);

      // If the chat room document doesn't  exist, create it
      if (!chatRoomExists) {
        await createChatRoomDocument(chatRoomId);
      }

      return chatRoomId;
    } catch (e) {
      print(chat_id_generating_error);
      throw e;
    }
  }

  Future<bool> doesChatRoomExist(String chatRoomId) async {
    try {
      DocumentSnapshot chatRoomDoc =
      await _firestore.collection(chatroom_collection).doc(chatRoomId).get();

      return chatRoomDoc.exists;
    } catch (e) {
      print(chat_room_check_error);
      throw e;
    }
  }

  Future<void> createChatRoomDocument(String chatRoomId) async {
    try {
      // Create a dummy document or perform necessary initialization
      await _firestore.collection(chatroom_collection).doc(chatRoomId).set({
        'created_at': FieldValue.serverTimestamp(),
        // Add any other fields you may need for initialization
      });
    } catch (e) {
      print(chat_room_creat_error);
      throw e;
    }
  }
}