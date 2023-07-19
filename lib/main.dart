
import 'package:community/view/ui/login_screen.dart';
import 'package:community/view/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:community/view_model/logout_all.dart';

void main() async {WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
Get.put(LogoutController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

