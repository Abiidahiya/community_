import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community/uicomponents/images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:community/view_model/userchat/chatlist_controller.dart';
import 'package:get/get.dart';
import 'package:community/view/ui/userchat/Usersearch_bar.dart';
import 'package:community/uicomponents/images.dart';
import 'package:community/utils/app_string_res.dart';
import 'package:community/utils/model_constants.dart';
import 'chat_screen.dart';

class ChatListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chat_list_message),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Get.to(() => UserSearchWidget());
            },
          ),
        ],
      ),
      body: ChatList(),
    );
  }
}

class ChatList extends StatelessWidget {
  final ChatController _chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (_chatController.isLoading.value) {
          return CircularProgressIndicator();
        } else if (_chatController.hasError.value) {
          return Text('${chat_id_error}${_chatController.errorMessage.value}');;
        } else if (_chatController.chatRoomIds.isEmpty) {
          return Text(no_chats_message);
        }

        return ListView.builder(
          itemCount: _chatController.chatRoomIds.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: FutureBuilder<Map<String, String>>(
            future: _chatController.getOtherUserData(_chatController.chatRoomIds[index]),
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return Text(loading);
              } else if (userSnapshot.hasError) {
                return Text('$user_data_error_message${userSnapshot.error}');;
              } else if (!userSnapshot.hasData || userSnapshot.data == null) {
                return Text(unknown_user);
              }

              String otherUserName = userSnapshot.data![user_name] as String;
              String? otherUserPhotoURL = userSnapshot.data![profile_pic];

              return ListTile(
                title: Text(otherUserName),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: otherUserPhotoURL != null && otherUserPhotoURL.isNotEmpty
                      ? NetworkImage(otherUserPhotoURL)
                      : AssetImage(Images.blankdp) as ImageProvider<Object>?,
                ),
                onTap: () {
                  // Navigate to the ChatRoom with the selected chat room ID
                  Get.to(() => ChatRoom(chatRoomId: _chatController.chatRoomIds[index], userMap: {}));
                },
              );
            },
            ),
            );
          },
        );
      }),
    );
  }
}


