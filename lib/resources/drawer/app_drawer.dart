import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tee_bay_app/core/app_theme/app_colors.dart';
import 'package:tee_bay_app/core/text_style/text_style.dart';

import '../../features/home_screen/view_models/home_screen_cubit/home_screen_cubit.dart';
import '../reusable_widgets/buttons/wide_button.dart';

Widget appDrawer({required BuildContext context}) => Container(
      color: AppColor.backGroundColor,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            //height: 300,
            width: MediaQuery.of(context).size.width * .8,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: AppColor.borderColor,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                        imageUrl:
                            'https://banner2.cleanpng.com/20180404/sqe/avhxkafxo.webp'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Rahat Islam Akash',
                  style: TStyle.subTitle(
                    color: AppColor.titleTextColor,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width * .8,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: AppColor.borderColor,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                wideButton(
                  press: () {
                    context.read<HomeScreenCubit>().toggleToMtProduct();
                  },
                  width: MediaQuery.of(context).size.width,
                  buttonName: 'My Products',
                  backgroundColor: AppColor.primaryButtonColor,
                  forgroundColor: AppColor.buttonTextColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                wideButton(
                  press: () {
                    context.read<HomeScreenCubit>().toggleToAllProduct();
                  },
                  width: MediaQuery.of(context).size.width,
                  buttonName: 'All Products',
                  backgroundColor: AppColor.primaryButtonColor,
                  forgroundColor: AppColor.buttonTextColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                wideButton(
                  press: () {},
                  width: MediaQuery.of(context).size.width,
                  buttonName: 'My Cart',
                  backgroundColor: AppColor.primaryButtonColor,
                  forgroundColor: AppColor.buttonTextColor,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: wideButton(
              press: () {},
              buttonName: 'Logout',
              backgroundColor: AppColor.redButtonColor,
              forgroundColor: AppColor.buttonTextColor,
            ),
          )
        ],
      ),
    );
