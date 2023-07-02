import 'dart:async';

import 'package:community/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {

  @override
  void onReady(){
    super.onReady();
    Future.delayed(Duration(seconds: 3), () {
      Get.off(LoginScreen());
    });


  }


}