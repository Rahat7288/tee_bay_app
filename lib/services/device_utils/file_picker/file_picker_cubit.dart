import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tee_bay_app/services/utils/utils.dart';

import 'file_picker_state.dart';

class FilePickerCubit extends Cubit<FilePickerState> {
  FilePickerCubit() : super(FilePickerState());

  bool? response;

  Future<void> pickedImage(ImageSource source, context) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (kDebugMode) {
        print('printing the file path');
      }

      if (pickedFile != null) {
        Utils.customSnackBar(
            context: context,
            snackText: "Image Captured",
            snaackBarBehavior: SnackBarBehavior.floating,
            backgroundColor: Colors.black38);
        emit(state.copyWith(imageFile: File(pickedFile.path)));
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
