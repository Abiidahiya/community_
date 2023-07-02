import 'package:flutter/material.dart';
import 'sign_google.dart';
import 'AppStringRes.dart';
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
                const Text('Welcome to the vegan community.'),
                SizedBox(height: 200, width: 200,
                  child: Image.asset('assets/logo.png'),),

                const SizedBox(height: 50),
                const Text(continueWith),



                ElevatedButton(
                    style:ElevatedButton.styleFrom(),
                    onPressed: (){

                    }, child: const Text('Facebook ')),
                ElevatedButton(
                    style:ElevatedButton.styleFrom(),
                    onPressed: (){
                      signInWithGoogle();
                      },
                    child: const Text('Google')),
                ElevatedButton(
                    style:ElevatedButton.styleFrom(),
                    onPressed: (){

                    }, child: const Text('Instagram')),

              ],
            ),
          ),
        )
    );
  }
}