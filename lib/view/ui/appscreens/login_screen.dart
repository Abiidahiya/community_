


import 'package:community/uicomponents/button/roundedbutton.dart';
import 'package:community/utils/constants/dimen.dart';
import 'package:community/view_model/userlogin/sign_google.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_string_res.dart';
import 'package:community/utils/constants/color.dart';
import 'package:community/uicomponents/images.dart';
import 'package:community/view_model/userlogin/sign_facebook.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FacebookLoginController facebookLoginController = Get.put(FacebookLoginController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimen_10),
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(welcome),
                const SizedBox(height: Dimen_150,),
                SizedBox(height: Dimen_200, width: Dimen_200,
                  child: Image.asset(Images.mainLogo),
                ),

                const SizedBox(height: Dimen_200),
                const Text(continueWith),
                const SizedBox(height: Dimen_24,),



                Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Dimen_50,width: Dimen_150,
                      child: RoundedButton(btnName: google,
                        icon: Icon(FontAwesomeIcons.google),
                        textStyle: TextStyle(color: Colors.white ),
                        bgColor:Colors.deepOrange ,
                        onPressed: signInWithGoogle,
                      ),
                    ),
                SizedBox(width: Dimen_16,),

                SizedBox(height: Dimen_50, width: Dimen_150,
                  child: RoundedButton(btnName: facebook,
                    icon: Icon(FontAwesomeIcons.facebook),
                    textStyle: TextStyle(color: Colors.white ),
                    bgColor:blue,
                    onPressed: facebookLoginController.loginWithFacebook,
                  ),
                ),
                  ],
                ),




              ],
            ),
          ),
        )
    );
  }
}