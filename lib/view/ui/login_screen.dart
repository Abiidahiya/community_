


import 'package:community/uicomponents/button/roundedbutton.dart';
import 'package:community/utils/dimen.dart';
import 'package:flutter/material.dart';
import '../../utils/app_string_res.dart';
import 'package:community/utils/color.dart';
import 'package:community/uicomponents/images.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('login'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimen_10),
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(welcome),
                const SizedBox(height: Dimen_50,),
                SizedBox(height: 200, width: 200,
                  child: Image.asset(Images.mainLogo),
                ),

                const SizedBox(height: 50),
                const Text(continueWith),



                RoundedButton(btnName: google,
                  icon: Icon(Icons.account_circle),
                  textStyle: TextStyle(color: Colors.white ),
                  bgColor:green ,
                ),
                RoundedButton(btnName: facebook,
                  icon: Icon(Icons.accessibility),
                  textStyle: TextStyle(color: Colors.white ),
                  bgColor:blue,
                ),
                RoundedButton(btnName: instagram,
                  icon: Icon(Icons.camera_alt),
                  textStyle: TextStyle(color: Colors.white ),
                  bgColor: red,
                ),



              ],
            ),
          ),
        )
    );
  }
}