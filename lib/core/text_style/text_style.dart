import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tee_bay_app/core/app_theme/app_colors.dart';

const _textFont = GoogleFonts.inter;

_textReturnElement({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return _textFont(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

class TStyle {
  //title text style==========
  static TextStyle title({
    Color? color,
    bool whiteText = false,
  }) {
    return _textReturnElement(
      color: color ?? (whiteText ? AppColor.titleTextColor : Colors.black),
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }

  //subTitle text style==========

  static TextStyle subTitle({Color? color, bool whiteText = false}) {
    return _textReturnElement(
      color: color ?? (whiteText ? AppColor.subTitleColor : Colors.grey),
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }

  //content text style==========

  static TextStyle contentText({Color? color, bool whiteText = false}) {
    return _textReturnElement(
      color: color ?? (whiteText ? AppColor.contentTextColor : Colors.black12),
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
  }
}
