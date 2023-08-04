import 'package:community/utils/app_string_res.dart';
import 'package:community/view/ui/userhistory/history_page.dart';
import 'package:community/view/ui/usermap/map_page.dart';
import 'package:community/view/ui/usernews/news_page.dart';
import 'package:community/view/ui/userprofile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DashboardUI extends StatelessWidget {
  final _pageController = PageController();
  final _selectedItem = 0.obs; // Use RxInt to make _selectedItem observable

  DashboardUI({Key? key}) : super(key: key);

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
          ProfilePage(),
        ], // Provide the controller to PageView
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() => BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Set the type to fixed
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home), label: newsPage),
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
    ));
  }
}