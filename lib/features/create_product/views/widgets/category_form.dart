import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/text_style/text_style.dart';
import '../../view_models/create_product_view_model/create_product_cubit.dart';

class StepTwoForm extends StatelessWidget {
  const StepTwoForm({super.key});

  @override
  Widget build(BuildContext context) {
    var items = [
      DropdownItem(label: 'Electronics', value: 'Electronics'),
      DropdownItem(label: 'Furniture', value: 'Furniture'),
      DropdownItem(label: 'Home Appliances', value: 'Home Appliances'),
      DropdownItem(label: 'Sporting Goods', value: 'Sporting Goods'),
      DropdownItem(label: 'Outdoors', value: 'Outdoors'),
      DropdownItem(label: 'Toys', value: 'Toys'),
    ];
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Select categories',
            style: TStyle.title(
              color: AppColor.titleTextColor,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          DropdownButtonHideUnderline(
            child: MultiDropdown(
              items: items,
              // controller: controller,
              enabled: true,
              searchEnabled: true,
              chipDecoration: const ChipDecoration(
                backgroundColor: Colors.yellow,
                wrap: true,
                runSpacing: 2,
                spacing: 10,
              ),
              fieldDecoration: FieldDecoration(
                hintText: 'Select a category',
                hintStyle: const TextStyle(color: Colors.black87),
                showClearIcon: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.black87,
                  ),
                ),
              ),
              dropdownDecoration: const DropdownDecoration(
                marginTop: 0,
                maxHeight: 500,
                header: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Select categories from the list',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              dropdownItemDecoration: DropdownItemDecoration(
                selectedIcon: const Icon(Icons.check_box, color: Colors.green),
                disabledIcon: Icon(Icons.lock, color: Colors.grey.shade300),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a country';
                }
                return null;
              },
              onSelectionChange: (selectedItems) {
                debugPrint("OnSelectionChange: $selectedItems");
                context
                    .read<CreateProductCubit>()
                    .updateFormData("category", selectedItems);
              },
            ),
          ),
        ],
      ),
    );
  }
}
