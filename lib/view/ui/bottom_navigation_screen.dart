import 'package:community/utils/app_string_res.dart';
import 'package:community/view/ui/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/view/ui/news_page.dart';
import 'package:community/view/ui/map_page.dart';
import 'package:community/view/ui/history_page.dart';

class BottomNavigationScreen extends StatelessWidget {
  final _pageController = PageController();
  final _selectedItem = 0.obs; // Use RxInt to make _selectedItem observable

  BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          _selectedItem.value = index; // Update _selectedItem using RxInt
        },
        controller: _pageController,
        children: [
          NewsPage(),
          MapPage(),
          HistoryPage(),
          ProfilePage()
        ], // Provide the controller to PageView
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Set the type to fixed
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: newsPage),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_outlined), label: mapPage),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm_rounded), label: historyPage),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: profilePage),
        ],
        currentIndex: _selectedItem.value,
        onTap: (index) {
          _selectedItem.value = index; // Update _selectedItem using RxInt
          _pageController.animateToPage(
            _selectedItem.value,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
      )),
    );
  }
}