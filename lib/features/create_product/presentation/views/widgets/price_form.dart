import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../core/text_style/text_style.dart';
import '../../../../../resources/reusable_widgets/text_inputs/custom_text_field.dart';
import '../../../domain/view_models/create_product_view_model/create_product_cubit.dart';

class StepFiveForm extends StatefulWidget {
  const StepFiveForm({super.key});

  @override
  State<StepFiveForm> createState() => _StepFiveFormState();
}

class _StepFiveFormState extends State<StepFiveForm> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController priceController = TextEditingController();
    final TextEditingController rentPriceController = TextEditingController();
    const List<String> list = <String>[
      'Per day',
      'Per hours',
    ];
    String dropdownValue = list.first;
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: SingleChildScrollView(
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
            CustomTextField(
              controller: priceController,
              type: TextInputType.text,
              labelText: 'Purchase Price',
              hintText: 'Purchase Price',
              onChanged: (value) {
                context
                    .read<CreateProductCubit>()
                    .updateFormData('price', value);
              },
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
              child: CustomTextField(
                controller: rentPriceController,
                type: TextInputType.text,
                labelText: 'Rent Price',
                hintText: 'Rent Price',
                onChanged: (value) {
                  context
                      .read<CreateProductCubit>()
                      .updateFormData('rent', value);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownMenu<String>(
              initialSelection: list.first,
              onSelected: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                  context
                      .read<CreateProductCubit>()
                      .updateFormData('price_unit', dropdownValue);
                });
              },
              dropdownMenuEntries:
                  list.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
