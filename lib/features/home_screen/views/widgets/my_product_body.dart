import 'package:flutter/material.dart';

import 'my_product_cart.dart';

Widget myProductBody() => Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        itemCount: 25,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return myProductCart(context: context);
        },
      ),
    );
