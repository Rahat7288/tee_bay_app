import 'package:flutter/material.dart';
import 'package:tee_bay_app/core/app_theme/app_colors.dart';
import 'package:tee_bay_app/core/text_style/text_style.dart';
import 'package:tee_bay_app/features/home_screen/views/widgets/all_product_body.dart';

import '../../../resources/drawer/app_drawer.dart';
import 'widgets/my_product_body.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool myProduct = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: appDrawer(context: context),
      ),
      appBar: AppBar(
        title: Text(
          myProduct ? 'MY PRODUCT' : 'ALL PRODUCTS',
          style: TStyle.subTitle(color: AppColor.titleTextColor),
        ),
      ),
      body: myProduct ? myProductBody() : allProductBody(context: context),
      floatingActionButton: myProduct
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
