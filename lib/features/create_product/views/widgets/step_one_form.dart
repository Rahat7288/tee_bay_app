import 'package:flutter/material.dart';
import 'package:tee_bay_app/core/app_theme/app_colors.dart';
import 'package:tee_bay_app/core/text_style/text_style.dart';

class StepOneForm extends StatelessWidget {
  const StepOneForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        children: [
          Text(
            'Select a title for your product',
            style: TStyle.title(
              color: AppColor.titleTextColor,
            ),
          )
        ],
      ),
    );
  }
}
