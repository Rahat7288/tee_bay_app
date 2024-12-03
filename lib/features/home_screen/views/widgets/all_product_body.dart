import 'package:flutter/material.dart';
import 'package:tee_bay_app/features/home_screen/views/widgets/product_cart.dart';

import '../../../product_details/views/product_details_screen.dart';

Widget allProductBody({required BuildContext context}) => GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (contex) => const ProductDetailsScreen(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.separated(
          itemCount: 25,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            return productCart();
          },
        ),
      ),
    );
