import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/text_style/text_style.dart';

class StepSixForm extends StatelessWidget {
  const StepSixForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Summary',
            style: TStyle.title(
              color: AppColor.titleTextColor,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Title: ',
            style: TStyle.subTitle(color: AppColor.subTitleColor),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Categories: ',
            style: TStyle.subTitle(color: AppColor.subTitleColor),
          ),
          Text(
            'Electronics, Toys',
            style: TStyle.subTitle(color: AppColor.subTitleColor),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Descriptions',
            style: TStyle.subTitle(color: AppColor.subTitleColor),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Price:',
            style: TStyle.subTitle(color: AppColor.subTitleColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'To rent:',
            style: TStyle.subTitle(color: AppColor.subTitleColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'per day:',
            style: TStyle.subTitle(color: AppColor.subTitleColor),
          ),
        ],
      ),
    );
  }
}
