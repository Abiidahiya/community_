import 'package:community/utils/app_string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/utils/color.dart';
import 'package:community/utils/dimen.dart';
import 'package:community/view_model/splash_controller.dart';
import 'package:community/uicomponents/images.dart';
import 'package:community/utils/font_size_constants.dart';

class SplashScreen extends StatelessWidget {

  final SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
          return Scaffold(
      body: Center(
        child:
            Container(width: Dimen_200, height: Dimen_300,
                child: Column(
                  children: [
                    Image.asset(Images.mainLogo),
                    const SizedBox(height: Dimen_50),
                    const Text(welcomeSpl,
                      style: TextStyle(fontSize: mediumFontSize, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
            ),


      ),
      backgroundColor: white,

    );

  }
}