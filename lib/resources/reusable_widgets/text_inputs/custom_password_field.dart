import 'package:flutter/material.dart';

Widget customPasswordField({
  required TextEditingController controller,
  required String labelText,
  required String hintText,
  required bool isObscure,
  required IconData suffixIcon,
  required ValueChanged<String> onChanged,
  required TextInputAction textInputAction,
  required Function() press,
}) =>
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: labelText,
          hintText: hintText,
          suffixIcon: IconButton(
            onPressed: press,
            icon: Icon(suffixIcon),
          ),
        ),
      ),
    );
