import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/text_style/text_style.dart';
import '../../../home_screen/presentation/views/widgets/product_cart.dart';
import '../../data/models/tab_models.dart';
import '../../domain/view_models/post_cubit/post_cubit.dart';
import '../../domain/view_models/post_cubit/post_state.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TStyle.subTitle(color: AppColor.titleTextColor),
        ),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (kDebugMode) {
            print('priniting state $state');
          }
          return DefaultTabController(
            length: tabs.length,
            child: SizedBox(
              height: mHeight,
              width: mWidth,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      width: mWidth,
                      child: TabBar(
                        physics: const BouncingScrollPhysics(),
                        dividerColor: Colors.transparent,
                        tabs: tabs
                            .map(
                              (tab) => Tab(
                                text: tab ?? 'Button Name',
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ///Bought items list==========
                        ListView.separated(
                          itemCount: 25,
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return productCart(context: context);
                          },
                        ),

                        ///Cold items list==========
                        ListView.separated(
                          itemCount: 25,
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return productCart(context: context);
                          },
                        ),

                        ///Borrowed items list==========
                        ListView.separated(
                          itemCount: 25,
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return productCart(context: context);
                          },
                        ),

                        ///Lent items list==========
                        ListView.separated(
                          itemCount: 25,
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return productCart(context: context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
