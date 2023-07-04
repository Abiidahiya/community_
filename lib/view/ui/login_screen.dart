


import 'package:community/reusable/rounded_button.dart';
import 'package:flutter/material.dart';
import '../../utils/app_string_res.dart';
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



                Container(width: 150,
                  child: const RoundedButton(btnName: 'Google',
                    icon: Icon(Icons.accessibility),
                    textStyle: TextStyle(color: Colors.white ),
                    bgColor: Colors.green,
                  ),
                ),
                Container(width: 150,
                  child: const RoundedButton(btnName: 'Facebook',
                    icon: Icon(Icons.account_box_rounded),
                    textStyle: TextStyle(color: Colors.white ),
                  ),
                ),
                Container(width: 150,
                  child: const RoundedButton(btnName: 'Instagram',
                  icon: Icon(Icons.camera_alt),
                    textStyle: TextStyle(color: Colors.white ),
                    bgColor: Colors.redAccent,
                  ),
                ),



              ],
            ),
          ),
        )
    );
  }
}