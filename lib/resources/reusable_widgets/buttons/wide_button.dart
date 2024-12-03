import 'package:flutter/material.dart';
import 'package:tee_bay_app/core/text_style/text_style.dart';

import '../../../core/app_theme/app_colors.dart';

Widget wideButton({
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
      width: width ?? 200,
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
