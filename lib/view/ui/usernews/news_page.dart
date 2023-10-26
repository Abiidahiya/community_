import 'package:community/utils/constants/font_size_constants.dart';
import 'package:community/view/ui/userchat/Usersearch_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/utils/app_string_res.dart';
import 'package:community/view/ui/userchat/chatlist_page.dart';


class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsPage),
        actions: [
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              Get.to(() => ChatListPage());
            },
          ),
        ],
      ),
      body:
          const Center(
            child: Text(
              newsMessage,
              style: TextStyle(fontSize: 20),
            ),
          ),


    );
  }
}