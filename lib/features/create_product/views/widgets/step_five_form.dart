import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/text_style/text_style.dart';

class StepFiveForm extends StatelessWidget {
  const StepFiveForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        children: [
          Text(
            'Select price',
            style: TStyle.title(
              color: AppColor.titleTextColor,
            ),
          )
        ],
      ),
    );
  }
}
