import 'package:flutter/material.dart';
import 'package:tee_bay_app/features/home_screen/presentation/views/widgets/product_cart.dart';

Widget allProductBody() => Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        itemCount: 25,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return productCart(context: context);
        },
      ),
    );
