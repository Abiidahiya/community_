import 'package:flutter/material.dart';


Widget appDropdownFormField({
  required String value,
  required void Function(String?) onChanged,
  required List<String> items,
  required String labelText,
}) {
  return DropdownButtonFormField<String>(
    value: value,
    onChanged: onChanged,
    items: items
        .map((item) => DropdownMenuItem(
      value: item,
      child: Text(item),
    ))
        .toList(),
    decoration: InputDecoration(labelText: labelText),
  );
}

