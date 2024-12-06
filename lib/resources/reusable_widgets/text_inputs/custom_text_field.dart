import 'package:flutter/material.dart';

import '../../../services/utils/form_validation_maxin.dart';

class CustomTextField extends StatelessWidget with FormValidationMixin {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.type,
      required this.labelText,
      required this.hintText,
      required this.onChanged});
  final TextEditingController controller;
  final TextInputType type;
  final String labelText;
  final String hintText;
  final ValueChanged<String> onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
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
        validator: validateRequiredFiled,
      ),
    );
  }
}
