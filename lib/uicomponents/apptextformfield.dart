import 'package:flutter/material.dart';


class AppTextFormField extends StatelessWidget {
  final Key? key;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final InputDecoration? decoration;
  final String label;
  final int? maxLines; // Add maxLines property

  const AppTextFormField({
    this.key,
    required this.controller,
    required this.validator,
    this.decoration,
    required this.label,
    this.maxLines, // Initialize the maxLines property
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      validator: validator,
      maxLines: maxLines, // Set the maxLines property here
    );
  }
}