import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tee_bay_app/core/utils/utils.dart';

import '../../../home_screen/views/home_screen.dart';
import '../../repositories/auth_repository/auth_repository_impl.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  final _authRepository = AuthRepositoryImpl();

  void login(email, password, context) {
    Utils.hideKeyboard();
    if (kDebugMode) {
      print("user email $email");
    }
    dynamic data = {
      "email": email,
      "password": password,
    };

    _authRepository.login(context: context, payload: data).then((value) {
      emit(LoginStateLoading());
      if (kDebugMode) {
        print("login value $value");
      }
      if (value['message'] == "Login successful") {
        emit(LoginSuccess(loginResponseModel: value));
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }).onError((error, stackTrace) {
      emit(LoginFailure(message: error.toString()));
    });
  }
}
