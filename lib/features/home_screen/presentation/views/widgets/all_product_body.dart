import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tee_bay_app/features/home_screen/presentation/views/widgets/product_cart.dart';

import '../../../data/models/product_model.dart';
import '../../../domain/view_models/all_product_view_model/all_product_cubit.dart';
import '../../../domain/view_models/all_product_view_model/all_product_state.dart';

Widget allProductBody() => BlocBuilder<AllProductCubit, AllProductState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.separated(
            itemCount: products.length,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return productCart(context: context, product: products[index]);
            },
          ),
        );
      },
    );
