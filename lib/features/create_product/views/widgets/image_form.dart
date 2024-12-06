import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/text_style/text_style.dart';
import '../../../../resources/reusable_widgets/buttons/wide_button.dart';

class StepFourForm extends StatelessWidget {
  const StepFourForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Upload Product Picture',
            style: TStyle.title(
              color: AppColor.titleTextColor,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          wideButton(
            press: () {},
            width: MediaQuery.of(context).size.width * .8,
            buttonName: 'Take Picture using Camera',
            backgroundColor: AppColor.primaryButtonColor,
            forgroundColor: AppColor.buttonTextColor,
          ),
          const SizedBox(
            height: 20,
          ),
          wideButton(
            press: () {},
            width: MediaQuery.of(context).size.width * .8,
            buttonName: 'Upload Picture from Device',
            backgroundColor: AppColor.primaryButtonColor,
            forgroundColor: AppColor.buttonTextColor,
          ),
        ],
      ),
    );
  }
}
