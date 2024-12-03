import 'package:flutter/material.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/text_style/text_style.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CREATE PRODUCT',
          style: TStyle.subTitle(color: AppColor.titleTextColor),
        ),
      ),
    );
  }
}
