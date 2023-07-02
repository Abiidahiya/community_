import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splashScreenVM.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenViewModel>(
        init: SplashScreenViewModel(),
        builder: (controller) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(height: 200, width: 200,
                    child: Image.asset(
                      'assets/images/logo1.png',
                    ),
                  ),
                  SizedBox.fromSize(child: Text('Loading...'),),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}