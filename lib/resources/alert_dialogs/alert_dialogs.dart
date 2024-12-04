import 'package:flutter/material.dart';

class AlertDialogs extends StatelessWidget {
  const AlertDialogs({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double mHeight = MediaQuery.of(context).size.height;
    final double mWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      insetPadding: const EdgeInsets.all(10),
      content: SizedBox(
        height: mHeight * .2,
        width: mWidth,
        child: child,
      ),
    );
  }
}