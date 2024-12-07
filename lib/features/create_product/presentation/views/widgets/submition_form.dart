import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../core/text_style/text_style.dart';
import '../../../domain/view_models/create_product_view_model/create_product_cubit.dart';

class StepSixForm extends StatelessWidget {
  const StepSixForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formData = context.read<CreateProductCubit>().state.formData;
    final File? image = formData['image'];
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
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width * .7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.file(
                  image as File,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Title: ${formData['title']}',
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
            '${formData['category']}',
            style: TStyle.subTitle(color: AppColor.subTitleColor),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Descriptions : ${formData['description']}',
            style: TStyle.subTitle(color: AppColor.subTitleColor),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Price: ${formData['price']}',
            style: TStyle.subTitle(color: AppColor.subTitleColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'To rent: ${formData['rent']}',
            style: TStyle.subTitle(color: AppColor.subTitleColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${formData['price_unit'] ?? 'per day'}',
            style: TStyle.subTitle(color: AppColor.subTitleColor),
          ),
        ],
      ),
    );
  }
}
