import 'package:flutter/material.dart';
import 'package:community/utils/constants/dimen.dart';

class CustomSizedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Flexible width
      height: Dimen_12, // Fixed height
    );
  }
}