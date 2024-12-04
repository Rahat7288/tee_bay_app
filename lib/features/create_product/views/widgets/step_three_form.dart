import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/text_style/text_style.dart';
import '../../../../resources/reusable_widgets/text_inputs/custome_multiline_text_field.dart';

class StepThreeForm extends StatelessWidget {
  const StepThreeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _descriptionController = TextEditingController();
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Add Description',
            style: TStyle.title(
              color: AppColor.titleTextColor,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          customMultilineTextField(
            controller: _descriptionController,
            onChanged: (String value) {},
          ),
        ],
      ),
    );
  }
}
