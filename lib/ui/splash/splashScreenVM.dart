import 'dart:async';

import 'package:community/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {

  @override
  void onInit() {
    Timer(Duration(seconds: 2), (){
      Get.toNamed('LoginScreen()');
    },
    );
    super.onInit();


  }


}