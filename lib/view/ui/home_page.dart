import 'package:flutter/material.dart';
import 'package:community/utils/dimen.dart';
import 'package:community/uicomponents/button/roundedbutton.dart';
import 'package:community/utils/app_string_res.dart';
import 'package:community/utils/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:Center(
          child: RoundedButton(btnName:logout,
            textStyle: TextStyle(color: Colors.white ),
            bgColor:cyan,
            onPressed:(){},

          ),
        )

    );
  }
}