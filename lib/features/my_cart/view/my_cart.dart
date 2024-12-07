import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/text_style/text_style.dart';
import '../view_models/post_cubit/post_cubit.dart';
import '../view_models/post_cubit/post_state.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
          return SizedBox(
            height: mHeight,
            width: mWidth,
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    context.read<PostCubit>().getAllPost(context);
                  },
                  child: Text("get Post")),
            ),
          );
        },
      ),
    );
  }
}
