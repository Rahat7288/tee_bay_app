import 'package:flutter/material.dart';

import '../../../resources/reusable_widgets/text_inputs/custom_password_field.dart';
import '../../../resources/reusable_widgets/text_inputs/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _inputController = TextEditingController();
  final _passWordController = TextEditingController();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        customInputField(
          controller: _inputController,
          type: TextInputType.text,
          labelText: 'User Name',
          hintText: 'User Name',
          onChanged: (String value) {},
        ),
        const SizedBox(
          height: 10,
        ),
        customPasswordField(
            controller: _passWordController,
            labelText: 'Password',
            hintText: 'Password',
            isObscure: isObscure,
            suffixIcon: isObscure ? Icons.visibility_off : Icons.visibility,
            onChanged: (String value) {},
            textInputAction: TextInputAction.done,
            press: () {
              setState(() {
                isObscure = !isObscure;
              });
            }),
      ],
    ));
  }
}
