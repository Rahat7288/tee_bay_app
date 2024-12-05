import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/auth_repository/auth_repository_impl.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  final _authRepository = AuthRepositoryImpl();

  void login(String email, String password, context) {
    if (kDebugMode) {
      print("user email $email");
    }
    Map data = {
      'email': email,
      'password': password,
    };

    emit(LoginStateLoading());

    _authRepository.login(context: context, payload: data).then((value) {
      emit(LoginSuccess(loginResponseModel: value));
    }).onError((error, stackTrace) {
      emit(LoginFailure(message: error.toString()));
    });
  }
}
