import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/text_style/text_style.dart';

class StepThreeForm extends StatelessWidget {
  const StepThreeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        children: [
          Text(
            'Add Description',
            style: TStyle.title(
              color: AppColor.titleTextColor,
            ),
          )
        ],
      ),
    );
  }
}
