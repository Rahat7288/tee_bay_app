import 'package:flutter/material.dart';

import '../../../services/utils/form_validation_maxin.dart';

class CustomPasswordField extends StatelessWidget with FormValidationMixin {
  const CustomPasswordField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.hintText,
      required this.isObscure,
      required this.suffixIcon,
      required this.onChanged,
      required this.textInputAction,
      required this.press});
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isObscure;
  final IconData suffixIcon;
  final ValueChanged<String> onChanged;
  final TextInputAction textInputAction;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controller,
        obscureText: isObscure,
        validator: validatePassword,
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
  }
}
