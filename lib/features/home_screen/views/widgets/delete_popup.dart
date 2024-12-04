import 'package:flutter/material.dart';
import 'package:tee_bay_app/core/app_theme/app_colors.dart';
import 'package:tee_bay_app/core/text_style/text_style.dart';

import '../../../../resources/reusable_widgets/buttons/small_button.dart';

///delete popup body to delete specific product

Widget deletePopup() => SizedBox(
      child: Column(
        children: [
          Text(
            'Are you sure you want to delete this product?',
            style: TStyle.title(
              color: AppColor.titleTextColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              smallButton(
                press: () {},
                buttonName: 'No',
                width: 150.0,
                backgroundColor: AppColor.redButtonColor,
                forgroundColor: AppColor.backGroundColor,
              ),
              smallButton(
                press: () {},
                buttonName: 'Yes',
                width: 150.0,
                backgroundColor: AppColor.primaryButtonColor,
                forgroundColor: AppColor.backGroundColor,
              ),
            ],
          )
        ],
      ),
    );
