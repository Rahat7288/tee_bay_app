import 'package:flutter/material.dart';
import 'package:tee_bay_app/core/app_theme/app_colors.dart';
import 'package:tee_bay_app/core/text_style/text_style.dart';

import '../../../resources/drawer/app_drawer.dart';
import 'widgets/my_product_body.dart';

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
      body: myProductBody(),
    );
  }
}
