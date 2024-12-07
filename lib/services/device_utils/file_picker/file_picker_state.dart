import 'dart:io';

import 'package:equatable/equatable.dart';

class FilePickerState extends Equatable {
  final File? imageFile;
  final bool? response;

  const FilePickerState({
    this.imageFile,
    this.response,
  });
  @override
  List<Object?> get props => [imageFile, response];

  FilePickerState copyWith({
    File? imageFile,
    bool? response,
  }) {
    return FilePickerState(
      imageFile: imageFile ?? this.imageFile,
      response: response ?? this.response,
    );
  }
}
