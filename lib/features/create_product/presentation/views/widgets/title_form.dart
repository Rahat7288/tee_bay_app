import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tee_bay_app/core/app_theme/app_colors.dart';
import 'package:tee_bay_app/core/text_style/text_style.dart';

import '../../../../../resources/reusable_widgets/text_inputs/custom_text_field.dart';
import '../../../domain/view_models/create_product_view_model/create_product_cubit.dart';

class StepOneForm extends StatelessWidget {
  const StepOneForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Select a title for your product',
            style: TStyle.title(
              color: AppColor.titleTextColor,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            controller: titleController,
            type: TextInputType.text,
            labelText: 'Product Title',
            hintText: 'Product Title',
            onChanged: (value) {
              context.read<CreateProductCubit>().updateFormData('title', value);
            },
          ),
        ],
      ),
    );
  }
}
