import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../services/utils/utils.dart';
import '../../../../home_screen/presentation/views/home_screen.dart';
import '../../../data/repository_impl/auth_repository_impl.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  final _authRepository = AuthRepositoryImpl();

  ///function for login service ========
  void login(email, password, context) {
    Utils.hideKeyboard();
    if (kDebugMode) {
      print("user email $email");
    }
    Map data = {
      "email": email,
      "password": password,
    };

    final Map header = {
      "Content-Type": "application/json",
    };

    _authRepository
        .login(context: context, payload: data, header: header)
        .then((value) {
      emit(LoginStateLoading());
      if (kDebugMode) {
        print("login value $value");
      }
      if (value.message == "Login successful") {
        emit(LoginSuccess(loginResponseModel: value!));
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        emit(LoginFailure(message: 'Invalid user '));
      }
    }).onError((error, stackTrace) {
      emit(LoginFailure(message: error.toString()));
    });
  }

  ///signup or registration service ========
}
