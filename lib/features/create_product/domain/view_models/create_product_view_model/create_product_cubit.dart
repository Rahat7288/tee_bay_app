import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository_impl/create_product_repository_impl.dart';
import 'create_product_state.dart';

class CreateProductCubit extends Cubit<CreateProductState> {
  CreateProductCubit() : super(CreateProductState(formData: {}));

  final _createProdRepo = CreteProductRepositoryImpl();

  void updateFormData(String key, dynamic value) {
    final updatedData = Map<String, dynamic>.from(state.formData);
    updatedData[key] = value;
    emit(state.copyWith(formData: updatedData));
  }
}
