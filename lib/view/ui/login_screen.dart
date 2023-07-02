


import 'package:flutter/material.dart';
import '../../view_model/sign_google.dart';
import '../../model/app_string_res.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(welcome),
                const SizedBox(height: 50,),
                SizedBox(height: 200, width: 200,
                  child: Image.asset('assets/images/ic_main_logo.png'),),

                const SizedBox(height: 50),
                const Text(continueWith),



                facebookButton,
                googleButton,
                instagramButton,

              ],
            ),
          ),
        )
    );
  }
}