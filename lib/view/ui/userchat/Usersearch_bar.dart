import 'package:flutter/material.dart';
import 'package:community/utils/app_string_res.dart';
import 'package:community/utils/model_constants.dart';
import 'package:get/get.dart';

import '../../../view_model/userchat/chat_screen_controller.dart';
import '../../../view_model/userchat/user_search_controller.dart';





class UserSearchWidget extends StatelessWidget {
  final UserSearchController _controller = Get.put(UserSearchController());
  final ChatScreenController _chatController = ChatScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user_search),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _controller.searchController,
              decoration: InputDecoration(
                hintText: user_search_message,
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _controller.searchUsers(
                        _controller.searchController.text);
                  },
                ),
              ),
            ),
            Expanded(child: _buildSearchResults()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    return Obx(() {
      if (_controller.searchResults.isEmpty) {
        return Center(
          child: Text(user_not_found),
        );
      } else {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: _controller.searchResults.length,
          itemBuilder: (context, index) {
            final userDoc = _controller.searchResults[index];
            // Customize based on your user document structure
            final uid = userDoc.id;
            final photoURL = userDoc[profile_pic];
            final displayName = userDoc[user_name];
            final email = userDoc[user_email];

            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                photoURL != null ? NetworkImage(photoURL) : null,
              ),
              title: Text(displayName),
              subtitle: Text(email),
              // Customize as needed
              trailing: IconButton(
                icon: Icon(Icons.chat),
                onPressed: () {
                  _chatController.goToChatScreen(uid);
                },
              ),
              onTap: () {
                _chatController.goToChatScreen(uid);
              },
            );
          },
        );
      }
    });
  }
}

