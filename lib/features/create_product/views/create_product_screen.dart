import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/text_style/text_style.dart';
import '../../../resources/reusable_widgets/buttons/small_button.dart';
import '../../../services/utils/utils.dart';
import '../view_models/cubits/progress_cubit.dart';
import '../view_models/cubits/progress_state.dart';
import '../view_models/services/form_list.dart';
import 'widgets/progress_bar.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        Utils.hideKeyboard;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'CREATE PRODUCT',
            style: TStyle.subTitle(color: AppColor.titleTextColor),
          ),
        ),
        body: BlocBuilder<ProgressCubit, ProgressState>(
            builder: (context, state) {
          return Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: ProgressBar(
                  currentStep: state.currentStep,
                  totalSteps: state.totalSteps,
                ),
              ),
              Expanded(
                child: fromSteps[state.currentStep],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: state.currentStep == 0
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceAround,
                  children: [
                    state.currentStep == 0
                        ? const SizedBox()
                        : smallButton(
                            press: () =>
                                context.read<ProgressCubit>().previousStep(),
                            buttonName: 'Back',
                            width: 150.0,
                            backgroundColor: AppColor.primaryButtonColor,
                            forgroundColor: AppColor.backGroundColor,
                          ),
                    smallButton(
                      press: () => context.read<ProgressCubit>().nextStep(),
                      buttonName: state.currentStep + 1 == fromSteps.length
                          ? 'Submit'
                          : 'Next',
                      width: 150.0,
                      backgroundColor: AppColor.primaryButtonColor,
                      forgroundColor: AppColor.backGroundColor,
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
