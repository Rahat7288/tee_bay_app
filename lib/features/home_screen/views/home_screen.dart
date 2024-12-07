import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tee_bay_app/core/app_theme/app_colors.dart';
import 'package:tee_bay_app/core/text_style/text_style.dart';
import 'package:tee_bay_app/features/home_screen/views/widgets/all_product_body.dart';

import '../../../resources/drawer/app_drawer.dart';
import '../../create_product/views/create_product_screen.dart';
import '../view_models/home_screen_cubit/home_screen_cubit.dart';
import '../view_models/home_screen_cubit/home_screen_state.dart';
import 'widgets/my_product_body.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool myProduct = true;

  @override
  Widget build(BuildContext context) {
    ///single screen will manage the my product body and all product body
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            child: appDrawer(context: context),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              ///managing app title based on user preference
              state.myProduct ? 'MY PRODUCT' : 'ALL PRODUCTS',
              style: TStyle.subTitle(color: AppColor.titleTextColor),
            ),
          ),

          ///contain the body widget based on user preference
          body: state.myProduct ? myProductBody() : allProductBody(),

          ///floating action button will only appear if the state is my product = true
          floatingActionButton: myProduct
              ? FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CreateProductScreen(),
                      ),
                    );
                  },
                  child: const Icon(Icons.add),
                )
              : null,
        );
      },
    );
  }
}
