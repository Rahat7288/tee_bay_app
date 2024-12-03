import 'package:flutter/material.dart';

import '../../../resources/reusable_widgets/text_inputs/custom_password_field.dart';
import '../../../resources/reusable_widgets/text_inputs/custom_text_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _inputController = TextEditingController();
  final _passWordController = TextEditingController();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    final double mWidth = MediaQuery.of(context).size.width;
    final double mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: mHeight,
        width: mWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
        ),
      ),
    );
  }
}
