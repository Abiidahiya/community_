import 'package:flutter/material.dart';
import 'dart:core';
import 'package:community/utils/constants/dimen.dart';

class RoundedButton extends StatelessWidget{
  final String btnName;
  final Icon? icon;
  final Color? bgColor;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

      const RoundedButton({super.key,
    required this.btnName, this.icon, this.bgColor, this.textStyle, this.onPressed,
});


      @override
  Widget build(BuildContext context) {
    return Container(width: Dimen_150,
      child: ElevatedButton(
          onPressed:onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        )
      ),
          child: icon!=null ? Row(
            children: [
              icon!,
              Text(btnName)
            ],
          ) : Text(btnName),),
    );
  }

}