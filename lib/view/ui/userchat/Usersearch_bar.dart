import 'package:flutter/material.dart';
import 'package:community/view_model/userchat/user_search_controller.dart';
import 'package:community/utils/app_string_res.dart';
import 'package:community/view_model/userchat/chat_screen_controller.dart';

class UserSearchWidget extends StatefulWidget {
  @override
  _UserSearchWidgetState createState() => _UserSearchWidgetState();
}

class _UserSearchWidgetState extends State<UserSearchWidget> {
  final UserSearchController _controller = UserSearchController();
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
                    _controller.searchUsers(_controller.searchController.text);
                    setState(() {});
                  },
                ),
              ),
            ),
            _buildSearchResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    if (_controller.searchResults.isEmpty) {
      return Center(
        child: Text(user_search_result),
      );
    } else {
      return Expanded(
        child: ListView.builder(
          itemCount: _controller.searchResults.length,
          itemBuilder: (context, index) {
            final userDoc = _controller.searchResults[index];
            final uid = userDoc.id;
            final photoURL = userDoc['photoURL'];
            final displayName = userDoc['displayName'];
            final email = userDoc['email'];

            return ListTile(
              leading: CircleAvatar(
                backgroundImage: photoURL != null
                    ? NetworkImage(photoURL)
                    : null,
              ),
              title: Text(displayName),
              subtitle: Text(email),
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
        ),
      );
    }
  }
}