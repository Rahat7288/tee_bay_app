import 'package:flutter/material.dart';
import 'package:tee_bay_app/core/app_theme/app_colors.dart';
import 'package:tee_bay_app/core/text_style/text_style.dart';

import '../../../resources/drawer/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: appDrawer(context: context),
        ),
        appBar: AppBar(
          title: Text(
            'ALL PRODUCTS',
            style: TStyle.subTitle(color: AppColor.titleTextColor),
          ),
        ),
        body: ListView.separated(
          itemCount: 25,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            return _buildItemCart();
          },
        ));
  }

  Widget _buildItemCart() {
    String title = 'Title';
    String subTitle = 'Category';
    String price = 'Price';
    String content =
        ' content content content content content content content ';
    String postedDate = 'postedDate';
    String views = 'Views';
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
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
              Text(subTitle),
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
              Text(price),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            content,
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
    );
  }
}
