import 'package:flutter/material.dart';
import 'package:tee_bay_app/core/app_theme/app_colors.dart';
import 'package:tee_bay_app/core/text_style/text_style.dart';

import '../../../core/utils/utils.dart';
import '../../../resources/reusable_widgets/buttons/wide_button.dart';
import '../../../resources/reusable_widgets/text_inputs/custom_password_field.dart';
import '../../../resources/reusable_widgets/text_inputs/custom_text_field.dart';
import 'signup_screen.dart';

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        Utils.hideKeyboard;
      },
      child: Scaffold(
        body: SizedBox(
          height: mHeight,
          width: mWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SIGN IN',
                style: TStyle.title(),
              ),
              SizedBox(
                height: mHeight * .15,
              ),
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
                  suffixIcon:
                      isObscure ? Icons.visibility_off : Icons.visibility,
                  onChanged: (String value) {},
                  textInputAction: TextInputAction.done,
                  press: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  }),
              const SizedBox(
                height: 50,
              ),
              wideButton(
                press: () {},
                buttonName: 'LOGIN',
                backgroundColor: AppColor.primaryButtonColor,
                forgroundColor: AppColor.buttonTextColor,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TStyle.subTitle(color: AppColor.subTitleColor),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignupScreen()));
                    },
                    child: Text(
                      'Signup',
                      style:
                          TStyle.subTitle(color: AppColor.primaryButtonColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
