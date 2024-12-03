import 'package:flutter/material.dart';

import '../../../resources/reusable_widgets/buttons/toggle_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ToggleButton(),
      ),
    );
  }
}
