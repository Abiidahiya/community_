
import 'package:community/view/ui/appscreens/login_screen.dart';
import 'package:community/view/ui/appscreens/splash_screen.dart';
import 'package:community/view/ui/userdatawizard/wizard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:community/view_model/userlogin/logout_all.dart';
import 'package:community/utils/themes.dart';
import 'package:community/view_model/nearbyusers/nearby_users_controller.dart';


void main() async {WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
Get.put(LogoutController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}

