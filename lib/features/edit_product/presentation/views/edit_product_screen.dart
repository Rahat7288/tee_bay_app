import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/text_style/text_style.dart';
import '../../../../resources/reusable_widgets/text_inputs/custom_text_field.dart';
import '../../../../resources/reusable_widgets/text_inputs/custome_multiline_text_field.dart';
import '../../../create_product/domain/view_models/create_product_view_model/create_product_cubit.dart';
import '../../../home_screen/data/models/product_model.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key, required this.product});
  final ProductModel product;

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
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

    final TextEditingController priceController = TextEditingController();
    final TextEditingController rentPriceController = TextEditingController();
    const List<String> list = <String>[
      'Per day',
      'Per hours',
    ];
    String dropdownValue = list.first;
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'EDIT PRODUCT',
          style: TStyle.subTitle(color: AppColor.titleTextColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: TStyle.subTitle(
                  color: AppColor.titleTextColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: titleController,
                type: TextInputType.text,
                labelText: widget.product.title,
                hintText: 'Product Title',
                onChanged: (value) {
                  context
                      .read<CreateProductCubit>()
                      .updateFormData('title', value);
                },
              ),
              const SizedBox(
                height: 20,
              ),

              // dropdown=========
              Text(
                'Select categories',
                style: TStyle.subTitle(
                  color: AppColor.titleTextColor,
                ),
              ),
              const SizedBox(
                height: 10,
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
                    selectedIcon:
                        const Icon(Icons.check_box, color: Colors.green),
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

              const SizedBox(
                height: 20,
              ),

              ///descriptions===========
              Text(
                'Description',
                style: TStyle.subTitle(
                  color: AppColor.titleTextColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              customMultilineTextField(
                controller: descriptionController,
                onChanged: (value) {
                  context
                      .read<CreateProductCubit>()
                      .updateFormData('description', value);
                },
              ),
              const SizedBox(
                height: 20,
              ),

              ///price section ===========
              Text(
                'Select price',
                style: TStyle.subTitle(
                  color: AppColor.titleTextColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: priceController,
                type: TextInputType.text,
                labelText: widget.product.price,
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
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: CustomTextField(
                  controller: rentPriceController,
                  type: TextInputType.text,
                  labelText: widget.product.rentalPrice,
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
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
