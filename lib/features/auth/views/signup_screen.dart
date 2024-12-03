import 'package:flutter/material.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/text_style/text_style.dart';
import '../../../core/utils/utils.dart';
import '../../../resources/reusable_widgets/buttons/wide_button.dart';
import '../../../resources/reusable_widgets/text_inputs/custom_password_field.dart';
import '../../../resources/reusable_widgets/text_inputs/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    final double mHeight = MediaQuery.of(context).size.height;
    final double mWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        Utils.hideKeyboard;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            height: mHeight,
            width: mWidth,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'SIGN IN',
                    style: TStyle.title(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  customInputField(
                    controller: _firstNameController,
                    type: TextInputType.text,
                    labelText: 'First Name',
                    hintText: 'First Name',
                    onChanged: (String value) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customInputField(
                    controller: _lastNameController,
                    type: TextInputType.text,
                    labelText: 'last Name',
                    hintText: 'Last Name',
                    onChanged: (String value) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customInputField(
                    controller: _addressController,
                    type: TextInputType.text,
                    labelText: 'Address',
                    hintText: 'Address',
                    onChanged: (String value) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customInputField(
                    controller: _phoneController,
                    type: TextInputType.text,
                    labelText: 'Phone Number',
                    hintText: 'phone Number',
                    onChanged: (String value) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customPasswordField(
                      controller: _passwordController,
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
                    height: 10,
                  ),
                  customPasswordField(
                      controller: _confirmPasswordController,
                      labelText: 'Confirm Password',
                      hintText: 'Confirm Password',
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
                    buttonName: 'REGISTER',
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
                        "Already have an account?",
                        style: TStyle.subTitle(color: AppColor.subTitleColor),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Sign In',
                          style: TStyle.subTitle(
                              color: AppColor.primaryButtonColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
