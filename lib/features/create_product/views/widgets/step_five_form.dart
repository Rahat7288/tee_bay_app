import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/text_style/text_style.dart';
import '../../../../resources/reusable_widgets/text_inputs/custom_text_field.dart';

class StepFiveForm extends StatelessWidget {
  const StepFiveForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _priceController = TextEditingController();
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Select price',
            style: TStyle.title(
              color: AppColor.titleTextColor,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          customInputField(
            controller: _priceController,
            type: TextInputType.text,
            labelText: 'Purchase Price',
            hintText: 'Purchase Price',
            onChanged: (String value) {},
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Rent',
            style: TStyle.subTitle(
              color: AppColor.subTitleColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            child: customInputField(
              controller: _priceController,
              type: TextInputType.text,
              labelText: 'Rent Price',
              hintText: 'Rent Price',
              onChanged: (String value) {},
            ),
          ),
        ],
      ),
    );
  }
}
