import 'package:flutter/material.dart';
import 'package:tee_bay_app/features/product_details/presentation/views/widgets/custom_date_picker.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/text_style/text_style.dart';
import '../../../../resources/alert_dialogs/alert_dialogs.dart';
import '../../../../resources/reusable_widgets/buttons/wide_button.dart';
import '../../../home_screen/data/models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    String title = 'Title';
    String category = 'category';
    String price = 'price';

    String content =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'PRODUCT DETAILS',
          style: TStyle.subTitle(color: AppColor.titleTextColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                productModel.title,
                style: TStyle.title(
                  color: AppColor.titleTextColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${productModel.category}',
                style: TStyle.subTitle(
                  color: AppColor.subTitleColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                productModel.price,
                style: TStyle.subTitle(
                  color: AppColor.subTitleColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                productModel.description,
                style: TStyle.contentText(
                  color: AppColor.contentTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          wideButton(
            width: 100.0,
            press: () => showDialog(
              context: context,
              builder: (BuildContext context) => const AlertDialogs(
                child: CustomDatePicker(),
              ),
            ),
            buttonName: 'Rent',
            backgroundColor: AppColor.primaryButtonColor,
            forgroundColor: AppColor.buttonTextColor,
          ),
          const SizedBox(
            width: 10,
          ),
          wideButton(
            width: 100.0,
            press: () => showDialog(
              context: context,
              builder: (BuildContext context) => const AlertDialogs(
                child: CustomDatePicker(),
              ),
            ),
            buttonName: 'Buy',
            backgroundColor: AppColor.primaryButtonColor,
            forgroundColor: AppColor.buttonTextColor,
          ),
        ],
      ),
    );
  }
}
