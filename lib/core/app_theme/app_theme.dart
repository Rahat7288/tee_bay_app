import 'package:flutter/material.dart';
import 'package:tee_bay_app/core/app_theme/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.backGroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.backGroundColor,
      foregroundColor: AppColor.titleTextColor,
      centerTitle: true,
      elevation: 0,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ));
}
