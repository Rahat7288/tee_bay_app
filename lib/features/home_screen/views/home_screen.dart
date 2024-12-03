import 'package:flutter/material.dart';

import '../../../resources/reusable_widgets/text_inputs/custom_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _inputController = TextEditingController();
    return Scaffold(
      body: Center(
        child: customInputField(
          controller: _inputController,
          type: TextInputType.text,
          labelText: 'User Name',
          hintText: 'User Name',
          onChanged: (String value) {},
        ),
      ),
    );
  }
}
