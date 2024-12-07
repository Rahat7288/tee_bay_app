class CreateProductState {
  final Map<String, dynamic> formData;

  CreateProductState({required this.formData});

  CreateProductState copyWith({
    Map<String, dynamic>? formData,
  }) {
    return CreateProductState(
      formData: formData ?? this.formData,
    );
  }
}
