import 'package:flutter/material.dart';

import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../core/text_style/text_style.dart';
import '../../../../../resources/alert_dialogs/alert_dialogs.dart';
import '../../../../edit_product/presentation/views/edit_product_screen.dart';
import '../../../data/models/product_model.dart';
import 'delete_popup.dart';

Widget myProductCart({required BuildContext context, ProductModel? products}) {
  String title = 'Title';
  String subTitle = 'Category';
  String price = 'Price';
  String content = ' content content content content content content content ';
  String postedDate = 'postedDate';
  String views = 'Views';
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EditProductScreen(
                product: products!,
              )));
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColor.borderColor,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products?.title ?? 'Title',
                  style: TStyle.title(),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      '$subTitle :',
                      style: TStyle.subTitle(
                        color: AppColor.subTitleColor,
                      ),
                    ),
                    Text(
                      '${products?.category[0] ?? ''} ',
                      style: TStyle.subTitle(
                        color: AppColor.subTitleColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      '$price :',
                      style: TStyle.subTitle(
                        color: AppColor.subTitleColor,
                      ),
                    ),
                    Text(
                      products?.price ?? 'Price',
                      style: TStyle.subTitle(
                        color: AppColor.subTitleColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  products?.description ?? '',
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: TStyle.contentText(
                    color: AppColor.contentTextColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        postedDate,
                        style: TStyle.subTitle(color: AppColor.subTitleColor),
                      ),
                    ),
                    Text(
                      views,
                      style: TStyle.subTitle(color: AppColor.subTitleColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialogs(
                child: deletePopup(),
              ),
            ),
            icon: const Icon(
              Icons.delete,
              color: AppColor.subTitleColor,
            ),
          ),
        ],
      ),
    ),
  );
}
