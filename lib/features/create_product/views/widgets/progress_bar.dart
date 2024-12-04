import 'package:flutter/material.dart';
import 'package:tee_bay_app/core/app_theme/app_colors.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar(
      {super.key, required this.currentStep, required this.totalSteps});
  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: 20,
      value: currentStep + 1,
      backgroundColor: Colors.grey[300],
      color: AppColor.activeProgressColor,
    );
  }
}
