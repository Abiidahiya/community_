import 'package:community/utils/app_string_res.dart';
import 'package:community/view/ui/userhistory/history_page.dart';
import 'package:community/view/ui/usermap/map_page.dart';
import 'package:community/view/ui/usernews/news_page.dart';
import 'package:community/view/ui/userprofile/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/view/ui/nearbyusers/nearby_users_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class DashboardController extends GetxController {
  final PageController pageController = PageController();
  final RxInt selectedItem = 0.obs;
  final RxString userId = FirebaseAuth.instance.currentUser?.uid.obs ?? 'defaultUserId'.obs;
}

class DashboardUI extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          controller.selectedItem.value = index;
        },
        controller: controller.pageController,
        children: [
          NewsPage(),
          NearbyUsersPage(),
          MapPage(),
          HistoryPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Obx(() => _buildBottomNavigationBar()),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: newsPage),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.userGroup), label: nearbyPage),
        BottomNavigationBarItem(icon: Icon(Icons.account_balance_outlined), label: mapPage),
        BottomNavigationBarItem(icon: Icon(Icons.access_alarm_rounded), label: historyPage),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: profilePage),
      ],
      currentIndex: controller.selectedItem.value,
      onTap: (index) {
        controller.selectedItem.value = index;
        controller.pageController.animateToPage(
          controller.selectedItem.value,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      },
    );
  }
}