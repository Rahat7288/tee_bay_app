import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../core/text_style/text_style.dart';
import '../../../../../resources/reusable_widgets/buttons/wide_button.dart';
import '../../../../../services/device_utils/file_picker/file_picker_cubit.dart';
import '../../../../../services/device_utils/file_picker/file_picker_state.dart';

class StepFourForm extends StatelessWidget {
  const StepFourForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilePickerCubit, FilePickerState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Upload Product Picture',
                style: TStyle.title(
                  color: AppColor.titleTextColor,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              wideButton(
                press: () {
                  context
                      .read<FilePickerCubit>()
                      .pickedImage(ImageSource.camera, context);
                },
                width: MediaQuery.of(context).size.width * .8,
                buttonName: 'Take Picture using Camera',
                backgroundColor: AppColor.primaryButtonColor,
                forgroundColor: AppColor.buttonTextColor,
              ),
              const SizedBox(
                height: 20,
              ),
              wideButton(
                press: () {
                  context
                      .read<FilePickerCubit>()
                      .pickedImage(ImageSource.gallery, context);
                },
                width: MediaQuery.of(context).size.width * .8,
                buttonName: 'Upload Picture from Device',
                backgroundColor: AppColor.primaryButtonColor,
                forgroundColor: AppColor.buttonTextColor,
              ),
              const SizedBox(
                height: 20,
              ),
              state.imageFile != null
                  ? Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.file(
                            state.imageFile as File,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        );
      },
    );
  }
}
