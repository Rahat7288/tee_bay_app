class HomeScreenState {
  final bool myProduct;

  HomeScreenState({required this.myProduct});

  HomeScreenState copyWith({
    bool? myProduct,
  }) {
    return HomeScreenState(
      myProduct: myProduct ?? this.myProduct,
    );
  }
}
