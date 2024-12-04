import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget customMultilineTextField({
  required TextEditingController controller,
  String? labelText,
  hintText,
  counterText,
  required ValueChanged<String> onChanged,
  TextInputType? textInputType,
  TextInputAction? TeInputAction,
  int? maxLength,
  minLines,
  maxLines,
}) =>
    TextField(
      controller: controller,
      minLines: minLines ?? 6,
      maxLines: maxLines ?? 8,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: labelText,
          hintText: hintText,
          counterText: counterText),
      onChanged: onChanged,
      keyboardType: textInputType,
      textInputAction: TeInputAction,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
      ],
    );
