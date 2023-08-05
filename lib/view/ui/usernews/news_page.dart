import 'package:community/utils/font_size_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/utils/app_string_res.dart';
class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(newsPage),
      ),
      body: const Center(
        child: Text(
          newsMessage,
          style: TextStyle(fontSize: largeFontSize),
        ),
      ),
    );
  }
}