
import 'package:get/get.dart';
import 'package:community/view/ui/userchat/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ChatScreenController{

  Future<void> goToChatScreen(String userId) async {
    try {
      String chatRoomId = await generateChatRoomId(userId);
      Get.to(() => ChatRoom(chatRoomId: chatRoomId, userMap: {}));
    } catch (e) {
      print("Error navigating to chat screen: $e");
    }
  }

  Future<String> generateChatRoomId(String otherUserId) async {
    try {
      List<String> userIds = [
        FirebaseAuth.instance.currentUser!.uid,
        otherUserId,
      ];
      userIds.sort();
      return '${userIds[0]}_${userIds[1]}';
    } catch (e) {
      print("Error generating chat room ID: $e");
      throw e;
    }
  }

}