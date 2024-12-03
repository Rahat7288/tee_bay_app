import 'package:flutter/material.dart';

Widget customInputField({
  required TextEditingController controller,
  required TextInputType type,
  required String labelText,
  required String hintText,
  required ValueChanged<String> onChanged,
}) =>
    TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: labelText,
        hintText: hintText,
      ),
      onChanged: onChanged,
      keyboardType: type,
    );
