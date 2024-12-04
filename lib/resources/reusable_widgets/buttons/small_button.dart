import 'package:flutter/material.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/text_style/text_style.dart';

///reusable button for form Screens and alert dialogs
Widget smallButton({
  required Function() press,
  required String buttonName,
  Color? backgroundColor,
  forgroundColor,
  double? radius,
  height,
  width,
}) =>
    SizedBox(
      height: height ?? 50,
      width: width ?? 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: forgroundColor,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 10),
            )),
        onPressed: press,
        child: Text(
          buttonName,
          style: TStyle.subTitle(
            color: AppColor.buttonTextColor,
          ),
        ),
      ),
    );
