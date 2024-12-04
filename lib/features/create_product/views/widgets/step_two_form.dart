import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/text_style/text_style.dart';

class StepTwoForm extends StatelessWidget {
  const StepTwoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        children: [
          Text(
            'Select categories',
            style: TStyle.title(
              color: AppColor.titleTextColor,
            ),
          )
        ],
      ),
    );
  }
}
